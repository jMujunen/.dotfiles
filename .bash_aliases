# ~/.bash_aliases - Joonas Bash Aliases
#

# Modular Variables

# Enable Wayland if not X11
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  enable_wayland="--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
fi

if [ -s ~/.bash_functions ]; then
	. ~/.bash_functions
fi
if [ "$TERM" == "xterm-kitty" ]; then
	alias diff='kitty kitten diff'
fi

alias back='cd "$OLDPWD"'
alias bathelp='bat --plain --language=help'
alias bte="bte"
alias cat='bat --style=full'
#alias cd="{cd};ls -ltupho --group-directories-first"
alias cdl="cd_ls"
alias cdpy="cd_py"
alias cls="clear"
alias code="code"
alias copy="wl-copy"
alias cp="cp -iv"
alias dadjoke='curl https://icanhazdadjoke.com && printf "\n"'
#alias dir="dir --color=auto"
alias diskuse="disk_usage"
alias dl="cd_dl"
alias docs="cd_docs"
alias dus="du -ch | sort -h"
#alias egrep="egrep --color=auto"
# Aliases
alias feh="feh -g 1920x1080 -d -S filename --fullscreen --scale-down --output-dir /home/joona/Picture/feh"
alias ff="firefox &"
alias ffp="firefox --private-window &"
alias ffpm="firefox --ProfileManager &"
alias ffsafe="firefox --safe-mode &"
alias ffs="ffs"
alias ffu="firefox --url"
#alias fgrep="fgrep --color=auto"
alias getweather='curl wttr.in'
alias get_weather="python3 /home/joona/python/command_output/weather_widget.py"
#alias grep="grep --color=auto"
alias img='kitten icat'
alias ipy="python3 -m IPython --profile=main"
alias ipython="python3 -m IPython --profile=main"
#alias kitty="kitty --detach -T '$@'"
alias kwinDebugConsole='qdbus6 org.kde.KWin /KWin org.kde.KWin.showDebugConsole'
alias la="ls -lpha --group-directories-first"
#alias lc="ls -lFgo"
alias lg="ls -ph --group-directories-first"
alias ll="ls -lph --group-directories-first"
#alias lls="ls -lshg"
alias logs="cd_logs"
alias lscripts="list_scripts"
alias lsd="ls -d */"
#alias ls="ls --color=auto"
alias lss="ls -Alshr --group-directories-first"
alias lt="ls -Altr --time=mtime --group-directories-first"
alias m="micro"
# alias mv="mv -i"
alias mv="mv -iv"
alias nano="micro"
alias notes="notes"
alias nset="nvidia-settings &"
alias obsidian="obsidian $enable_wayland 2>/dev/null &"
alias open="xdg-open"
alias osrshydra="osrs_hydra"
alias osrs="osrs"
alias osrsping="gping -c cyan oldschool78.runescape.com"
alias pacrm="pacman-remove"
alias paste="wl-paste"
alias pics='cd_pics'
alias projects='cd ~/python/Projects/ && ls -alph --group-directories-first'
alias psg="ps aux | grep -E"
alias ps="ps aux"                                                    
alias py='execpython'
alias rm="rm -I"
alias sctldr='systemctl daemon-reload'
alias search="apropos"
alias send-sms="send-sms"
alias sizeof="python3 ~/python/scripts/bashhelpers/sizeof.py"
# alias sp="spotify --show-console --log-file=Logs/spotify.log &"
alias sudonset="sudo nvidia-settings &"
alias sunset="openrgb -p sunset &"
alias tnew="tmux new -s"
alias up="up"
#alias vdir="vdir --color=auto"
alias venv='source venv/bin/activate'
alias wez="wezterm start --always-new-process"
alias workspace_bash="vscodium $enable_wayland ~/Code/Workspace/bashscripts.code-workspace && exit"
alias workspace="cd ~/Code/Workspace/ && ls -ltuph --group-directories-first"
alias workspace_cfg="vscodium $enable_wayland ~/Code/Workspace/cfg.code-workspace && exit"
alias workspace_ella="vscodium $enable_wayland ~/Code/Workspace/data_entry.code-workspace && exit"
alias workspace_html="vscodium $enable_wayland ~/Code/Workspace/html.code-workspace && exit"
alias workspace_hwinfo="vscodium $enable_wayland ~/Code/Workspace/py_hwinfo.code-workspace && exit"
alias workspace_pi="vscodium $enable_wayland ~/Code/Workspace/RPi.code-workspace && exit"
alias workspace_psg="vscodium $enable_wayland ~/Code/Workspace/PySimpleGUI.code-workspace && exit"
alias workspace_pyside6="vscodium $enable_wayland ~/Code/Workspace/pyside6.code-workspace && exit"
alias workspace_python="vscodium $enable_wayland ~/Code/Workspace/Python.code-workspace && exit"
alias xclip="xclip -selection clipboard"
alias x="exit"
alias yay="yay --color=always"



# ^ Git commit notes
# ? removed unnecessary `. ~/.bash_functions` calls
