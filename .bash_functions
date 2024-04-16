################################
# Joona's Bash Shell Functions #
################################

error() {
  echo -e "\033[1;31mError: $*\033[0m" >&2
}

# Move 'up' in the directory tree $1 amount of times and print pwd each interation
function up() {
  local levels="${1:-1}"  # default to 1 if no argument is provided
  
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
function send-sms() {
  if [ "$#" -lt 2 ]; then
    echo "Usage: send-sms <message> <destination>"
    exit 1
  fi

  local dest
  case "$2" in
    "muru")
      dest="6048359467"
      ;;
    "me")
      dest="6042265455"
      ;;
    *)
      dest="$2"
      ;;
  esac

  local msg="$1"
  local dev_id=$(kdeconnect-cli -l --id-only)

  if [ "$?" -ne 0 ]; then
    echo -e "\033[1;31m Error: Could not find device with ID \033[0m"
    exit 1
  fi
  kdeconnect-cli --send-sms "$msg" --destination "$dest" -d "$dev_id"

  if [ "$?" -ne 0 ]; then
    echo -e "\033[1;31m Error: Could not send SMS \033[0m"
    exit 1
  else
    echo -e "\033[1;32m Success: SMS sent \033[0m"
  fi
}
# Run JamfleX Launcher
function osrs() {
  cd ~/Desktop
  ./osrs.sh
}

# List files in '~/scripts'
function list_scripts() {
	ll ~/scripts
}

# Change dir, then list dir contents
function cd_ls () {
	cd "$@"
    # Check the number of items in the current directory
    item_count=$(ls -1 | wc -l)
	ls -ltupho --group-directories-first
}
# cd ~/Code/Python then ls
function cdpy () {
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
  cd ~/Docs/Notes/Obsidian/.backup/ExportedNotes/PDF/
  ls -ltuph --group-directories-first
}
function logs() {
  cd ~/Logs/
  ls -ltuph --group-directories-first
}
function docs() {
  cd ~/Docs/
  ls -ltuph --group-directories-first
}
function dl() {
  cd ~/Downloads/
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
      keep='true'
      firefox --search "$string" &
    else
      keep='false'
      string="$string $arg"
    fi
  done

  if [ "$keep" != 'true' ]; then
    firefox --search "$string" && exit
  fi
  firefox --search "$string" &
}
function scp() {
  remote_name="$1"  # osmc, pihole
  remote_destination=$1
  shift
  local_path="$@"
  for arg in "$@"; do
    shift
  done
  remote_path="$@"

  echo "$remote_name"
  echo "$remote_destination"
  echo "$local_path"
  echo "$remote_path"


#  scp -i ~/.ssh/"$1" "$1"

#  'user@remote_server:/path/to/destination/'

#  'myscp /path/to/local/file myremotefile'
}
function disk_usage() {
  df -Ph | awk '{printf "%-16s %-8s %-10s\n", $1, $5, $6}'
}

function code() {
  for arg in "$@"; do
    if [ "$arg" == "--keep" ]; then
      keep='true'
      vscodium $enable_wayland &
    else
      keep='false'
      string="$string $arg"
    fi
  done
  if [ "$keep" != 'true' ]; then
    vscodium $enable_wayland && exit
  else
    vscodium $enable_wayland &
  fi
}

# # Commit msg
# 
# * Removed: custom_yay function because it was useless
# * Removed: scp function since it didnt solve any problems
# * Modified: vscodium alias is now a function to support custom `keep` flag
# * Modified: .gitignore to allow `git add .` while ignoring irelevant files
#
