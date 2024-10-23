# -----------------------#
# Ignore the following regex when calling `git diff``
ignore_lines=(\"\|\'\|^\\s+\$)

# Private constant variables like API keys/tokens
[[ -f $HOME/.dotfiles/.consts ]] && source "$HOME/.dotfiles/.consts"

[[ -f $HOME/.bash_functions ]] \
	&& . "$HOME/.bash_functions"
	# && alias rf='source $HOME/."${shell_type}"rc'

[[ -f $HOME/.dotfiles/.bash_functions ]] \
	&& source "$HOME/.dotfiles/.bash_functions"
	# && alias rf='source $HOME/.dotfiles/."${shell_type}"rc'

# -- Colors -- #
alias ip='ip -c'
# alias less='less --use-color'
alias pacman='sudo pacman --color=always'
alias ac='$HOME/.venv/bin/python3 $HOME/python/Projects/termllama/termllama/auto_commit.py'
alias bathelp='bat --plain --language=help'
alias batless='bat --style=full --paging=always -pl less'
alias pat='bat --style="plain"'
alias lat='bat --style="auto" --pager=none'
alias fat='bat --style="full"'
alias aliases='alias | bat -l sh -p'
alias back='cd "$OLDPWD"'
alias cleansyslogs='sudo journalctl --vacuum-time=2d'
#alias cdl="cd_ls"
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
alias find_='find . \( ! -path "**/__pycache__" \) \( ! -path "**/venv" \) \
\( ! -path "**/*yarn*" \) \( ! -path "**/.cargo" \) \( ! -path "**/yay" \) \
\( ! -path "**/.venv" \) \( ! -path "**/*conda*" \) \( ! -path "**/*cache" \)'

alias feh="feh -g 1920x1080 --draw-filename --draw-exif --draw-tinted \
-S filename --scale-down --cache-size=1024 --output-dir=/home/joona/Pictures/feh \
--quiet --borderless -C /usr/share/fonts/TTF/ --title-font=FantasqueSansMNerdFontMono-Regular/12"
alias montage='feh -m --thumb-width=640 --thumb-height=640 --stretch \
--limit-width 3840=--limit-height=1080 --borderless -C /usr/share/fonts/TTF \
--title-font=FantasqueSansMNerdFontMono-Regular/32 --index-info "%f\n%n" --preload --output=montage.png'
alias _montage='feh -m --stretch --limit-width 3840 --limit-height 1080 --borderless -C /usr/share/fonts/TTF \
--title-font=FantasqueSansMNerdFontMono-Regular/32 --index-info "%f\n%n" --preload --output=montage.png'
alias ff="cd $HOME/.mozilla/firefox/$ffid"
alias ffp="nohup firefox --private-window &>/dev/null && exit"
alias ff_profile="nohup firefox --ProfileManager &>/dev/null && exit"
alias ffsafe="nohup firefox --safe-mode &>/dev/null && exit"
alias ffs="s --provider duckduckgo"
alias ffu="nohup firefox --url &>/dev/null && exit"
alias getweather='curl wttr.in'
alias ipy="/home/joona/.venv/bin/ipython3 --pprint --nosep --no-confirm-exit --profile=main --colors=Linux"
alias killwine='kill 997 1021 >/dev/null 2>&1;wineserver -k 15;echo done'
alias kwinDebugConsole='qdbus6 org.kde.KWin /KWin org.kde.KWin.showDebugConsole'
alias la="ls -lpha --group-directories-first"
alias lg="ls -ph --group-directories-first"
alias ll="ls -lph --group-directories-first"
alias logs="cd $HOME/Logs/" # .bash_function
alias lsd="ls -lAdh */"
alias lsblkc='/home/joona/.venv/bin/python3 $HOME/python/scripts/bashhelpers/ColorizeOutput/lsblk.py'
alias lt="ls -Altrh --time=mtime --group-directories-first"
alias mail="check_mail" # .bash_function
alias man="man_color"   # .bash_function
alias mv="mv -iv"
alias nano="micro"
alias notes="nohup firefox --url 0.0.0.0:8000/ &>/dev/null && exit"
alias open="xdg-open"
alias osrshydra="osrs_hydra" # .bash_function
alias osrs="nohup flatpak run com.jagexlauncher.JagexLauncher &>/dev/null & disown && kitty +kitten panel --edge=background --config=/home/joona/.config/kitty/panel.d/bg_padded.conf gping 10.0.0.1 -c cyan -b 180 &>/dev/null & disown"
alias osrsping="gping -c cyan oldschool78.runescape.com"
alias paste="wl-paste"
alias pics='cd_pics' # .bash_function
alias printenv="/bin/sh $HOME/scripts/printenv_color.sh | sort"
alias pyp='cd $HOME/python/Projects/ && ls -alph --group-directories-first'
alias psg="ps x | grep -iP"
alias psm='ps_sorted membuff'
alias py='/home/joona/.venv/bin/python3'
alias rg='rg --no-ignore --hidden --ignore-file=/home/joona/.dotfiles/.ripgrep_ignore'
alias rmf='rm -rf'
alias rm="rm -d"
alias sms="/home/joona/.venv/bin/python3 $HOME/python/modules/kdeConnect.py"
alias sizeof="/home/joona/.venv/bin/python3 $HOME/python/scripts/bashhelpers/sizeof.py"
alias sunset="openrgb -p sunset &"
alias up="cd_up" # .bash_function
#alias vdir="vdir --color=auto"
alias venv='source .venv/bin/activate'
alias gvenv='source /home/joona/.venv/bin/activate'
alias ws-cv='vscodium -n $HOME/Code/Workspace/cv.code-workspace'
alias ws-notes='vscodium -n $HOME/Code/Workspace/Notes.code-workspace'
alias ws-bash='vscodium -n $HOME/Code/Workspace/bashscripts.code-workspace && exit'
alias ws="cd $HOME/Code/Workspace/ && ls -ltuph --group-directories-first"
alias ws-cfg="vscodium -n $HOME/Code/Workspace/cfg.code-workspace && exit"
alias ws-ella="vscodium -n $HOME/Code/Workspace/data_entry.code-workspace && exit"
alias ws-html="vscodium -n $HOME/Code/Workspace/html.code-workspace && exit"
alias ws-hwinfo="vscodium -n $HOME/Code/Workspace/py_hwinfo.code-workspace && exit"
alias ws-pi="vscodium -n $HOME/Code/Workspace/RPi.code-workspace && exit"
alias ws-python="vscodium -n $HOME/Code/Workspace/Python.code-workspace && exit"
alias ws-modules="vscodium -n $HOME/Code/Workspace/PythonModules.code-workspace && exit"
alias ws-general="vscodium -n $HOME/Code/Workspace/general.code-workspace && exit"
alias ws-fsutils="vscodium -n $HOME/Code/Workspace/fsutils.code-workspace && exit"
alias ws-termllama="vscodium -n $HOME/Code/Workspace/termllama.code-workspace && exit"

alias x="exit"
alias yay="yay --color=always"
alias md='python3 -m rich.markdown --code-theme material --width=90'
alias fmtdate='python3 -m rich.markdown /home/joona/Docs/Notes/Obsidian/All\ Notes/Code/strftime.md'
alias fmtprint='open "/home/joona/Docs/Notes/HTML/Code/BASH/PRINTF - BASH.html"'
alias rl='cd /home/joona/.var/app/com.jagexlauncher.JagexLauncher/data/user_home/.runelite'
alias s='s --provider duckduckgo'
alias root='sudo --preserve-env -s'

alias llamalist='python3 -m ollama_list'
alias llamaupdate='curl -fsSL https://ollama.com/install.sh | sh && sleep 2;
					sudo systemctl restart ollama'

# Arch Linux Specific
alias pac-info="pacman -Qq | fzf --preview 'pacman -Qil {}';
	--layout=reverse --wrap --bind 'enter:execute(pacman -Qil {} | less)'"
alias pac-info-explicit="pacman -Qqe
	| fzf --preview 'pacman -Qil {}' --layout=reverse --wrap --bind 'enter:execute(pacman -Qil {}
	| less)'"
