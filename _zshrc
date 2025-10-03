zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%f%.zsh}" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%f%.zsh}"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME=random # set by `omz`
ZSH_THEME="powerlevel10k/powerlevel10k" # set by `omz`
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(pipenv git archlinux nmap taskwarrior)
# <---- Notes ---->
# copybuffer: ctrl + o
#
# Depreciated:
#	aliases
#	poetry-env


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#


# alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

# Use this file for configurations shared between zsh and bash
[[ -f $HOME/.dotfiles/.env ]] && source ~/.dotfiles/.env \
              || /usr/bin/custom/script_failure-notification.sh \
              .zshrc 131 "Failed to source .shellrc from $HOME/ | $HOME/.dotfiles/"

[[ -f ~/.dotfiles/.rootrc ]] && source ~/.dotfiles/.rootrc
#  Custom completions
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] \
    && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Pipx completions
autoload -U compinit && compinit
eval "$(register-python-argcomplete pipx)"
autoload -U bashcompinit
bashcompinit

compinit -d $HOME/.oh-my-zsh/.zcompdump-$ZSH_VERSION

# export LS_COLORS=$LS_COLORS":ow=1;32;7:su=1;31;7:sg=1;30;43"
export LS_COLORS=$LS_COLORS"*~=0;38;2;126;126;126:bd=0;38;2;161;229;232;48;2;106;106;106:ca=0:cd=0;38;2;241;168;219;48;2;106;106;106:di=4;38;2;112;162;209:do=0;38;2;42;42;42;48;2;241;168;219:ex=0;38;2;247;111;110:fi=0:ln=0;38;2;241;168;219:mh=0:mi=0;38;2;42;42;42;48;2;213;134;132:no=0:or=0;38;2;42;42;42;48;2;213;134;132:ow=0:pi=0;38;2;42;42;42;48;2;112;162;209:rs=0:sg=0:so=0;38;2;42;42;42;48;2;241;168;219:st=0:su=0:tw=0:*.1=0;38;2;232;188;146:*.a=0;38;2;247;111;110:*.c=0;38;2;9;190;119:*.d=0;38;2;9;190;119:*.h=0;38;2;9;190;119:*.m=0;38;2;9;190;119:*.o=0;38;2;126;126;126:*.p=0;38;2;9;190;119:*.r=0;38;2;9;190;119:*.t=0;38;2;9;190;119:*.v=0;38;2;9;190;119:*.z=4;38;2;187;217;246:*.7z=4;38;2;187;217;246:*.ai=0;38;2;255;204;238;48;2;42;42;42:*.as=0;38;2;9;190;119:*.bc=0;38;2;126;126;126:*.bz=4;38;2;187;217;246:*.cc=0;38;2;9;190;119:*.cp=0;38;2;9;190;119:*.cr=0;38;2;9;190;119:*.cs=0;38;2;9;190;119:*.db=4;38;2;187;217;246:*.di=0;38;2;9;190;119:*.el=0;38;2;9;190;119:*.ex=0;38;2;9;190;119:*.fs=0;38;2;9;190;119:*.go=0;38;2;9;190;119:*.gv=0;38;2;9;190;119:*.gz=4;38;2;187;217;246:*.ha=0;38;2;9;190;119:*.hh=0;38;2;9;190;119:*.hi=0;38;2;126;126;126:*.hs=0;38;2;9;190;119:*.jl=0;38;2;9;190;119:*.js=0;38;2;9;190;119:*.ko=0;38;2;247;111;110:*.kt=0;38;2;9;190;119:*.la=0;38;2;126;126;126:*.ll=0;38;2;9;190;119:*.lo=0;38;2;126;126;126:*.ma=0;38;2;255;204;238;48;2;42;42;42:*.mb=0;38;2;255;204;238;48;2;42;42;42:*.md=0;38;2;232;188;146:*.mk=0;38;2;135;174;134:*.ml=0;38;2;9;190;119:*.mn=0;38;2;9;190;119:*.nb=0;38;2;9;190;119:*.nu=0;38;2;9;190;119:*.pl=0;38;2;9;190;119:*.pm=0;38;2;9;190;119:*.pp=0;38;2;9;190;119:*.ps=0;38;2;135;214;213:*.py=0;38;2;9;190;119:*.rb=0;38;2;9;190;119:*.rm=0;38;2;255;204;238;48;2;42;42;42:*.rs=0;38;2;9;190;119:*.sh=0;38;2;9;190;119:*.so=0;38;2;247;111;110:*.td=0;38;2;9;190;119:*.ts=0;38;2;9;190;119:*.ui=0;38;2;232;188;146:*.vb=0;38;2;9;190;119:*.wv=0;38;2;255;204;238;48;2;42;42;42:*.xz=4;38;2;187;217;246:*FAQ=0;38;2;57;57;57;48;2;232;188;146:*.3ds=0;38;2;255;204;238;48;2;42;42;42:*.3fr=0;38;2;255;204;238;48;2;42;42;42:*.3mf=0;38;2;255;204;238;48;2;42;42;42:*.adb=0;38;2;9;190;119:*.ads=0;38;2;9;190;119:*.aif=0;38;2;255;204;238;48;2;42;42;42:*.amf=0;38;2;255;204;238;48;2;42;42;42:*.ape=0;38;2;255;204;238;48;2;42;42;42:*.apk=4;38;2;187;217;246:*.ari=0;38;2;255;204;238;48;2;42;42;42:*.arj=4;38;2;187;217;246:*.arw=0;38;2;255;204;238;48;2;42;42;42:*.asa=0;38;2;9;190;119:*.asm=0;38;2;9;190;119:*.aux=0;38;2;126;126;126:*.avi=0;38;2;255;204;238;48;2;42;42;42:*.awk=0;38;2;9;190;119:*.bag=4;38;2;187;217;246:*.bak=0;38;2;126;126;126:*.bat=0;38;2;247;111;110:*.bay=0;38;2;255;204;238;48;2;42;42;42:*.bbl=0;38;2;126;126;126:*.bcf=0;38;2;126;126;126:*.bib=0;38;2;232;188;146:*.bin=4;38;2;187;217;246:*.blg=0;38;2;126;126;126:*.bmp=0;38;2;255;204;238;48;2;42;42;42:*.bsh=0;38;2;9;190;119:*.bst=0;38;2;232;188;146:*.bz2=4;38;2;187;217;246:*.c++=0;38;2;9;190;119:*.cap=0;38;2;255;204;238;48;2;42;42;42:*.cfg=0;38;2;232;188;146:*.cgi=0;38;2;9;190;119:*.clj=0;38;2;9;190;119:*.com=0;38;2;247;111;110:*.cpp=0;38;2;9;190;119:*.cr2=0;38;2;255;204;238;48;2;42;42;42:*.cr3=0;38;2;255;204;238;48;2;42;42;42:*.crw=0;38;2;255;204;238;48;2;42;42;42:*.css=0;38;2;9;190;119:*.csv=0;38;2;232;188;146:*.csx=0;38;2;9;190;119:*.cxx=0;38;2;9;190;119:*.dae=0;38;2;255;204;238;48;2;42;42;42:*.dcr=0;38;2;255;204;238;48;2;42;42;42:*.dcs=0;38;2;255;204;238;48;2;42;42;42:*.deb=4;38;2;187;217;246:*.def=0;38;2;9;190;119:*.dll=0;38;2;247;111;110:*.dmg=4;38;2;187;217;246:*.dng=0;38;2;255;204;238;48;2;42;42;42:*.doc=0;38;2;135;214;213:*.dot=0;38;2;9;190;119:*.dox=0;38;2;135;174;134:*.dpr=0;38;2;9;190;119:*.drf=0;38;2;255;204;238;48;2;42;42;42:*.dxf=0;38;2;255;204;238;48;2;42;42;42:*.eip=0;38;2;255;204;238;48;2;42;42;42:*.elc=0;38;2;9;190;119:*.elm=0;38;2;9;190;119:*.epp=0;38;2;9;190;119:*.eps=0;38;2;255;204;238;48;2;42;42;42:*.erf=0;38;2;255;204;238;48;2;42;42;42:*.erl=0;38;2;9;190;119:*.exe=0;38;2;247;111;110:*.exr=0;38;2;255;204;238;48;2;42;42;42:*.exs=0;38;2;9;190;119:*.fbx=0;38;2;255;204;238;48;2;42;42;42:*.fff=0;38;2;255;204;238;48;2;42;42;42:*.fls=0;38;2;126;126;126:*.flv=0;38;2;255;204;238;48;2;42;42;42:*.fnt=0;38;2;255;204;238;48;2;42;42;42:*.fon=0;38;2;255;204;238;48;2;42;42;42:*.fsi=0;38;2;9;190;119:*.fsx=0;38;2;9;190;119:*.gif=0;38;2;255;204;238;48;2;42;42;42:*.git=0;38;2;126;126;126:*.gpr=0;38;2;255;204;238;48;2;42;42;42:*.gvy=0;38;2;9;190;119:*.h++=0;38;2;9;190;119:*.hda=0;38;2;255;204;238;48;2;42;42;42:*.hip=0;38;2;255;204;238;48;2;42;42;42:*.hpp=0;38;2;9;190;119:*.htc=0;38;2;9;190;119:*.htm=0;38;2;232;188;146:*.hxx=0;38;2;9;190;119:*.ico=0;38;2;255;204;238;48;2;42;42;42:*.ics=0;38;2;135;214;213:*.idx=0;38;2;126;126;126:*.igs=0;38;2;255;204;238;48;2;42;42;42:*.iiq=0;38;2;255;204;238;48;2;42;42;42:*.ilg=0;38;2;126;126;126:*.img=4;38;2;187;217;246:*.inc=0;38;2;9;190;119:*.ind=0;38;2;126;126;126:*.ini=0;38;2;232;188;146:*.inl=0;38;2;9;190;119:*.ino=0;38;2;9;190;119:*.ipp=0;38;2;9;190;119:*.iso=4;38;2;187;217;246:*.jar=4;38;2;187;217;246:*.jpg=0;38;2;255;204;238;48;2;42;42;42:*.jsx=0;38;2;9;190;119:*.jxl=0;38;2;255;204;238;48;2;42;42;42:*.k25=0;38;2;255;204;238;48;2;42;42;42:*.kdc=0;38;2;255;204;238;48;2;42;42;42:*.kex=0;38;2;135;214;213:*.kra=0;38;2;255;204;238;48;2;42;42;42:*.kts=0;38;2;9;190;119:*.log=0;38;2;126;126;126:*.ltx=0;38;2;9;190;119:*.lua=0;38;2;9;190;119:*.m3u=0;38;2;255;204;238;48;2;42;42;42:*.m4a=0;38;2;255;204;238;48;2;42;42;42:*.m4v=0;38;2;255;204;238;48;2;42;42;42:*.mdc=0;38;2;255;204;238;48;2;42;42;42:*.mef=0;38;2;255;204;238;48;2;42;42;42:*.mid=0;38;2;255;204;238;48;2;42;42;42:*.mir=0;38;2;9;190;119:*.mkv=0;38;2;255;204;238;48;2;42;42;42:*.mli=0;38;2;9;190;119:*.mos=0;38;2;255;204;238;48;2;42;42;42:*.mov=0;38;2;255;204;238;48;2;42;42;42:*.mp3=0;38;2;255;204;238;48;2;42;42;42:*.mp4=0;38;2;255;204;238;48;2;42;42;42:*.mpg=0;38;2;255;204;238;48;2;42;42;42:*.mrw=0;38;2;255;204;238;48;2;42;42;42:*.msi=4;38;2;187;217;246:*.mtl=0;38;2;255;204;238;48;2;42;42;42:*.nef=0;38;2;255;204;238;48;2;42;42;42:*.nim=0;38;2;9;190;119:*.nix=0;38;2;232;188;146:*.nrw=0;38;2;255;204;238;48;2;42;42;42:*.obj=0;38;2;255;204;238;48;2;42;42;42:*.obm=0;38;2;255;204;238;48;2;42;42;42:*.odp=0;38;2;135;214;213:*.ods=0;38;2;135;214;213:*.odt=0;38;2;135;214;213:*.ogg=0;38;2;255;204;238;48;2;42;42;42:*.ogv=0;38;2;255;204;238;48;2;42;42;42:*.orf=0;38;2;255;204;238;48;2;42;42;42:*.org=0;38;2;232;188;146:*.otf=0;38;2;255;204;238;48;2;42;42;42:*.otl=0;38;2;255;204;238;48;2;42;42;42:*.out=0;38;2;126;126;126:*.pas=0;38;2;9;190;119:*.pbm=0;38;2;255;204;238;48;2;42;42;42:*.pcx=0;38;2;255;204;238;48;2;42;42;42:*.pdf=0;38;2;135;214;213:*.pef=0;38;2;255;204;238;48;2;42;42;42:*.pgm=0;38;2;255;204;238;48;2;42;42;42:*.php=0;38;2;9;190;119:*.pid=0;38;2;126;126;126:*.pkg=4;38;2;187;217;246:*.png=0;38;2;255;204;238;48;2;42;42;42:*.pod=0;38;2;9;190;119:*.ppm=0;38;2;255;204;238;48;2;42;42;42:*.pps=0;38;2;135;214;213:*.ppt=0;38;2;135;214;213:*.pro=0;38;2;135;174;134:*.ps1=0;38;2;9;190;119:*.psd=0;38;2;255;204;238;48;2;42;42;42:*.ptx=0;38;2;255;204;238;48;2;42;42;42:*.pxn=0;38;2;255;204;238;48;2;42;42;42:*.pyc=0;38;2;126;126;126:*.pyd=0;38;2;126;126;126:*.pyo=0;38;2;126;126;126:*.qoi=0;38;2;255;204;238;48;2;42;42;42:*.r3d=0;38;2;255;204;238;48;2;42;42;42:*.raf=0;38;2;255;204;238;48;2;42;42;42:*.rar=4;38;2;187;217;246:*.raw=0;38;2;255;204;238;48;2;42;42;42:*.rpm=4;38;2;187;217;246:*.rst=0;38;2;232;188;146:*.rtf=0;38;2;135;214;213:*.rw2=0;38;2;255;204;238;48;2;42;42;42:*.rwl=0;38;2;255;204;238;48;2;42;42;42:*.rwz=0;38;2;255;204;238;48;2;42;42;42:*.sbt=0;38;2;9;190;119:*.sql=0;38;2;9;190;119:*.sr2=0;38;2;255;204;238;48;2;42;42;42:*.srf=0;38;2;255;204;238;48;2;42;42;42:*.srw=0;38;2;255;204;238;48;2;42;42;42:*.stl=0;38;2;255;204;238;48;2;42;42;42:*.stp=0;38;2;255;204;238;48;2;42;42;42:*.sty=0;38;2;126;126;126:*.svg=0;38;2;255;204;238;48;2;42;42;42:*.swf=0;38;2;255;204;238;48;2;42;42;42:*.swp=0;38;2;126;126;126:*.sxi=0;38;2;135;214;213:*.sxw=0;38;2;135;214;213:*.tar=4;38;2;187;217;246:*.tbz=4;38;2;187;217;246:*.tcl=0;38;2;9;190;119:*.tex=0;38;2;9;190;119:*.tga=0;38;2;255;204;238;48;2;42;42;42:*.tgz=4;38;2;187;217;246:*.tif=0;38;2;255;204;238;48;2;42;42;42:*.tml=0;38;2;232;188;146:*.tmp=0;38;2;126;126;126:*.toc=0;38;2;126;126;126:*.tsx=0;38;2;9;190;119:*.ttf=0;38;2;255;204;238;48;2;42;42;42:*.txt=0;38;2;232;188;146:*.typ=0;38;2;232;188;146:*.usd=0;38;2;255;204;238;48;2;42;42;42:*.vcd=4;38;2;187;217;246:*.vim=0;38;2;9;190;119:*.vob=0;38;2;255;204;238;48;2;42;42;42:*.vsh=0;38;2;9;190;119:*.wav=0;38;2;255;204;238;48;2;42;42;42:*.wma=0;38;2;255;204;238;48;2;42;42;42:*.wmv=0;38;2;255;204;238;48;2;42;42;42:*.wrl=0;38;2;255;204;238;48;2;42;42;42:*.x3d=0;38;2;255;204;238;48;2;42;42;42:*.x3f=0;38;2;255;204;238;48;2;42;42;42:*.xlr=0;38;2;135;214;213:*.xls=0;38;2;135;214;213:*.xml=0;38;2;232;188;146:*.xmp=0;38;2;232;188;146:*.xpm=0;38;2;255;204;238;48;2;42;42;42:*.xvf=0;38;2;255;204;238;48;2;42;42;42:*.yml=0;38;2;232;188;146:*.zig=0;38;2;9;190;119:*.zip=4;38;2;187;217;246:*.zsh=0;38;2;9;190;119:*.zst=4;38;2;187;217;246:*TODO=1:*hgrc=0;38;2;135;174;134:*.avif=0;38;2;255;204;238;48;2;42;42;42:*.bash=0;38;2;9;190;119:*.braw=0;38;2;255;204;238;48;2;42;42;42:*.conf=0;38;2;232;188;146:*.dart=0;38;2;9;190;119:*.data=0;38;2;255;204;238;48;2;42;42;42:*.diff=0;38;2;9;190;119:*.docx=0;38;2;135;214;213:*.epub=0;38;2;135;214;213:*.fish=0;38;2;9;190;119:*.flac=0;38;2;255;204;238;48;2;42;42;42:*.h264=0;38;2;255;204;238;48;2;42;42;42:*.hack=0;38;2;9;190;119:*.heif=0;38;2;255;204;238;48;2;42;42;42:*.hgrc=0;38;2;135;174;134:*.html=0;38;2;232;188;146:*.iges=0;38;2;255;204;238;48;2;42;42;42:*.info=0;38;2;232;188;146:*.java=0;38;2;9;190;119:*.jpeg=0;38;2;255;204;238;48;2;42;42;42:*.json=0;38;2;232;188;146:*.less=0;38;2;9;190;119:*.lisp=0;38;2;9;190;119:*.lock=0;38;2;126;126;126:*.make=0;38;2;135;174;134:*.mojo=0;38;2;9;190;119:*.mpeg=0;38;2;255;204;238;48;2;42;42;42:*.nims=0;38;2;9;190;119:*.opus=0;38;2;255;204;238;48;2;42;42;42:*.orig=0;38;2;126;126;126:*.pptx=0;38;2;135;214;213:*.prql=0;38;2;9;190;119:*.psd1=0;38;2;9;190;119:*.psm1=0;38;2;9;190;119:*.purs=0;38;2;9;190;119:*.raku=0;38;2;9;190;119:*.rlib=0;38;2;126;126;126:*.sass=0;38;2;9;190;119:*.scad=0;38;2;9;190;119:*.scss=0;38;2;9;190;119:*.step=0;38;2;255;204;238;48;2;42;42;42:*.tbz2=4;38;2;187;217;246:*.tiff=0;38;2;255;204;238;48;2;42;42;42:*.toml=0;38;2;232;188;146:*.usda=0;38;2;255;204;238;48;2;42;42;42:*.usdc=0;38;2;255;204;238;48;2;42;42;42:*.usdz=0;38;2;255;204;238;48;2;42;42;42:*.webm=0;38;2;255;204;238;48;2;42;42;42:*.webp=0;38;2;255;204;238;48;2;42;42;42:*.woff=0;38;2;255;204;238;48;2;42;42;42:*.xbps=4;38;2;187;217;246:*.xlsx=0;38;2;135;214;213:*.yaml=0;38;2;232;188;146:*stdin=0;38;2;126;126;126:*v.mod=0;38;2;135;174;134:*.blend=0;38;2;255;204;238;48;2;42;42;42:*.cabal=0;38;2;9;190;119:*.cache=0;38;2;126;126;126:*.class=0;38;2;126;126;126:*.cmake=0;38;2;135;174;134:*.ctags=0;38;2;126;126;126:*.dylib=0;38;2;247;111;110:*.dyn_o=0;38;2;126;126;126:*.gcode=0;38;2;9;190;119:*.ipynb=0;38;2;9;190;119:*.mdown=0;38;2;232;188;146:*.patch=0;38;2;9;190;119:*.rmeta=0;38;2;126;126;126:*.scala=0;38;2;9;190;119:*.shtml=0;38;2;232;188;146:*.swift=0;38;2;9;190;119:*.toast=4;38;2;187;217;246:*.woff2=0;38;2;255;204;238;48;2;42;42;42:*.xhtml=0;38;2;232;188;146:*Icon\r=0;38;2;126;126;126:*LEGACY=0;38;2;57;57;57;48;2;232;188;146:*NOTICE=0;38;2;57;57;57;48;2;232;188;146:*README=0;38;2;57;57;57;48;2;232;188;146:*go.mod=0;38;2;135;174;134:*go.sum=0;38;2;126;126;126:*passwd=0;38;2;232;188;146:*shadow=0;38;2;232;188;146:*stderr=0;38;2;126;126;126:*stdout=0;38;2;126;126;126:*.bashrc=0;38;2;9;190;119:*.config=0;38;2;232;188;146:*.dyn_hi=0;38;2;126;126;126:*.flake8=0;38;2;135;174;134:*.gradle=0;38;2;9;190;119:*.groovy=0;38;2;9;190;119:*.ignore=0;38;2;135;174;134:*.matlab=0;38;2;9;190;119:*.nimble=0;38;2;9;190;119:*COPYING=0;38;2;135;135;135:*INSTALL=0;38;2;57;57;57;48;2;232;188;146:*LICENCE=0;38;2;135;135;135:*LICENSE=0;38;2;135;135;135:*TODO.md=1:*VERSION=0;38;2;57;57;57;48;2;232;188;146:*.alembic=0;38;2;255;204;238;48;2;42;42;42:*.desktop=0;38;2;232;188;146:*.gemspec=0;38;2;135;174;134:*.mailmap=0;38;2;135;174;134:*Doxyfile=0;38;2;135;174;134:*Makefile=0;38;2;135;174;134:*TODO.txt=1:*setup.py=0;38;2;135;174;134:*.DS_Store=0;38;2;126;126;126:*.cmake.in=0;38;2;135;174;134:*.fdignore=0;38;2;135;174;134:*.kdevelop=0;38;2;135;174;134:*.markdown=0;38;2;232;188;146:*.rgignore=0;38;2;135;174;134:*.tfignore=0;38;2;135;174;134:*CHANGELOG=0;38;2;57;57;57;48;2;232;188;146:*COPYRIGHT=0;38;2;135;135;135:*README.md=0;38;2;57;57;57;48;2;232;188;146:*bun.lockb=0;38;2;126;126;126:*configure=0;38;2;135;174;134:*.gitconfig=0;38;2;135;174;134:*.gitignore=0;38;2;135;174;134:*.localized=0;38;2;126;126;126:*.scons_opt=0;38;2;126;126;126:*.timestamp=0;38;2;126;126;126:*CODEOWNERS=0;38;2;135;174;134:*Dockerfile=0;38;2;232;188;146:*INSTALL.md=0;38;2;57;57;57;48;2;232;188;146:*README.txt=0;38;2;57;57;57;48;2;232;188;146:*SConscript=0;38;2;135;174;134:*SConstruct=0;38;2;135;174;134:*.cirrus.yml=0;38;2;135;174;134:*.gitmodules=0;38;2;135;174;134:*.synctex.gz=0;38;2;126;126;126:*.travis.yml=0;38;2;135;174;134:*INSTALL.txt=0;38;2;57;57;57;48;2;232;188;146:*LICENSE-MIT=0;38;2;135;135;135:*MANIFEST.in=0;38;2;135;174;134:*Makefile.am=0;38;2;135;174;134:*Makefile.in=0;38;2;126;126;126:*.applescript=0;38;2;9;190;119:*.fdb_latexmk=0;38;2;126;126;126:*.webmanifest=0;38;2;232;188;146:*CHANGELOG.md=0;38;2;57;57;57;48;2;232;188;146:*CONTRIBUTING=0;38;2;57;57;57;48;2;232;188;146:*CONTRIBUTORS=0;38;2;57;57;57;48;2;232;188;146:*appveyor.yml=0;38;2;135;174;134:*configure.ac=0;38;2;135;174;134:*.bash_profile=0;38;2;9;190;119:*.clang-format=0;38;2;135;174;134:*.editorconfig=0;38;2;135;174;134:*CHANGELOG.txt=0;38;2;57;57;57;48;2;232;188;146:*.gitattributes=0;38;2;135;174;134:*.gitlab-ci.yml=0;38;2;135;174;134:*CMakeCache.txt=0;38;2;126;126;126:*CMakeLists.txt=0;38;2;135;174;134:*LICENSE-APACHE=0;38;2;135;135;135:*pyproject.toml=0;38;2;135;174;134:*CODE_OF_CONDUCT=0;38;2;57;57;57;48;2;232;188;146:*CONTRIBUTING.md=0;38;2;57;57;57;48;2;232;188;146:*CONTRIBUTORS.md=0;38;2;57;57;57;48;2;232;188;146:*.sconsign.dblite=0;38;2;126;126;126:*CONTRIBUTING.txt=0;38;2;57;57;57;48;2;232;188;146:*CONTRIBUTORS.txt=0;38;2;57;57;57;48;2;232;188;146:*requirements.txt=0;38;2;135;174;134:*package-lock.json=0;38;2;126;126;126:*CODE_OF_CONDUCT.md=0;38;2;57;57;57;48;2;232;188;146:*.CFUserTextEncoding=0;38;2;126;126;126:*CODE_OF_CONDUCT.txt=0;38;2;57;57;57;48;2;232;188;146:*azure-pipelines.yml=0;38;2;135;174;134
"

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

# Traditional '#' comments
setopt INTERACTIVE_COMMENTS



bindkey "^Q" push-input

if [[ -d $(pwd)/.venv ]]; then
	source ./.venv/bin/activate
else
	if ! source /home/joona/.venv/bin/activate; then
	    echo -e "\033[31mError:\033[0m Activating python venv failed"
	    echo -e "\033[33m ~/.dotfiles/.zshrc\033[0m @ line \033[35m 168\033[0m"
	fi
fi

source $HOME/scripts/fzf/fzf-git.sh
