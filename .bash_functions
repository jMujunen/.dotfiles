# dependencies: bat, vscodium --profile=Base

# ignore=(.\*\\\[+package.\*\?\\\]+\(\\s+\[\\w\\\{\\s=\"\.\*\\[,:\\}\>\<\@\]\))

source "$ZDOTDIR"/.color_defs.sh

rsync_update(){
  rsync -auXv "$1" "$2" | /home/joona/.local/share/bin/ProgressBar "$(find "$1" | wc -l)"
}
rsync_metadata(){
  rsync -aXv "$1"  "$2" | /home/joona/.local/share/bin/ProgressBar "$(find "$1" | wc -l)"
}
kitty_integration_custom() {

  # Define aliases for kitten commands
  alias diff_='kitten diff'
  alias img='kitten icat'
  alias ssh='kitten ssh'
  alias rglinks='kitty -T "Hyperlinked rip-grep" --hold kitten hyperlinked-grep'
  alias kp=kitty_panel

  # Define function for kitty panel configuration
  kitty_panel() {
    local _panelcfg="/home/joona/.config/kitty/panel.d/bg_padded.conf"
    case "$1" in
    *plain | --no* | *default)
      shift
      kitty +kitten panel --edge=background "$*"
      return $?
      ;;
    *)
      kitty +kitten panel --config="$_panelcfg" --edge=background "$*"
      ;;
    esac
  }

    function iplot {
      cat <<EOF | gnuplot
      set terminal pngcairo enhanced font 'Fira Sans,10'
      set autoscale
      set samples 1000
      set output '|kitten icat --stdin yes'
      set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#fdf6e3" behind
      plot $@
      set output '/dev/null'
EOF
  }

  render() {
    printf "%*s\n" "50" "$1"
    kitten icat "$1"
  }
}
# Check if the terminal is kitty and run custom integration if true
[[ "$TERM" == "xterm-kitty" ]] && kitty_integration_custom

sshkeygen() {
  # Generate SSH keys and copy them to a host
    printhelp() {
       echo -e "Usage: sshkeygen <hostname> <filename>"
       echo -e "\nGenerates an SSH keypair for the specified hostname,"
       echo -e "saves it to the .ssh directory, and copies the key to the host"
       echo -e "\nExample:"
       echo -e "\tsshkeygen joona@10.0.0.50 server_id_rsa"

    }

    # Parse args
    if [[ "$#" -ne 2 ]]; then
      printhelp
      return 1
    elif [[ "$1" == "-h" ]] || [[ "$2" == "--help" ]]; then
      printhelp
      return 0
    fi

    printhelp
    host=$1
    filename=$2

    filepath="$HOME/.ssh/$filename"

    eval "$(ssh-agent -s)";
    ssh-keygen -t ed25519 -a 32 -f "$filepath"
    ssh-add "$filepath"
    ssh-copy-id "$host"
}

brightness() {
    value=$1
    ddcutil --display 1 setvcp 10 "$value" & ddcutil --display 2 setvcp 10 "$value"
}

compile() {
    file="$1"
    if [ ! -n "$file" ]; then
        echo -e "Supply a .pyx file to compile"
        return
    fi
    c_file="$(echo "$file" | cut -d. --fields=1).c"
    output_binary="$(echo "$file" | cut -d. --fields=1)"
    cython --embed -3 "$file" \
    && gcc "$c_file" -I/usr/include/python3.13 -L/usr/lib -lpython3.13 -ldl -lm -o "$output_binary" \
    && echo -e "\033[32m Success! \033[0m"
}


cdl() {
  # Check for virtual environment when cd-ing into a directory
  cd "$*" || exit
  if [[ -d .venv ]]; then
    source .venv/bin/activate
  fi
  # Deactivate project venv and reactivate global venv ($HOME/.venv) when exiting the directory
  _exit_venv() {
    deactivate
    source "$HOME"/.venv/bin/activate
  }
  trap '_exit_venv' EXIT
}

rf() {
  source "$ZDOTDIR"/.env
  source "$ZDOTDIR"/.bash_functions
  source "$ZDOTDIR"/.bash_aliases
  source "$ZDOTDIR"/.consts
  source "$ZDOTDIR"/.color_defs.sh
  clear
}

