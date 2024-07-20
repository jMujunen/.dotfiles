#-------------------#
ignore_lines=(\"\|\'\|^\\s+\$)

# ignore=(.\*\\\[+package.\*\?\\\]+\(\\s+\[\\w\\\{\\s=\"\.\*\\[,:\\}\>\<\@\]\))

success() {
  echo -e "\033[32mSuccess: $*\033[0m"
}

error() {
  echo -e "\033[1;31mError: $*\033[0m" >&2
}

kitten_aliases() {
  alias diff_='kitten diff'
  alias img='kitten icat'
  alias ssh='kitten ssh'
  alias kp='kitty_panel'
}

kitty_panel() {
  cmd="$@"
  kitty +kitten panel --edge=background sh -c "${cmd}"
}

save_hist() {
  # Create file with timestamp as name
  timestamp=$(date +%F\ %H:%M)
  # Create directory if not exists, nullify output incase it exists
  mkdir -p "$HOME/Logs/kitty/" >/dev/null 2>&1
  # Define output path
  output_path="$HOME/Logs/kitty/$timestamp.log"
  # Create file
  touch "$output_path"

  # Copy stdin to clipboard
  kitten @ launch --type clipboard --stdin-source @screen_scrollback
  # Save clipboard content to file
  wl-paste >"${output_path}"
}

cfg() {
  # Make sure it exists.
  if [ ! -d "$HOME/.dotfiles" ]; then
    error "Error: Directory $HOME/.dotfiles does"
    return 1
  fi
  # Open specified file in  $EDITOR
  case "$1" in
  z*)
    $EDITOR "$HOME/.dotfiles/.zshrc" && source $HOME/.dotfiles/.zshrc
    return 0
    ;;
  b*)
    $EDITOR "$HOME/.dotfiles/.bashrc" && source $HOME/.dotfiles/.bashrc
    return 0
    ;;
  a*)
    $EDITOR "$HOME/.dotfiles/.bash_aliases" && source $HOME/.dotfiles/.bash_aliases
    return 0
    ;;
  f*)
    $EDITOR "$HOME/.dotfiles/.bash_functions" && source $HOME/.dotfiles/.bash_functions
    return 0
    ;;
  s*)
    $EDITOR "$HOME/.dotfiles/.shellrc" && source $HOME/.dotfiles/.shellrc
    return 0
    ;;
  cd)
    cd "$HOME/.dotfiles/" && ls -Altr --time=mtime
    return 0
    ;;
  *)
    error "Argument must be one of [z* | b* | a* | f* | s* | cd]"
    return 1
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
  # Check type of command. If type == function, show the code for it
  if ! which "$1" >/dev/null; then
    error "Error: Command $1 not found."
    return 1
  fi
  if [[ $(type "$1") =~ "function" ]]; then
    which "$1" | pat -pl sh
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
    echo "#!/usr/bin/env python3" >"$1"
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
  # Check if the services log file exists.
  if [[ -f $MAIL/services.log ]]; then
    process "$MAIL/services.log"
  fi
  if [[ -f $MAIL/script_failure-notification.sh ]]; then
    process "$MAIL/script_failure-notification.sh"
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
  tail -f "$@" | bat -ppl csv
}

# Change dir, then list dir contents
cd_ls() {
  cd "$@" || return 0
  ls -ltupho --group-directories-first
}

# cd to commonly used directories
cd_notes() {
  cd $HOME/Docs/Notes/Obsidian/All\ Notes/ || return 1
  ls -ltuph --group-directories-first
}
cd_logs() {
  cd $HOME/Logs/ || return 1
  ls -ltuph --group-directories-first
}
cd_docs() {
  cd $HOME/Docs/ || return 1
  ls -ltuph --group-directories-first
}
cd_dl() {
  cd $HOME/Downloads/ || return 1
  ls -ltuph --group-directories-first
}
cd_pics() {
  cd $HOME/Pictures/ || return 1
  ls -ltuph --group-directories-first
}

