ZSH_THEME="agnoster" # set by `omz`
HIST_STAMPS="yyyy-mm-dd"
HYPHEN_INSENSITIVE="true"
plugins=(pipenv git archlinux nmap taskwarrior)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
# [[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

source $HOME/.dotfiles/.env
# Source dedicated alias file
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
[[ -f $HOME/.dotfiles/.bash_aliases ]] && . $HOME/.dotfiles/.bash_aliases
[[ -f $HOME/.dotfiles/.bash_functions ]] && . $HOME/.dotfiles/.bash_functions


if [[ -d $(pwd)/.venv ]]; then
	source ./.venv/bin/activate
fi


bindkey "^Q" push-input
zstyle ':omz:alpha:lib:git' async-prompt yes
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 30

source <(fzf --zsh)

setopt dotglob
# append history list to the history file; this is the default but we make sure
# because it's required for share_history.
setopt append_history
# import new commands from the history file also in other zsh-session
setopt share_history
# save each command's beginning timestamp and the duration to the history file
setopt extended_history
# display PID when suspending processes as well
setopt longlistjobs