save_hist() {
  # Create file with timestamp as name
  # Function to save scrollback history of Kitty terminal to a file
  timestamp=$(date +%F\ %H:%M)
  default_dir="$HOME/Logs/kitty"
  mkdir -p "$default_dir"  >&/dev/null

  # Handle optional argument for filename
  if [[ -z $1 ]]; then
    output_path="$default_dir/$timestamp.log"
  else
    output_path="$default_dir/$1"
  fi

  # Create file if it doesn't exist already.
  touch "$output_path"  >&/dev/null

  # Copy stdin to clipboard
  kitten @ launch --type clipboard --stdin-source @screen_scrollback && \
    wl-paste >>"${output_path}" && \
    echo "Saved scrollback history to $output_path"
}

cfg() {
  local _CURRENTEDITOR
  # Function to open and source configuration files in the .dotfiles directory
  # Make sure it exists.
  if [ ! -d "$HOME/.dotfiles/" ]; then
    error "Error: Directory $HOME/.dotfiles/ doesn't exist"
    return 1
  fi
  if [[ "$2" =~ "-c|c" ]]; then
    _CURRENTEDITOR=$(vscodium)
  else
    _CURRENTEDITOR=$EDITOR
  fi
  # Open specified file in  $EDITOR
  case "$1" in
  z*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.zshrc"
    # return 0
    ;;
  b*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.bashrc"
    # return 0
    ;;
  a*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.bash_aliases"
    # return 0
    ;;
  f*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.bash_functions"
    source "$HOME/.dotfiles/.bash_functions"
    # return 0
    ;;
  s*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.shellrc"
    # return 0
    ;;
  k*)
    $_CURRENTEDITOR "$HOME/.config/kitty/kitty.conf"
    kitten @ action load_config_file "/home/joona/.config/kitty/kitty.conf"
    # return 0
    ;;
  cd)
    cd "$HOME/.dotfiles/" || return 1
    ls -Altr --time=mtime
    # return 0
    ;;
  *)
    error "Argument must be one of [z* | b* | a* | f* | s* | cd | k*]"
    # return 1
    ;;
  esac
  rf
}

add() {
  vscodium --profile=Base --add "$@"
}

get() {
  # Check type of command. If type == function, show the entire function

  if ! which "$1" >/dev/null; then
    error "Command $1 not found."
    return 1
  fi

  cmdType="$(type $1)"

  case "$cmdType" in
  *function*|*alias*)
    which "$1" | bat -pl sh
    ;;
  *sh)
    filepath=$(which "$1" | cut -d ' ' -f 3)
    bat -pl sh "$filepath"
    ;;
  *py)
    filepath=$(which "$1" | cut -d ' ' -f 3)
    bat -pl py "$filepath"
    ;;
  *)
    printf "%s\n" "$(type $1)" | bat -pl sh
    ;;
  esac

}

pylint() {
  case "$1" in
  f*)
    ruff format --config="$HOME"/.dotfiles/ruff.toml
    ;;
  c*)
    ruff check --fix --config="$HOME"/.dotfiles/ruff.toml --ignore-noqa
    ;;
  esac
}

touch() {
  # Check if the file exists
  if [ -e "$1" ]; then
    echo "Error: File $1 already exists."
    return 1
  fi

  # Check if the extension is .py or .sh
  case "$1" in
  *.py)
    # Add Python hashbang and execute permissions
    echo "#!/usr/bin/env python3" > "$1"
	echo """

def main() -> None:
	pass

if __name__ == '__main__':
		main()
    """ >> "$1"
    chmod +x "$1" && $EDITOR "$1"
    ;;
  *.sh)
    # Add Shell hashbang and execute permissions
    echo "#!/bin/bash" >"$1"
    chmod +x "$1" && $EDITOR "$1"
    ;;
  *)
    echo >"$1"
    ;;
  esac
  return 0

}
ps_sorted() {
  # Sort ps aux output in various preset formats
  case "$1" in
  membuff)
    # Buffered cache
    ps aux | awk '{print $6/1024 " MB\t\t" $11}' | sort -n
    ;;

  esac
  return 0
}
check_mail() {
  # for viewing and clearing the failed services log.

  process() {
    # Display the contents of the file using 'bat'.
    bat --style=auto --paging=always "$1"
    # Prompt the user to clear the log.
    echo -n "Clear the log?: [Y/n]: "
    read -r reply
    # If the user confirms or provides no input, clear the log file.

    # BASH compatibility
    # if [[ $reply =~ ^[Yy]?$|^$ ]]; then

    if [[ $reply =~ "[yY]|^$" ]]; then
      echo "" >"$1"
    fi
  }
  # Check if the services log file exists and is not empty
  if [[ -n "$(cat "$MAIL/services.log")" ]]; then
    process "$MAIL/services.log"
  fi
  if [[ -n "$(cat "$MAIL/script_failure-notification.sh")" ]]; then
    process "$MAIL/script_failure-notification.sh"
  fi
  if [[ -n "$(cat "$MAIL/user_services.log")" ]]; then
    process "$MAIL/user_services.log"
  fi

}

