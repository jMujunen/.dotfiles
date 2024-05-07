################################
# Joona's Bash Shell Functions #
################################

error() {
  echo -e "\033[1;31mError: $*\033[0m" >&2
}

# for viewing and clearing the failed services log.
failed_services_function() {
  # Check if the services log file exists.
  if [ -f $MAIL/services.log ]; then
    # Display the contents of the file using 'bat'.
    bat --style=auto --paging=always $MAIL/services.log
    # Prompt the user to clear the log.
    read -p "Clear the log?: [Y/n]: " -n 1 -sr reply
    # If the user confirms or provides no input, clear the log file.

    # ZSH compatibility
    if [[ '$reply' =~ '^[Yy]?$|^$' ]]; then
      echo "" >$MAIL/services.log
      echo "Log cleared"
    fi
    # BASH compatibility
    #if [[ $reply =~ ^[Yy]?$|^$ ]]; then
    #  echo "" >$MAIL/services.log
    #  echo "Log cleared"
    #fi
  fi
}

help() {
  if [[ "$@" =~ "-f" ]]; then
    # Redirect stderr to stdout and pipe the output to
    # 'bathelp -f' to display the help message in formatted mode.
    "$@" --help 2>&1 | bathelp -f
  else
    "$@" --help 2>&1 | bathelp
  fi
  return 0
}

# TODO
#execpython() {
#  if [ "$@" -eq 0 ]; then
#    python3
#  else
#    python3 "$@"
#  fi
#}

# Formatting man pages with bat
man_color() {
  # Argument validation
  if [ "$#" -eq 0 ]; then
    /usr/bin/man --help
    return 0
  fi

  # Preserve `-k` option for searching man pages
  if [ "$#" -eq 1 ]; then
    if [ "$1" == "-k" ]; then
      /usr/bin/man -k "$@" | bat -l man -p
      return 0
    fi
  fi

  if [ "$#" -gt 1 ]; then
    /usr/bin/man "$@"
    return 0
  fi

  /usr/bin/man "$@" | bat -l man -p
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
sendsms() {
  source ~/.bash_aliases_ 2>/dev/null || source ~/.dotfiles/.bash_aliases_ || {
    error "Failed to source ~/.bash_aliases_ or ~/.dotfiles/.bash_aliases_" && return 1
  }

  if [ "$#" -lt 2 ]; then
    echo "Usage: send_sms <message> <contact>"
    return 1
  fi

  local message="$1"
  local destination="$2"
  local recipient="${contacts[$destination]}"
  if [ -z "$recipient" ]; then
    recipient="$destination"
  fi

  local device_id=$(kdeconnect-cli -l --id-only)
  kdeconnect-cli --send-sms "$message" --destination "$recipient" -d "$device_id"

  if [[ "$?" -ne 0 ]]; then
    echo error "Failed to send SMS"
  else
    echo -e "\033[1;32m Success: SMS sent \033[0m"
  fi
}

# List files in '~/scripts'
list_scripts() {
  ll ~/scripts
}

# Change dir, then list dir contents
cd_ls() {
  cd "$@"
  # Check the number of items in the current directory
  item_count=$(ls -1 | wc -l)
  ls -ltupho --group-directories-first
}
# cd ~/Code/Python then ls
cd_py() {
  cd /home/joona/Code/Python/
  ls -ltupho --group-directories-first
}

# ^ Depreciated
#sizeof() {
#  output=$(du $1 | tail -1 | sed -n -E 's/^([0-9]{3,10}).*$/\1/p' | awk '{print $1 /  1000000} ')
#  rounded_output=$(printf "%.3f" $output)
#  printf "$rounded_output GB\n"
#}

color_cpu_temp() {
  output=$(sensors | grep 'Package id 0:' | sed -E 's/.*([0-9]{2}\.[0-9].C[^,\)]).*/\1/')
  rounded_output=$(printf "%.f" $output)
  if [ "$output" -gt "80" ]; then
    echo -e "\033[1;31m$rounded_output\033[0m"
  else
    echo -e "\033[1;32m$rounded_output\033[0m"
  fi
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
pacman-remove() {
  # Handle arguments
  if [ -z "$1" ]; then
    echo "Usage: pacman-remove <package>"
    return 1
  fi

  read -p "Do you want keep configs for $1? [y/N] " answer

  if [ -z "$answer" ]; then
    sudo pacman -Rsnuv --color=always "$1"
  else
    sudo pacman -Rsuv --color=always "$1"
  fi
  # Remove orphans
  #sudo pacman -Rns $(pacman -Qqo $(pacman -Qtdq))
  ########################################
  # sudo pacman -Rsnv $(pacman -Qdtq)
}

# Auto Bluetooth Connections
bte_function() {
  SonyXM4="F8:4E:17:B5:0E:8D"
  # Check for null pointer references and handle exceptions
  if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Usage: bte [connect|disconnect]"
    return 1
  fi
  if [ -z "$1" ]; then
    bluetoothctl
  fi

  if [ "$1" != "connect" ] && [ "$1" != "disconnect" ]; then
    echo "Usage: bte [connect|disconnect]"
    return 1
  fi

  if [ "$1" == "connect" ]; then
    echo -e "\033[38;2;33;129;158mConnecting to $SonyXM4...\033[0m"
    if ! bluetoothctl connect "$SonyXM4"; then
      error "Failed to connect to $SonyXM4"
      return 1
    fi
    echo -e "\033[38;2;33;129;158mConnected Successfully\033[0m"

  elif [ "$1" == "disconnect" ]; then
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
firefox_search() {
  string=""
  for arg in "$@"; do
    if [[ "$arg" == "--keep" ]]; then
      firefox --search "$string" >/dev/null 2>&1 &
      return 0
    else
      string=$string $arg
    fi
  done

  firefox --search "$string" >/dev/null 2>&1 && exit
  return 0
}

disk_usage() {
  df -Ph | awk '{printf "%-16s %-8s %-10s\n", $1, $5, $6}'
}

vscode() {
  for arg in "$@"; do
    if [ "$arg" == "--keep" ]; then
      local keep='true'
    else
      local keep='false'
      string="$string $arg"
    fi
  done
  if [ "$keep" != 'true' ]; then
    vscodium $enable_wayland $string && exit
  else
    vscodium $enable_wayland $string &
  fi
}

memory_used() {
  mem_total=$(free | grep Mem | awk '{print $2}')
  mem_used=$(free | grep Mem | awk '{print $3}')
  mem_percent=$(printf "%.0f" $(calc $mem_used/$mem_total*100 | grep -P -o "\d+.*"))
  echo "$mem_percent%"
}

# ! NOT FULLY IMPLEMENTED
# to update the time in the prompt
update_prompt_time() {
  local cols=$(tput cols)
  local time=$(date "+%H:%M")
  tput cup $((0)) $((cols - 5))
  echo -n $time
}
