#
# ~/.bash_aliases - Joona="s Bash Aliases
#

# Modular Variables

enable_wayland="--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"


alias back="cd $OLDPWD"
alias bte=". ~/.bash_functions && bte"
alias cdcode="cd ~/Code"
alias cdl=". ~/.bash_functions && cd_ls"
#alias cd="{cd};ls -ltupho --group-directories-first"
alias cdpy=". ~/.bash_functions && cdpy"
alias copy="wl-copy"
alias paste="wl-paste"
alias cls="clear"
alias code="vscodium $enable_wayland"
alias cp="cp -iv"
#alias dir="dir --color=auto"
alias dl=". ~/.bash_functions && dl"
alias docs=". ~/.bash_functions && docs"
alias dus="du -ach | sort -h"
#alias egrep="egrep --color=auto"
# Aliases
alias ff="firefox &"
alias ffp="firefox --private-window &"
alias ffpm="firefox --ProfileManager &"
alias ffsafe="firefox --safe-mode &"
alias ffs=". ~/.bash_functions && ffs"
alias ffu="firefox --url"
#alias fgrep="fgrep --color=auto"
alias get_weather="python3 /home/joona/python/weather_widget.py"
#alias grep="grep --color=auto"
alias ipy="python3 -m IPython"
alias ipython="python3 -m IPython"
alias kitty="kitty --detach -T"
alias la="ls -lpha --group-directories-first"
#alias lc="ls -lFgo"
alias lg="ls -ph --group-directories-first"
alias ll="ls -lph --group-directories-first"
#alias lls="ls -lshg"
alias logs=". ~/.bash_functions && logs"
alias lscripts=". ~/.bash_functions && list_scripts"
#alias ls="ls --color=auto"
alias lt="ls -ltph --group-directories-first"
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
alias sunset="openrgb -p sunset &"
alias tnew="tmux new -s"
alias up=". ~/.bash_functions && up"
#alias vdir="vdir --color=auto"
alias workspace_bash="vscodium $enable_wayland ~/Code/Workspace/bashscripts.code-workspace &"
alias workspace_cfg="vscodium $enable_wayland ~/Code/Workspace/cfg.code-workspace &"
alias workspace_html="vscodium $enable_wayland ~/Code/Workspace/html.code-workspace &"
alias workspace_hwinfo="vscodium $enable_wayland ~/Code/Workspace/py_hwinfo.code-workspace &"
alias workspace_python="vscodium $enable_wayland ~/Code/Workspace/Python.code-workspace &"
alias workspace_pyside6="vscodium $enable_wayland ~/Code/Workspace/pyside6.code-workspace &"
alias workspace_psg="vscodium $enable_wayland ~/Code/Workspace/PySimpleGUI.code-workspace &"
alias workspace_pi="vscodium $enable_wayland ~/Code/Workspace/RPi.code-workspace &"

alias workspace="cd ~/Code/Workspace/ && ls -ltuph --group-directories-first"
alias w="wezterm start --always-new-process"
alias xclip="xclip -selection clipboard"
alias x="exit"
alias yay="yay --color=always --removemake"

alias osmc='ssh osmc@10.0.0.87'
alias pihole='ssh joona@10.0.0.132'
alias scp='. ~/.bash_functions && scp'
#     scp osmc local/file /path/to/remote/file
#     scp osmc -i ~/.ssh/osmc osmc
#     scp osmc -i ~/.ssh/osmc osmc@10.0.0.87


alias myscp='scp -i ~/.ssh/$1'
alias myremotefile='user@remote_server:/path/to/destination/'
alias mycomplexscp='myscp /path/to/local/file myremotefile'