help() {
  for arg in "$@"; do
    if [[ "$arg" =~ "-f" ]]; then
      # Redirect stderr to stdout and pipe the output to
      # 'bathelp -f' to force color
      "$@" --help 2>&1 | bathelp --theme="Everforest Dark" -f
    else
      "$@" --help 2>&1 | bathelp --theme="Everforest Dark"
    fi
  done
  return 0
}

# Move 'up' in the directory tree $1 amount of times and print pwd each interation
cd_up() {
  local levels="${1:-1}" # default to 1 if no argument is provided

  while [[ "$levels" -gt 0 ]]; do
    cd .. || {
      error "Failed to go up '$levels' directories"
      return 1
    }
    levels=$((levels - 1))
    local cwd
    if cwd=$(pwd); then
      printf "\033[1;33m%s\033[0m\n" "$cwd"
      ls -ltuph --group-directories-first
    else
      error "Failed to get current directory after cd .."
      return 1
    fi
  done
}

batfollow() {
  file="$1"
  lang=csv
  num=10

  case "$2" in
  -l)
    shift
    lang=$2
    ;;
  -n)
    shift
    num=$2
    ;;
  *)
    num=10
  esac

  case $3 in
   -n)
     shift
     num=$3
    ;;
  -l)
    shift
     lang=$3
     ;;
  esac
  tail -f "$file" -n "$num" | bat -ppl "$lang"
}

# Change dir, then list dir contents
cd_ls() {
  cd "$@" || return 0
  ls -ltupho --group-directories-first
}

# cd to commonly used directories
# [ ] : Use a case or other methods to clean this up.
cd_notes() {
  cd "$HOME"/Docs/Notes/Obsidian/All\ Notes/ || return 1
  ls -ltuph --group-directories-first
}
cd_logs() {
  cd "$HOME"/Logs/ || return 1
  ls -ltuph --group-directories-first
}
cd_docs() {
  cd "$HOME"/Docs/ || return 1
  ls -ltuph --group-directories-first
}
cd_dl() {
  cd "$HOME"/Downloads/ || return 1
  ls -ltuph --group-directories-first
}
cd_pics() {
  cd "$HOME"/Pictures/ || return 1
  ls -ltuph --group-directories-first
}

# uv_init() {
# 	path="$1"
# 	shift
# 	if [ -z "$path" ]; then
# 		path="$(pwd)"
# 	fi
#     uv init --color=always --no-workspace --no-pin-python --author-from=git --vcs=git "$@" && \
# 		rm "./$path/hello.py" >&/dev/null || \
# 	    echo -e "\033[31mError:\033[0m Failed to remove ./$path/hello.py \t\t\t \033[30m.bash_functions.uv-init(357)\033[0m"
# 	else
# 		"\033[31mError:\033[0m uv init failed! args=$* \t\t\t \033[30m.bash_functions.uv-init(360)\033[0m"
# 	fi
# }



