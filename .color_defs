# Unicode escape color definintions + some convinience functions for output.
RESET='\033[0m'
gray='\033[90m'
black='\033[30m'
red='\033[31m'
green='\033[32m'
yellow='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
white='\033[37m'
orange='\033[91m'
light_gray='\033[97m'
dark_blue='\033[34m'

# Inverse
inv_gray='\033[97m'
inv_black='\033[40m'
inv_green='\033[42m'
inv_red='\033[41m'
inv_yellow='\033[43m'
inv_blue='\033[44m'
inv_purple='\033[45m'
inv_cyan='\033[46m'
inv_white='\033[47m'

# Attributes
bold='\033[1m'
fade='\033[2m'
italic='\033[3m'
underline='\033[4m'
blink='\033[5m'
inverse='\033[7m'

# Convinience functions for output.
info() {
    echo -e "${blue}Info:${RESET} $*"
    return 0
}

warn() {
    echo -e "${yellow}Warning:${RESET} $*"
    return 0
}

# stdout.debug() {
#     if [ "$DEBUG_MODE" = true ]; then
#         echo -e "${gray}Debug:${RESET} $*"
#     fi
# }

success() {
    echo -e "${green}Success:${RESET} $*"
    return 0
}

error() {
    echo -e "${red}Error:${RESET} $*" >&2
    return 1
}

fatal() {
    echo -e "${red}${underline}Fatal Error:${RESET} ${red}$*" >&2
    return 1
}
