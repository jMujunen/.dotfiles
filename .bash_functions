# Depedancies: bat vscodium
# ignore=(.\*\\\[+package.\*\?\\\]+\(\\s+\[\\w\\\{\\s=\"\.\*\\[,:\\}\>\<\@\]\))
rsync_update(){
  rsync -auihXP --compress-choice=none "$1" "$2" | tqdm  > /dev/null
}
rsync_metadata(){
  rsync -aihXP --compress-choice=none "$1"  "$2" | tqdm  > /dev/null
}
kitty_integration_custom() {

  # -------------- #

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
}
# Check if the terminal is kitty and run custom integration if true
[[ "$TERM" == "xterm-kitty" ]] && kitty_integration_custom

cdl() {
  # Check for virtual environment when cd-ing into a directory
  cd "$*"
  if [[ -d .venv ]]; then
    source .venv/bin/activate
  fi
  # Deactive project venv and reactivate global venv ($HOME/.venv) when exiting the directory
  _exit_venv() {
    deactivate
    source $HOME/.venv/bin/activate
  }
  trap '_exit_venv' EXIT
}

save_hist() {

  # Create file with timestamp as name
  # Function to save scrollback history of Kitty terminal to a file
  timestamp=$(date +%F\ %H:%M)
  default_dir="$HOME/Logs/kitty"
  mkdir -p "$default_dir" >/dev/null 2>&1

  # Handle optional argument for filename
  if [[ -z $1 ]]; then
    output_path="$default_dir/$timestamp.log"
  else
    output_path="$default_dir/$1"
  fi

  # Create file if it doesn't exist already.
  touch "$output_path" >/dev/null 2>&1

  # Copy stdin to clipboard
  kitten @ launch --type clipboard --stdin-source @screen_scrollback &&
    wl-paste >>"${output_path}"
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
    _CURRENTEDITOR=vscodium
  else
    _CURRENTEDITOR=$EDITOR
  fi
  # Open specified file in  $EDITOR
  case "$1" in
  z*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.zshrc" && source "$HOME/.dotfiles/.zshrc"
    # return 0
    ;;
  b*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.bashrc" && source "$HOME/.dotfiles/.bashrc"
    # return 0
    ;;
  a*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.bash_aliases" && source "$HOME/.dotfiles/.bash_aliases"
    # return 0
    ;;
  f*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.bash_functions" && source "$HOME/.dotfiles/.bash_functions"
    # return 0
    ;;
  s*)
    $_CURRENTEDITOR "$HOME/.dotfiles/.shellrc" && source "$HOME/.dotfiles/.shellrc"
    # return 0
    ;;
  k*)
    $_CURRENTEDITOR "$HOME/.config/kitty/kitty.conf" &&
      kitten @ action load_config_file "/home/joona/.config/kitty/kitty.conf"
    # return 0
    ;;
  cd)
    cd "$HOME/.dotfiles/" && ls -Altr --time=mtime
    # return 0
    ;;
  *)
    error "Argument must be one of [z* | b* | a* | f* | s* | cd | k*]"
    # return 1
    ;;
  esac
}
render() {
  kitten icat "$1"
  printf "%*s\n" "50" "$1"
}
add() {
  vscodium --add "$@"
}

get() {
  # Check type of command. If type == function, show the entire function
  if ! which "$1" >/dev/null; then
    error "Command $1 not found."
    return 1
  fi
  if [[ $(type "$1") =~ "function" ]]; then
    which "$1" | bat -pl sh
    return 0
  else
    # Print normal output otherwise
    printf "%s\n" "$(type "$1")"
  fi
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
import sys
import os
from Color import cprint

def main() -> None:
	pass

if __name__ == '__main__':
	try:
		main()
	except Exception as e:
		cprint.error(f'{e!r}')
		sys.exit(1)
	sys.exit(0)""" >> "$1"
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
# Sort ps aux output in various preset formats
ps_sorted() {
  case "$1" in
  membuff)
    # Buffered cache
    ps aux | awk '{print $6/1024 " MB\t\t" $11}' | sort -n
    ;;

  esac
  return 0
}
# for viewing and clearing the failed services log.
check_mail() {
  process() {
    # Display the contents of the file using 'bat'.
    bat --style=auto --paging=always "$1"
    # Prompt the user to clear the log.
    echo -n "Clear the log?: [Y/n]: "
    read -r reply
    # If the user confirms or provides no input, clear the log file.

    # ZSH compatibility
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
  # BASH compatibility
  # if [[ $reply =~ ^[Yy]?$|^$ ]]; then
  #  echo "" >$MAIL/services.log
  #  echo "Log cleared"
  # fi
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
  if [[ $# -gt 1 ]] && [[ $2 =~ "-l|--language" ]]; then
    lang=$3
  fi
  tail -f "$file" | bat -ppl "$lang"
}

# Change dir, then list dir contents
cd_ls() {
  cd "$@" || return 0
  ls -ltupho --group-directories-first
}

rf() {
  source "$ZDOTDIR"/.shellrc
  source "$ZDOTDIR"/.bash_functions
  source "$ZDOTDIR"/.bash_aliases
  clear
}

# Auto Bluetooth Connections
bte() {
  local action device if_status buds speaker
  # Define constants for status and devices
  if_status=$(rfkill | grep bluetooth | awk '{print $4"\n"$5}')
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
  if ! bluetoothctl power on; then
    echo -e "\033[31mError powering on bluetooth module\033[0m"
  fi
  connect() {
    info "Attempting to connect to $2"
    if ! bluetoothctl connect "$1" >/dev/null 2>&1; then
      error "$2 not available"
    else
      success "Connected to $2"
    fi
  }

  disconnect() {
    info "Attempting to disconnect from $2"
    if ! bluetoothctl disconnect "$1" >/dev/null 2>&1; then
      error "Error disconnecting from $2"
    else
      success "Disconnected from $2"
    fi
  }
  # Check for null pointer references and handle exceptions
  if [[ -z "$1" ]]; then
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
    connect "$address" "$device"
    ;;
  disconnect)
    disconnect "$address" "$device"
    ;;
  *)
    error "$action not supported"
    printhelp >&2 | bat -ppl help
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