# Auto Bluetooth Connections
bte() {
  local action device buds speaker
  # Define constants for status and devices
  buds="F8:4E:17:B5:0E:8D"    # SonyXM4Earphones
  speaker="E8:07:BF:66:25:FB" # Marley Get Together

  # Quick CLI bte function
  printhelp() {
    echo "Usage: bte [connect|disconnect] DEVICE..."
    echo ""
    echo "DEVICES:"
    echo -e "\t buds    : Sony XM4 Earphones"
    echo -e "\t speaker : Marley Get Together"
  }
  if ! bluetoothctl power on &>/dev/null; then
    echo -e "\033[31mError powering on bluetooth module\033[0m"
  fi
  # Check for null pointer references and handle exceptions
  if [[ -z "$1" ]] || [[ "$1" == "help" ]]; then
    printhelp | bat -ppl help
    return 1
  fi
  action="$1"
  device="$2"

  case $device in
  bud*)
    device="Sony XM4"
    address="$buds"
    ;;
  speaker*)
    device="Marley Get Together"
    address="$speaker"
    ;;
  *)
    device="Sony XM4"
    address="$buds"
    ;;
  esac

  case "$action" in
  connect)
    info "Attempting to connect to $device"
    if ! bluetoothctl connect "$address" >/dev/null 2>&1; then
      error "$2 not available"
    else
      success "Connected to $device"
    fi
    ;;
  disconnect)
    info "Attempting to disconnect from $device"
    if ! bluetoothctl disconnect "$address" >/dev/null 2>&1; then
      error "Error disconnecting from $device"
    else
      success "Disconnected from $device"
    fi
    ;;
  bat*)
    battery=$(bluetoothctl info \
        | grep  -oP "(?:Battery Percentage:\s0x..\b)\s\(\d+\)" \
        | sed -E "s/.*\(([0-9]+)\).*/\1/")

    echo -e "\033[34m$battery%\033[0m"
    ;;
  *)
    error "$action not supported"
    pbte rinthelp >&2 | bat -ppl help
    return 1
    ;;
  esac
}

clear_zsh_cache() {
  # Delete the completion cache
  rm "$ZSH_COMPDUMP"
  # Restart the zsh session
  exec zsh && success "ZSH cache cleared and session restarted."
}

# Formatting man pages with bat
man_color() {
  # Argument validation
  [[ "$#" -eq 0 ]] && /usr/bin/man --help && return 0

  # Preserve `k` option for searching man pages
  if [[ "$#" -eq 1 ]] && [[ "$1" == "-k" ]]; then
    /usr/bin/man -k "$@" | bat -l man -p
  fi

  [[ "$#" -gt 1 ]] && /usr/bin/man "$@" | bat -l man -p && return 0

  /usr/bin/man "$1" | bat -pl man && return 0
  return 1
}

git_diff() {
  # NOTE - Work in progress
  local ignore_lines=(\"\|\'\|^\\s+\$)
  if [[ "$1" == "staged" ]]; then
    name_status=$(git diff --staged --name-status --diff-filter=AMD)
    diff=$(git diff --patch-with-stat --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines \
      --ignore-space-at-eol --ignore-matching-lines="$ignore_lines" \
      --staged --diff-filter=M)
    return 0
  fi
  name_status=$(git diff --staged --name-status --diff-filter=AMD)
  diff=$(git diff --patch-with-stat --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines \
    --ignore-space-at-eol --ignore-matching-lines="$ignore_lines" \
    --staged --diff-filter=M)

  return 0
  # git diff --diff-filter=AMD --name-status
}

update_python_path() {
  path_prefix="$HOME/python"
  path_parts=$(find "$path_prefix" \( ! -path "**/__pycache__/**" \) \( ! -path "**/venv/**" \) \
    \( ! -path "**/*yarn*/**" \) \( ! -path "**/.cargo/**" \) \( ! -path "**/yay/**" \) \
    \( ! -path "**/.anaconda/**" \) \( ! -path "**/.venv/**" \) \( ! -path "**/*conda*/**" \) \
    \( ! -path "**/TODO/**" \) \( ! -path "**/__main__/**" \) \( ! -path "**/.git*/**" \) \
    \( ! -path "**/.graveyard/**" \) \( ! -path "**/*[tT]est*/**" \) \
    \( ! -path "**/[fF]lask*/**" \) -type d -name -print0 |
    xargs -0 -I _ echo ":_")
  # export PYTHONPATH="$PYTHONPATH$path_parts"
  # export PATH="$PATH:$PYTHONPATH"
  echo "$PYTHONPATH:$path_parts"
}
llamashow() {
  ollama show "$1" --modelfile | bat --style=full --paging=always -pl asm
}
# TODO IMPLEMENT
# ? Update the time in shell prompt
# update_prompt_time() {
#   local cols=$(tput cols)
#   local time=$(date "+%H:%M")
#   tput cup $((0)) $((cols - 5))
#   echo -n $time
# }
