#!/bin/bash
################################
# Joona's Bash Shell Functions #
################################

enable_wayland="--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"

error() {
  echo -e "\033[1;31mError: $*\033[0m" >&2
}

# auto_git_msg() {
#   if [[ "$#" -eq 0 ]]; then
#     commit_msg=$(git diff | python3 ~/python/Projects/ollama/main.py custom:gitmsg)
#     echo $commit_msg
#     echo -n "[E]dit, [C]ommit, [P]ush, or [Q]uit: "
#     read reply

#     if [[ $reply =~ '[eE]' ]]; then
#       git

#   elif [[ "$1" == "--staged" ]]; then

# for viewing and clearing the failed services log.
failed_services_function() {

  # Check if the services log file exists.
  if [[ -f $MAIL/services.log ]]; then
    # Display the contents of the file using 'bat'.
    bat --style=auto --paging=always $MAIL/services.log
    # Prompt the user to clear the log.
    echo -n "Clear the log?: [Y/n]: "
    read reply
    # If the user confirms or provides no input, clear the log file.

    # ZSH compatibility
    if [[ $reply =~ '[yY]|^$' ]]; then
      echo "" >$MAIL/services.log
      echo "Log cleared"
    else
      echo "Log not cleared"
    fi

    # BASH compatibility
    # if [[ $reply =~ ^[Yy]?$|^$ ]]; then
    #  echo "" >$MAIL/services.log
    #  echo "Log cleared"
    # fi
  fi
}

help() {
  if [[ "$@" =~ "-f" ]]; then
    # Redirect stderr to stdout and pipe the output to
    # 'bathelp -f' to force color
    "$@" --help 2>&1 | bathelp --theme="Everforest Dark" -f
  else
    "$@" --help 2>&1 | bathelp --theme="Everforest Dark"
  fi
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
  cd "$@"
  # Check the number of items in the current directory
  item_count=$(ls -1 | wc -l)
  ls -ltupho --group-directories-first
}

# cd to commonly used directories
cd_notes() {
  cd ~/Docs/Notes/Obsidian/All\ Notes/
  ls -ltuph --group-directories-first
}
cd_logs() {
  cd ~/Logs/
  ls -ltuph --group-directories-first
}
cd_docs() {
  cd ~/Docs/
  ls -ltuph --group-directories-first
}
cd_dl() {
  cd ~/Downloads/
  ls -ltuph --group-directories-first
}
cd_pics() {
  cd ~/Pictures/
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
  cd /home/joona/python/macros/
  sudo python3 count_hydra_attacks.py
}

disk_usage() {
  /usr/bin/python3 ~/python/scripts/bashhelpers/ColorizeOutput/df.py
  # df -Ph | awk '{printf "%-16s %-8s %-10s\n", $1, $5, $6}' - Depreciated
}

vscode() {
  for arg in "$@"; do
    if [[ "$arg" == "--keep" ]]; then
      local keep='true'
    else
      local keep='false'
      string="$string $arg"
    fi
  done
  if [[ "$keep" != 'true' ]]; then
    vscodium $enable_wayland $string && exit
  else
    vscodium $enable_wayland $string &
  fi
}

# TODO: Functions for default touch behaviour for certain filetypes
touch_python() {
  # Print help
  print_help() {
    echo "Usage: tp | touch_python <filepath>"
    echo "Creates a file in the provided filepath with .py extension"
    echo "and appends a shebang to it and turns on the exectuble bit."
  }

  # Argument validation
}

# TODO IMPLEMENT
# ? Update the time in shell prompt
# update_prompt_time() {
#   local cols=$(tput cols)
#   local time=$(date "+%H:%M")
#   tput cup $((0)) $((cols - 5))
#   echo -n $time
# }
