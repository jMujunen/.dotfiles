# -----------------------#
# Helper for bash/zsh cross compatability
shell_type=$(echo "$SHELL" | awk -F/ '{print $4}')
ignore_lines=(\"\|\'\|^\\s+\$)

# TEMP
#  Enable Wayland if not X11
[[ "$XDG_SESSION_TYPE" = "wayland" ]] &&
	enable_wayland="--enable-features=UseOzonePlatform,WaylandWindowDecorations \
--ozone-platform=wayland"

# Private consts
[[ -f $HOME/.dotfiles/.consts ]] && . $HOME/.dotfiles/.consts

[[ -f $HOME/.bash_functions ]] &&
	. "$HOME/.bash_functions" &&
	alias rf='source $HOME/."${shell_type}"rc'

[[ -f $HOME/.dotfiles/.bash_functions ]] &&
	. $HOME/.dotfiles/.bash_functions &&
	alias rf='source $HOME/.dotfiles/."${shell_type}"rc'

[[ "$TERM" == "xterm-kitty" ]] && kitten_aliases || alias diff='diff --color=auto'

kitten_aliases() {
	alias diff='kitten diff'
	alias img='kitten icat'
	alias ssh='kitten ssh'
}

# -- Colors -- #
alias ip='ip -c'
# alias less='less --use-color'
alias pacman='sudo pacman --color=always'
alias ac='/usr/bin/python3 $HOME/python/Projects/termllama/termllama/auto_commit.py'
alias bathelp='bat --plain --language=help'
alias follow='batfollow'
alias batless='bat --style=full --paging=always -pl less'
alias pat='bat --style="plain"'
alias lat='bat --style="auto" --pager=none'
alias fat='bat --style="full"'
alias aliases='alias | bat -l sh -p'
alias back='cd "$OLDPWD"'
alias bte="bte_function"
alias cleansyslogs='sudo journalctl --vacuum-time=2d'
alias cdl="cd_ls"
alias cdpy="cd_py"
alias cls="clear"
alias code="vscodium"
alias copy="wl-copy"
alias cp="cp -Piv"
alias dadjoke='curl https://icanhazdadjoke.com && printf "\n"'
alias df='python3 $HOME/python/scripts/bashhelpers/ColorizeOutput/df.py'
alias dl="cd_dl"
alias docs="cd_docs"
alias dus="du -ch | sort -h"
alias free='python3 $HOME/python/scripts/bashhelpers/ColorizeOutput/free.py'
alias find_='find . \( ! -path "**/__pycache__/" \) \( ! -path "**/venv/" \) \
\( ! -path "**/*yarn*/" \) \( ! -path "**/.cargo/" \) \( ! -path "**/yay/" \) \
\( ! -path "**/.venv/" \) \( ! -path "**/*conda*/" \) \( ! -path "**/*cache/" \)'

alias feh="feh -g 1920x1080 -d -S filename --fullscreen --scale-down
								--output-dir /home/joona/Picture/feh"
alias ff="cd $HOME/.mozilla/firefox/$ffid"
alias ffp="firefox --private-window &"
alias ff_profile="firefox --ProfileManager &"
alias ffsafe="firefox --safe-mode &"
alias ffs="s --provider duckduckgo"
alias ffu="firefox --url"
alias getweather='curl wttr.in'
alias get_weather="python3 /home/joona/python/command_output/weather_widget.py"
alias ipy="poetry run ipython --pprint --nosep --no-confirm-exit --profile=main --colors=Linux"
alias killwine='kill 997 1021 >/dev/null 2>&1;wineserver -k 15;echo done'
alias kwinDebugConsole='qdbus6 org.kde.KWin /KWin org.kde.KWin.showDebugConsole'
alias la="ls -lpha --group-directories-first"
alias lg="ls -ph --group-directories-first"
alias ll="ls -lph --group-directories-first"
alias logs="cd_logs" # .bash_function
alias lsd="ls -lAd */"
alias lsblkc='python3 $HOME/python/scripts/bashhelpers/ColorizeOutput/lsblk.py'
#alias ls="ls --color=auto"
alias lss="ls -Alshr --group-directories-first"
alias lt="ls -Altrh --time=mtime --group-directories-first"
alias m="micro"
alias mail="check_mail" # .bash_function
alias man="man_color" # .bash_function
alias mv="mv -iv"
alias nano="micro"
alias notes="cd_notes" # .bash_function
alias nset="nvidia-settings > /dev/null 2>&1 & disown && exit"
alias md='obsidian > /dev/null 2>&1 & disown'
alias open="xdg-open"
alias osrshydra="osrs_hydra"  # .bash_function
alias osrs="flatpak run com.jagexlauncher.JagexLauncher > /dev/null 2>&1 \
								 & disown && exit"
alias osrsping="gping -c cyan oldschool78.runescape.com"
alias paste="wl-paste"
alias pics='cd_pics' # .bash_function
alias printenv="/bin/sh $HOME/scripts/printenv_color.sh | sort"
alias pyp='cd $HOME/python/Projects/ && ls -alph --group-directories-first'
alias psg="ps aux | grep -E"
alias psm='ps_sorted membuff'
alias py='python3'
alias rg='rg --no-ignore --hidden'
alias rmr='rm -rf'
alias rm="rm -I"
alias sms="python3 $HOME/python/modules/kdeConnect.py"
alias sizeof="python3 $HOME/python/scripts/bashhelpers/sizeof.py"
alias sunset="openrgb -p sunset &"
alias up="cd_up" # .bash_function
#alias vdir="vdir --color=auto"
alias venv='source venv/bin/activate'
alias ws-notes='vscodium $HOME/Code/Workspace/Notes.code-workspace'
alias ws-bash="vscodium $HOME/Code/Workspace/bashscripts.code-workspace && exit"
alias workspaces="cd $HOME/Code/Workspace/ && ls -ltuph --group-directories-first"
alias ws-cfg="vscodium $HOME/Code/Workspace/cfg.code-workspace && exit"
alias ws-ella="vscodium $HOME/Code/Workspace/data_entry.code-workspace && exit"
alias ws-html="vscodium $HOME/Code/Workspace/html.code-workspace && exit"
alias ws-hwinfo="vscodium $HOME/Code/Workspace/py_hwinfo.code-workspace && exit"
alias ws-pi="vscodium $HOME/Code/Workspace/RPi.code-workspace && exit"
alias ws-python="vscodium $HOME/Code/Workspace/Python.code-workspace && exit"
alias ws-modules="vscodium $HOME/Code/Workspace/PythonModules.code-workspace && exit"
alias ws-general="vscodium $HOME/Code/Workspace/general.code-workspace && exit"

alias x="exit"
alias yay="yay --color=always"

alias fmtdate='cat /home/joona/Docs/Notes/Obsidian/All\ Notes/Code/strftime.md | glow'
alias fmtprint='open /home/joona/Docs/Notes/HTML/Code/BASH'
alias rl='cd /home/joona/.var/app/com.jagexlauncher.JagexLauncher/data/user_home/.runelite'
alias s='s --provider duckduckgo'
alias root='sudo --preserve-env -s'

alias l3='python3 $HOME/python/Projects/termllama/termllama/main.py'
alias gitmsg='auto_git_msg'
alias llamalog='journalctl --user -e -u ollama'
alias llamaupdate='curl -fsSL https://ollama.com/install.sh | sh && sleep 2;
					sudo systemctl disable --now ollama \
					&& systemctl --user restart --now ollama'

# Arch Linux Specific
alias plist='[[ -d $HOME/.dotfiles/ ]] && pacman -Qqe > $HOME/.dotfiles/.pacman-pkglist.txt \
								|| $HOME/.pacman-pkglist.txt'
alias pcheck='sudo paccheck --sha256sum --quiet'
alias pdeps='sudo pacman -Qtdq'

# Systemd
alias j='journalctl'
alias jp='journalctl -b --priority'
alias logu='journalctl --user -e -u'
alias log='journalctl -e -u'

alias restart='sudo systemctl start reboot.target'
alias sctluser='systemctl --user'
alias sctl='systemctl'
alias report='systemctl status --all && systemctl --list-all-units'

# Git
alias gp='git push -u origin master'
alias gca='git commit -a'
alias gi='git init && touch README.md && echo -e "# basename $PWD"'

alias gs='git status'
alias gss='git show --summary'

alias gd='git diff --patch-with-stat --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines \
						--ignore-space-at-eol --ignore-matching-lines=$ignore_lines \
						--diff-filter=M'

alias gds='git diff --patch-with-stat --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines \
						 --ignore-space-at-eol --ignore-matching-lines=$ignore_lines \
						 --staged --diff-filter=M'

alias gdg='git difftool --ignore-all-space --ignore-cr-at-eol \
						--ignore-blank-lines --ignore-space-at-eol'
alias gdgs='git difftool --ignore-all-space --ignore-cr-at-eol \
						--ignore-blank-lines --ignore-space-at-eol --staged'

alias hist='omz_history -i'
alias pdf='zathura'

alias size='python3 -m size' # OVERWRITES BUILT-IN SHELL FUNCTION
alias poet-require='xargs poetry add < requirements.txt'
alias p='poetry'
alias update='sudo pacman -Syyu && yay -Syyu --answerclean A'
alias up-noconfirm='sudo pacman -Syyu && yay -Syyu --answerclean A --noconfirm'
alias wp='$(ls /home/joona/.config/kitty/assets/ | shuf -n 1)'
alias search='apropos'
alias c='paste | wc'
alias win_ssd='cd /mnt/win_ssd/Users/Joona/Videos/NVIDIA'
alias tree='tree -a'
alias mpv='mpv --fs'


alias brightness='qdbus6 org.kde.Solid.PowerManagement \
/org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness'
alias brightness_max='qdbus6 org.kde.Solid.PowerManagement \
/org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness 100'
alias brightness_low='qdbus6 org.kde.Solid.PowerManagement \
/org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness 50'

# alias kppower="nohup kitty +kitten panel --edge=background sh -c 'gpu_power.sh' >/dev/null 2>&1 &"
# alias kp="kitty +kitten panel --edge=background sh -c '$1'"
# alias xclip="xclip -selection clipboard"
# TODO: See below
# [ ] - mkalias -> python3 makealias.py
