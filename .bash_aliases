# ~/.bash_aliases - Joonas Bash Aliases
#

# Variables
ffid='h76d4ruz.default-release'

# Enable Wayland if not X11
if [[ "$XDG_SESSION_TYPE" = "wayland" ]]; then
	enable_wayland="--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
fi

if [[ -s ~/.bash_functions ]]; then
	. ~/.bash_functions
elif [[ -s ~/.dotfiles/.bash_functions ]]; then
	. ~/.dotfiles/.bash_functions
fi
if [[ "$TERM" == "xterm-kitty" ]]; then
	alias diff_='kitty kitten diff'
else
	alias diff='diff --color=auto'
fi

# -- Colors -- #
alias ip='ip -c'
# alias less='less --use-color'
alias pacman='sudo pacman --color=always'
alias ac='/usr/bin/python3 ~/python/Projects/ollama/auto_commit.py'
alias bathelp='bat --plain --language=help'
alias follow='batfollow'
alias batless='bat --style=full --paging=always -l less'
alias pat='bat --style="plain"'
alias lat='bat --style="auto" --pager=none'
alias fat='bat --style="full"'
alias bat='bat --style="full"'
alias aliases='alias | bat -l sh -p'
alias back='cd "$OLDPWD"'
alias brightness_max='qdbus6 org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl \
org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 100'
alias brightness_low='qdbus6 org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl \
org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 50'
alias bte="bte_function"
alias cdl="cd_ls"
alias cdpy="cd_py"
alias cls="clear"
alias code="vscodium $enable_wayland $string"
alias copy="wl-copy"
alias cp="cp -iv"
alias dadjoke='curl https://icanhazdadjoke.com && printf "\n"'
#alias du="disk_usage"
alias dl="cd_dl"
alias docs="cd_docs"
alias dus="du -ch | sort -h"
alias feh="feh -g 1920x1080 -d -S filename --fullscreen --scale-down --output-dir /home/joona/Picture/feh"
alias ff="cd ~/.mozilla/firefox/$ffid"
alias ffp="firefox --private-window &"
alias ffpm="firefox --ProfileManager &"
alias ffsafe="firefox --safe-mode &"
alias ffs="s --provider duckduckgo"
alias ffu="firefox --url"
alias getweather='curl wttr.in'
alias get_weather="python3 /home/joona/python/command_output/weather_widget.py"
alias img='kitten icat'
alias ipy="python3 -m IPython --pprint --nosep --no-confirm-exit --profile=main --colors=Linux"
alias ipython="python3 -m IPython --profile=main --colors=Linux"
alias kitty="kitty --detach -T '$@'"
alias killwine='kill 997 1021 2>/dev/null 1>2;wineserver -k 15;echo done'
alias kwinDebugConsole='qdbus6 org.kde.KWin /KWin org.kde.KWin.showDebugConsole'
alias la="ls -lpha --group-directories-first"
#alias lc="ls -lFgo"
alias lg="ls -ph --group-directories-first"
alias ll="ls -lph --group-directories-first"
#alias lls="ls -lshg"
alias logs="cd_logs"
alias lscripts="list_scripts"
alias lsd="ls -d */"
alias lsblkc='python3 ~/python/scripts/bashhelpers/ColorizeOutput/lsblk.py'
#alias ls="ls --color=auto"
alias lss="ls -Alshr --group-directories-first"
alias lt="ls -Altrh --time=mtime --group-directories-first"
alias m="micro"
alias mail="failed_services_function"
alias man="man_color"
alias mv="mv -iv"
alias nano="micro"
alias notes="cd_notes"
alias nset="nvidia-settings >/dev/null 2>&1 &"
alias obsidian="nohup obsidian $enable_wayland >/dev/null 2>&1 &"
alias open="xdg-open"
alias osrshydra="osrs_hydra"
alias osrs="flatpak run com.jagexlauncher.JagexLauncher 2>/dev/null & disown"
alias osrsping="gping -c cyan oldschool78.runescape.com"
alias paste="wl-paste"
alias pics='cd_pics'
alias printenv='/bin/sh ~/scripts/printenv_color.sh | sort'
alias pyp='cd ~/python/Projects/ && ls -alph --group-directories-first'
alias psg="ps aux | grep -E"
alias ps="ps aux"
alias py='python3'
alias rm="rm -I"
alias sms="python3 ~/python/modules/kdeConnect.py"
alias sizeof="python3 ~/python/scripts/bashhelpers/sizeof.py"
alias sunset="openrgb -p sunset &"
alias up="cd_up"
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
alias workspace_python="vscodium $enable_wayland ~/Code/Workspace/Python.code-workspace && exit"
alias xclip="xclip -selection clipboard"
alias x="exit"
alias yay="yay --color=always"

alias s='s --provider duckduckgo'
alias root='sudo --preserve-env -s'
alias llama='ollama serve >/dev/null 2>&1 &'
alias l3='python3 ~/python/Projects/ollama/main.py'
alias clc='python3 ~/python/Projects/ollama/main.py codellama:custom'
alias cl='python3 ~/python/Projects/ollama/main.py codellama:13b'
alias gitmsg='auto_git_msg'
# Arch Linux Specific
plist='pacman -Qqe > pkglist.txt'
pcheck='sudo paccheck --sha256sum --quiet'

# Git
alias gp='git push -u origin master'
alias gca='git commit -a'
alias gi='git init && echo -e "**__pycache__/\n**venv/\n**.git*\n**.pytest_cache/\n.[a-zA-Z0-9]/*" >> .gitignore && touch README.md && echo -e "# basename $PWD"'

alias gs='git status'
alias gss='git show --summary'
alias gd='git diff'
alias gds='git diff --staged'
