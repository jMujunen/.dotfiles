# ~/.bash_aliases - Joonas Bash Aliases
#

# Modular Variables

# Enable Wayland if not X11
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  enable_wayland="--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
fi

alias back='cd "$OLDPWD"'
alias bte=". ~/.bash_functions && bte"
alias cdcode="cd ~/Code"
alias cdl=". ~/.bash_functions && cd_ls"
alias cat='bat'
alias cat1='cat'
#alias cd="{cd};ls -ltupho --group-directories-first"
alias cdpy=". ~/.bash_functions && cd_py"
alias copy="wl-copy"
alias paste="wl-paste"
alias cls="clear"
alias code=". ~/.bash_functions && code"
alias cp="cp -iv"
#alias dir="dir --color=auto"
alias dl=". ~/.bash_functions && cd_dl"
alias docs=". ~/.bash_functions && cd_docs"
alias pics='. ~/.bash_functions && cd_pics'
alias dus="du -ach | sort -h"
#alias egrep="egrep --color=auto"
# Aliases
alias feh="feh -g 1920x1080 -d -S filename --fullscreen --scale-down --output-dir /home/joona/Picture/feh"
alias ff="firefox &"
alias ffp="firefox --private-window &"
alias ffpm="firefox --ProfileManager &"
alias ffsafe="firefox --safe-mode &"
alias ffs=". ~/.bash_functions && ffs"
alias ffu="firefox --url"
#alias fgrep="fgrep --color=auto"
alias get_weather="python3 /home/joona/python/command_output/weather_widget.py"
#alias grep="grep --color=auto"
alias ipy="python3 -m IPython --profile=main"
alias ipython="python3 -m IPython --profile=main"
#alias kitty="kitty --detach -T '$@'"
alias kwinDebugConsole='qdbus6 org.kde.KWin /KWin org.kde.KWin.showDebugConsole'
alias la="ls -lpha --group-directories-first"
#alias lc="ls -lFgo"
alias lg="ls -ph --group-directories-first"
alias ll="ls -lph --group-directories-first"
#alias lls="ls -lshg"
alias logs=". ~/.bash_functions && cd_logs"
alias lscripts=". ~/.bash_functions && list_scripts"
alias lsd="ls -d */"
#alias ls="ls --color=auto"
alias lt="ls -altr --group-directories-first"
alias lss="ls -alshr --group-directories-first"
alias m="micro"
# alias mv="mv -i"
alias mv="mv -iv"
alias nano="micro"
alias notes=". ~/.bash_functions && notes"
alias nset="nvidia-settings &"
alias obsidian="obsidian $enable_wayland"
alias open="xdg-open"
alias osrs=". ~/.bash_functions && osrs"
alias osrsping="gping -c cyan oldschool78.runescape.com"
alias osrshydra=". ~/.bash_functions && osrs_hydra"
alias pacrm=". ~/.bash_functions && pacman-remove"
alias psg="ps aux | grep -E"
alias ps="ps aux"
alias py="python3"                                                      
alias rm="rm -I"
alias search="apropos"
alias send-sms=". ~/.bash_functions && send-sms"
alias sizeof=". ~/.bash_functions && sizeof"
# alias sp="spotify --show-console --log-file=Logs/spotify.log &"
alias sudonset="sudo nvidia-settings &"
alias venv='source venv/bin/activate'
alias sunset="openrgb -p sunset &"
alias tnew="tmux new -s"
alias up=". ~/.bash_functions && up"
#alias vdir="vdir --color=auto"
alias workspace_bash="vscodium $enable_wayland ~/Code/Workspace/bashscripts.code-workspace && exit"
alias workspace_cfg="vscodium $enable_wayland ~/Code/Workspace/cfg.code-workspace && exit"
alias workspace_html="vscodium $enable_wayland ~/Code/Workspace/html.code-workspace && exit"
alias workspace_hwinfo="vscodium $enable_wayland ~/Code/Workspace/py_hwinfo.code-workspace && exit"
alias workspace_python="vscodium $enable_wayland ~/Code/Workspace/Python.code-workspace && exit"
alias workspace_pyside6="vscodium $enable_wayland ~/Code/Workspace/pyside6.code-workspace && exit"
alias workspace_psg="vscodium $enable_wayland ~/Code/Workspace/PySimpleGUI.code-workspace && exit"
alias workspace_pi="vscodium $enable_wayland ~/Code/Workspace/RPi.code-workspace && exit"
alias workspace_ella="vscodium $enable_wayland ~/Code/Workspace/data_entry.code-workspace && exit"
alias workspace="cd ~/Code/Workspace/ && ls -ltuph --group-directories-first"
alias wez="wezterm start --always-new-process"
alias xclip="xclip -selection clipboard"
alias x="exit"
alias yay="yay --color=always"
alias img='kitten icat'
alias sctldr='systemctl daemon-reload'
alias diskuse=". ~/.bash_functions && disk_usage"
alias projects='cd ~/python/Projects/ && ls -alph --group-directories-first'
alias getweather='curl wttr.in'
alias bathelp='bat --plain --language=help'
alias dadjoke='curl https://icanhazdadjoke.com && printf "\n"'
help() {
    "$@" --help 2>&1 | bathelp
}


