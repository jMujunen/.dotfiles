################################
# Joona's Bash Shell Functions #
################################

error() {
  echo -e "\033[1;31mError: $*\033[0m" >&2
}
function failed_services_function() {
  sudo journalctl -u $MAIL/services.log

}
# Function for executing 'bat' or 'micro' on a given file based on the option provided.
# Usage: ini [ -r | -w ] <file>
# Options:
#   -r: execute 'bat' on the file
#   -w: execute 'micro' on the file
#     - if no option is given, 'bat' is executed on the file
function ini_io_function() {

  # Print help for usage
  print_help() {
    echo "Usage: ini [ -r | -w ] <file>"
    echo "Options:"
    echo "  -r: execute 'bat' on the file"
    echo "  -w: execute 'micro' on the file"
    echo "    - if no option is given, 'bat' is executed on the file"
  }

  # Check if the number of arguments is valid
  if [ "$#" -eq 0 ]; then
    print_help
    return 1
  elif [ "$#" -eq 1 ]; then
    if [ "$1" == "-r" ] || [ "$1" == "-w" ]; then
      error "Invalid number of arguments"
      print_help
      return 1
    else
      if [ -f "$1" ]; then
        bat -l ini --style=full "$1"
        return 0
      else
        error "File '$1' does not exist"
        print_help
        return 1
      fi
    fi
  fi
  flag="$1"
  file="$2"
  shift
  shift
  # The following code executes when the number of arguments is over 1
  if [ $flag == "-r" ]; then
    if [ ! -f "$file" ]; then
      error "File '$file' does not exist"
      return 1
    fi
    bat -l ini --style=full "$file"
    return 0

  elif [ $flag == "-w" ]; then
    micro -filetype ini "$file"
    return 0

  else
    error "Invalid option"
    print_help
    return 1
  fi
}

help() {
  if [[ "$@" =~ "-f" ]]; then
    "$@" --help 2>&1 | bathelp -f
    return 0
  fi
  "$@" --help 2>&1 | bathelp
  return 0
}

execpython() {
  if [ "$@" -eq 0 ]; then
    python3
  else
    # TODO
    python3 "$@"
  fi
}
function man() {
  if [ "$#" -eq 0 ]; then
    /usr/bin/man --help
    return 0
  fi
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
function up() {
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
function send_sms() {
  if [ ! -e ~/.bash_aliases_ ]; then
    echo "~/.bash_aliases_ not found"
    return 1
  fi
  source ~/.bash_aliases_

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

  if [ "$?" -ne 0 ]; then
    echo error "Failed to send SMS"
  else
    echo -e "\033[1;32m Success: SMS sent \033[0m"
  fi
}

# List files in '~/scripts'
function list_scripts() {
  ll ~/scripts
}

# Change dir, then list dir contents
function cd_ls() {
  cd "$@"
  # Check the number of items in the current directory
  item_count=$(ls -1 | wc -l)
  ls -ltupho --group-directories-first
}
# cd ~/Code/Python then ls
function cd_py() {
  cd /home/joona/Code/Python/
  ls -ltupho --group-directories-first
}

function sizeof() {
  output=$(du $1 | tail -1 | sed -n -E 's/^([0-9]{3,10}).*$/\1/p' | awk '{print $1 /  1000000} ')
  rounded_output=$(printf "%.3f" $output)
  printf "$rounded_output GB\n"
}

function color_cpu_temp() {
  output=$(sensors | grep 'Package id 0:' | sed -E 's/.*([0-9]{2}\.[0-9].C[^,\)]).*/\1/')
  rounded_output=$(printf "%.f" $output)
  if [ "$output" -gt "80" ]; then
    echo -e "\033[1;31m$rounded_output\033[0m"
  else
    echo -e "\033[1;32m$rounded_output\033[0m"
  fi
}

# cd to commonly used directories
function notes() {
  cd ~/Docs/Notes/HTML/Atom/
  ls -ltuph --group-directories-first
}
function cd_logs() {
  cd ~/Logs/
  ls -ltuph --group-directories-first
}
function cd_docs() {
  cd ~/Docs/
  ls -ltuph --group-directories-first
}
function cd_dl() {
  cd ~/Downloads/
  ls -ltuph --group-directories-first
}
function cd_pics() {
  cd ~/Pictures/
  ls -ltuph --group-directories-first
}
function pacman-remove() {
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
function bte() {
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
function fdisk_less_verbose() {
  fdisk -l --output Device,Size,Type

}
function osrs_hydra() {
  cd /home/joona/python/macros/
  sudo python3 count_hydra_attacks.py
}
function ffs() {
  for arg in "$@"; do
    if [ "$arg" == "--keep"]; then
      local keep='true'
      firefox --search "$string" &
    else
      local keep='false'
      string="$string $arg"
    fi
  done

  if [[ "$keep" != 'true' ]]; then
    firefox --search "$string" && exit
  fi
  firefox --search "$string" &
}

function disk_usage() {
  df -Ph | awk '{printf "%-16s %-8s %-10s\n", $1, $5, $6}'
}

function code() {
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

function memory_used() {
  mem_total=$(free | grep Mem | awk '{print $2}')
  mem_used=$(free | grep Mem | awk '{print $3}')
  mem_percent=$(printf "%.0f" $(calc $mem_used/$mem_total*100 | grep -P -o "\d+.*"))
  echo "$mem_percent%"
}

# ! NOT FULLY IMPLEMENTED
# Function to update the time in the prompt
function update_prompt_time() {
  local cols=$(tput cols)
  local time=$(date "+%H:%M")
  tput cup $((0)) $((cols - 5))
  echo -n $time
}

function trig() {

  rad=$(echo "$deg * (4 * a(1) / 180)" | bc -l) # Convert to radians

  sin=$(echo "s($rad)" | bc -l)
  cos=$(echo "c($rad)" | bc -l)
  tan=$(echo "s($rad) / c($rad)" | bc -l)

  echo "Sin($deg): $sin"
  echo "Cos($deg): $cos"
  echo "Tan($deg): $tan"
}
