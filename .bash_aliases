# -----------------------#
# Helper for bash/zsh cross compatability
shell=$(echo "$SHELL" | awk -F/ '{print $4}')
ignore_lines=(\"\|\')

# Imports
# Private consts
[[ -f ~/.dotfiles/.consts ]] && . ~/.dotfiles/.consts
[[ -f ~/.bash_functions ]] && . ~/.bash_functions && alias rf='source ~/."$shell"rc'
[[ -f ~/.dotfiles/.bash_functions ]] \
			&& . ~/.dotfiles/.bash_functions \
			&& alias rf='source ~/.dotfiles/."$shell"rc'

[[ "$TERM" == "xterm-kitty" ]] && kitten_aliases

kitten_aliases() {
	alias diff_='kitten diff'
	alias img='kitten icat'
	alias ssh='kitten ssh'
}


# -- Colors -- #
alias diff='diff --color=auto'
alias ip='ip -c'
# alias less='less --use-color'
alias pacman='sudo pacman --color=always'
alias ac='/usr/bin/python3 ~/python/Projects/termllama/termllama/auto_commit.py'
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
alias cp="cp -iv"
alias dadjoke='curl https://icanhazdadjoke.com && printf "\n"'
alias df='python3 ~/python/scripts/bashhelpers/ColorizeOutput/df.py'
alias dl="cd_dl"
alias docs="cd_docs"
alias dus="du -ch | sort -h"
alias free='python3 ~/python/scripts/bashhelpers/ColorizeOutput/free.py'
alias find_='find . \( ! -path "*/__pycache__/*" \) \( ! -path "*/venv/*" \) \( ! -path "*/*yarn*/*" \) \
\( ! -path "*/.cargo/*" \) \( ! -path "*/yay/*" \) \( ! -path "*/.anaconda/*" \) \( ! -path "*/.venv/*" \) \
\( ! -path "*/*conda*/*" \) '
alias feh="feh -g 1920x1080 -d -S filename --fullscreen --scale-down --output-dir /home/joona/Picture/feh"
alias ff="cd ~/.mozilla/firefox/$ffid"
alias ffp="firefox --private-window &"
alias ffpm="firefox --ProfileManager &"
alias ffsafe="firefox --safe-mode &"
alias ffs="s --provider duckduckgo"
alias ffu="firefox --url"
alias getweather='curl wttr.in'
alias get_weather="python3 /home/joona/python/command_output/weather_widget.py"
alias ipy="python3 -m IPython --pprint --nosep --no-confirm-exit --profile=main --colors=Linux"
alias ipython="python3 -m IPython --profile=main --colors=Linux"
alias killwine='kill 997 1021 >/dev/null 2>&1;wineserver -k 15;echo done'
alias kwinDebugConsole='qdbus6 org.kde.KWin /KWin org.kde.KWin.showDebugConsole'
alias la="ls -lpha --group-directories-first"
#alias lc="ls -lFgo"
alias lg="ls -ph --group-directories-first"
alias ll="ls -lph --group-directories-first"
#alias lls="ls -lshg"
alias logs="cd_logs"
alias lsdev="list_scripts"
alias lsd="ls -d */"
alias lsblkc='python3 ~/python/scripts/bashhelpers/ColorizeOutput/lsblk.py'
#alias ls="ls --color=auto"
alias lss="ls -Alshr --group-directories-first"
alias lt="ls -Altrh --time=mtime --group-directories-first"
alias m="micro"
alias mail="check_mail"
alias man="man_color"
alias mv="mv -iv"
alias nano="micro"
alias notes="cd_notes"
alias nset="nvidia-settings > /dev/null 2>&1 & disown && exit"
alias md="nohup obsidian > /dev/null 2>&1 & disown && exit"
alias open="xdg-open"
alias osrshydra="osrs_hydra"
alias osrs="nohup flatpak run com.jagexlauncher.JagexLauncher > /dev/null 2>&1 & disown && exit"
alias osrsping="gping -c cyan oldschool78.runescape.com"
alias paste="wl-paste"
alias pics='cd_pics'
alias printenv='/bin/sh ~/scripts/printenv_color.sh | sort'
alias pyp='cd ~/python/Projects/ && ls -alph --group-directories-first'
alias psg="ps aux | grep -E"
alias psm='ps_sorted membuff'
alias py='python3'
alias rgs='rg --no-ignore --hidden'
alias rmr='rm -rf'
alias rm="rm -I"
alias sms="python3 ~/python/modules/kdeConnect.py"
alias sizeof="python3 ~/python/scripts/bashhelpers/sizeof.py"
alias sunset="openrgb -p sunset &"
alias up="cd_up"
#alias vdir="vdir --color=auto"
alias venv='source venv/bin/activate'
alias workspace_notes='vscodium ~/Code/Workspace/Notes.code-workspace'
alias workspace_bash="vscodium ~/Code/Workspace/bashscripts.code-workspace && exit"
alias workspace_="cd ~/Code/Workspace/ && ls -ltuph --group-directories-first"
alias workspace_cfg="vscodium ~/Code/Workspace/cfg.code-workspace && exit"
alias workspace_ella="vscodium ~/Code/Workspace/data_entry.code-workspace && exit"
alias workspace_html="vscodium ~/Code/Workspace/html.code-workspace && exit"
alias workspace_hwinfo="vscodium ~/Code/Workspace/py_hwinfo.code-workspace && exit"
alias workspace_pi="vscodium ~/Code/Workspace/RPi.code-workspace && exit"
alias workspace_python="vscodium ~/Code/Workspace/Python.code-workspace && exit"
alias workspace_modules="vscodium ~/Code/Workspace/PythonModules.code-workspace && exit"

alias xclip="xclip -selection clipboard"
alias x="exit"
alias yay="yay --color=always"

alias fmtdate='open /home/joona/Docs/Notes/HTML/Code/strftime.html'
alias rl='cd /home/joona/.var/app/com.jagexlauncher.JagexLauncher/data/user_home/.runelite'
alias s='s --provider duckduckgo'
alias root='sudo --preserve-env -s'
# alias llama='ollama serve >/dev/null 2>&1 &'
alias l3='python3 ~/python/Projects/termllama/termllama/main.py'
alias clc='python3 ~/python/Projects/termllama/termllama/main.py codellama:custom'
alias cl='python3 ~/python/Projects/termllama/termllama/main.py codellama:13b'
alias gitmsg='auto_git_msg'
alias llamalog='journalctl --user -e -u ollama'
alias llamaupdate='curl -fsSL https://ollama.com/install.sh | \
sh && sleep 2; sudo systemctl disable --now ollama && systemctl --user restart --now ollama'

# Arch Linux Specific
alias plist='[[ -f ~/.dotfiles/ ]] && pacman -Qqe | tee ./.dotfiles/.pacman-pkglist.txt't
alias pcheck='sudo paccheck --sha256sum --quiet'
alias pdeps='sudo pacman -Qtdq'

# Systemd
alias sctl='systemctl'
alias jctl='journalctl'

# Git
alias gp='git push -u origin master'
alias gca='git commit -a'
alias gi='git init && echo -e "**__pycache__/\n**venv/\n**.git*\n**.pytest_cache/\n.[a-zA-Z0-9]/*" >> .gitignore && touch README.md && echo -e "# basename $PWD"'

alias gs='git status'
alias gss='git show --summary'

alias gd='git diff -pu --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines --ignore-space-at-eol --ignore-matching-lines=$ignore_lines -pu --diff-filter=M'
# shellcheck disable=SC2090
alias gds='git diff -pu --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines --ignore-space-at-eol --ignore-matching-lines=$ignore_lines --staged -pu --diff-filter=M'

alias gdg='git difftool --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines --ignore-space-at-eol'
alias gdgs='git difftool --ignore-all-space --ignore-cr-at-eol --ignore-blank-lines --ignore-space-at-eol --staged'
alias t='touch_helper'

alias hist='omz_history -i'

alias cfg='_dotfiles'
alias mkalias='python3 makealias.py'
alias pdf='zathura'

alias byteconverter='python3 -m ByteConverter'

#alias brightness_max='qdbus6 org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl \
#org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 100'
# alias brightness_low='qdbus6 org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl
# org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 50'