alias plist='[[ -d $HOME/.dotfiles/ ]] && pacman -Qqe > $HOME/.dotfiles/.pacman-pkglist.txt \
								|| $HOME/.pacman-pkglist.txt'
alias pcheck='sudo paccheck --sha256sum --quiet'
alias pdeps='sudo pacman -Qtdq'
alias update='sudo pacman -Syyu && yay -Syyu --answerclean A'
alias up-noconfirm='sudo pacman -Syyu && yay -Syyu --answerclean A --noconfirm'

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

alias size='python3 -m size' # OVERWRITES BUILT-IN SHELL FUNCTION
alias poet-require='xargs poetry add < requirements.txt'

alias search='apropos'
alias c='paste | wc' # Perform [word|line|character] count on clipboard content
alias mpv='mpv --fs --profile=speed-with-audio --profile=big-cache'
# alias mpvt='mpv -hwdec=auto-safe --cuda-decode-device=0 --hr-seek=no --vd=hevc,hevc_v4l2m2m,h264,hevc_cuvid,h264_cuvid --profile=sw-fast --audio=no'
alias mpvt='mpv --profile=term'
alias winssd='cd /mnt/win_ssd/Users/Joona/Videos/NVIDIA/ && ls -Alph --group-directories-first'
alias clips='cd /mnt/ssd/OBS && ls -Alph --group-directories-first'
# fzf
alias dir="fzf --preview 'fzf-preview.sh {}'"
# Kitty panel
alias kp-ping="kitty +kitten panel --edge=background --config=/home/joona/.config/kitty/panel.d/bg_padded.conf gping 10.0.0.1 -c cyan -b 180 &>/dev/null & disown"
alias cam='source $HOME/.venv/bin/activate && python3 /home/joona/python/scripts/files/dir_sort.py \
	/mnt/hdd/webcam /mnt/hdd/sorted-webcam-clips && \
	cd /mnt/hdd/sorted-webcam-clips/$(date +%Y)/$(date +%B)/$(date +%-d) && ls -Altr'