# Auto Bluetooth Connections
bte_function() {
  # TODO: check for rfkill
  SonyXM4="F8:4E:17:B5:0E:8D"
  # Check for null pointer references and handle exceptions
  if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    echo "Usage: bte [connect|disconnect]"
    return 1
  fi
  if [[ -z "$1" ]]; then
    bluetoothctl
  fi

  if [[ "$1" != "connect" ]] && [[ "$1" != "disconnect" ]]; then
    echo "Usage: bte [connect|disconnect]"
    return 1
  fi

  if [[ "$1" == "connect" ]]; then
    echo -e "\033[38;2;33;129;158mConnecting to $SonyXM4...\033[0m"
    if ! bluetoothctl connect "$SonyXM4"; then
      error "Failed to connect to $SonyXM4"
      echo -e "\033[3m$(rfkill)\033[0m"
      return 1
    fi
    echo -e "\033[38;2;33;129;158mConnected Successfully\033[0m"

  elif [[ "$1" == "disconnect" ]]; then
    echo -e "\033[38;2;33;129;158mDisconnecting from $SonyXM4...\033[0m"
    if ! bluetoothctl disconnect "$SonyXM4"; then
      error "Failed to disconnect from $SonyXM4"
      return 1
    fi
    echo -e "\033[38;2;33;129;158mDisconnected Successfully\033[0m"
  fi
}
fdisk_less_verbose() {
  sudo fdisk -l --output Device,Size,Type
  # TODO
  # * Colorize output

}
osrs_hydra() {
  cd /home/joona/python/macros/ || return 1
  sudo python3 count_hydra_attacks.py
}

disk_usage() {
  /usr/bin/python3 "$HOME/python/scripts/bashhelpers/ColorizeOutput/df.py"
  # df -Ph | awk '{printf "%-16s %-8s %-10s\n", $1, $5, $6}' - Depreciated
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
  if [[ "$1" == "staged" ]]; then
    name_status=$(git diff --staged --name-status --diff-filter=AMD)
    diff=$(git diff --patch-with-stat --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines \
      --ignore-space-at-eol --ignore-matching-lines=$ignore_lines \
      --staged --diff-filter=M)
    return 0
  fi
  name_status=$(git diff --staged --name-status --diff-filter=AMD)
  diff=$(git diff --patch-with-stat --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines \
    --ignore-space-at-eol --ignore-matching-lines=$ignore_lines \
    --staged --diff-filter=M)

  return 0
  # git diff --diff-filter=AMD --name-status
}

update_python_path() {
  path_prefix="$HOME/python"
  path_parts=$(find "$path_prefix" \( ! -path "*/__pycache__/*" \) \( ! -path "*/venv/*" \) \
    \( ! -path "*/*yarn*/*" \) \( ! -path "*/.cargo/*" \) \( ! -path "*/yay/*" \) \
    \( ! -path "*/.anaconda/*" \) \( ! -path "*/.venv/*" \) \( ! -path "*/*conda*/*" \) \
    \( ! -path "*/TODO/*" \) \( ! -path "*/__init__/*" \) \( ! -path "*/__main__/*" \) \
    \( ! -path "*/.git*/*" \) \( ! -path "*/.graveyard/*" \) \( ! -path "*/.[a-zA-Z0-9]*/*" \) \
    \( ! -path "*/*[tT]est*/*" \) \( ! -path "*/[fF]lask*/*" \) -type f -name "*.py" -print0 |
    xargs -0 -I _ echo ":_")
  export PYTHONPATH="$PYTHONPATH$path_parts"
  export PATH="$PATH:$PYTHONPATH"

}

# TODO IMPLEMENT
# ? Update the time in shell prompt
# update_prompt_time() {
#   local cols=$(tput cols)
#   local time=$(date "+%H:%M")
#   tput cup $((0)) $((cols - 5))
#   echo -n $time
# }