alias f='fastfetch --config ~/.config/fastfetch/paleofetch.jsonc'
alias tree='tree -a --dirsfirst'
alias treei='tree -a --dirsfirst --gitfile=/home/joona/.gitignore_global'
alias find_='rg --files | rg'
alias trash='send2trash'
# dbus
alias brightness='qdbus6 org.kde.Solid.PowerManagement \
/org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness'
alias brightness_max='qdbus6 org.kde.Solid.PowerManagement \
/org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness 100'
alias brightness_low='qdbus6 org.kde.Solid.PowerManagement \
/org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness 50'
alias goto-notes='cd "$HOME/Docs/Notes/Obsidian/All Notes" && ls -Al --group-directories-first'
alias reboot='systemctl reboot'
alias ssh-server='kitten ssh -t server "cd /home/joona && zsh"'
alias ssh-kodi="kitten ssh -t root@10.0.0.87 'source ./.shrc && ll'"
alias kittycam="mpv http://10.0.0.50:8081 --profile=big-cache --profile=network &>/dev/null && exit"
alias kittycam-term='nohup kitty +kitten panel --config="/home/joona/.config/kitty/panel.d/bg_padded.conf" --edge=background  mpv http://10.0.0.50:8081 --profile=big-cache --profile=network --profile=term &>/dev/null & disown && exit'
alias kppower="nohup kitty +kitten panel --config='/home/joona/.config/kitty/panel.d/bg_padded.conf' \
--edge=background sh -c 'gpu_power.sh' &>/dev/null & disown && exit"
# alias nmap='nmap -F -T5 --min-rate 10 --host-timeout 5s'
alias everforest='cat $HOME/.themes/**/* | copy && parse_and_render_colors.py --simple'
alias pacrecent="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20"
alias cwd='pwd | tee /dev/tty | copy'
alias splot='systemd-analyze plot > /tmp/plot.svg && firefox /tmp/plot.svg'
alias lsc='ls -1 | wc -l'

# alias kp="kitty +kitten panel --edge=background sh -c '$1'"r
# alias xclip="xclip -selection clipboard"
# TODO: See below
# [ ] - mkalias -> python3 makealias.py
if [[ -e $HOME/.dotfiles/.auto_aliases ]]; then
	source $HOME/.dotfiles/.auto_aliases
fi
