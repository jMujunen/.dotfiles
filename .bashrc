# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
HISTFILESIZE=20000
HISTTIMEFORMAT="%h/%d/%Y %H:%M.%S %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    t1_bg="\[$(tput setab 31)\]"
    t1_fg="\[$(tput setaf 31)\]"
    t2_bg="\[$(tput setab 91)\]"
    t2_fg="\[$(tput setaf 91)\]"
    RESET="\[$(tput sgr0)\]"

    triangle_1=$(echo -e "${t1_fg}${t2_bg}\uE0B0${RESET}")
    triangle_2=$(echo -e "${t2_fg}\uE0B0")

    PS1="${t1_bg}\A \h${RESET}${triangle_1}${t2_bg} \w ${RESET}${triangle_2}${RESET} "
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\][\T]\h:\[\033[01;35m\]\w\[\033[00m\]\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;

esac

# More colors
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LS_COLORS=$LS_COLORS":ow=32;7"
export LS_COLORS=$LS_COLORS":*~=0;38;2;102;102;102:bd=0;38;2;86;182;194;48;2;51;51;51:ca=0:cd=0;38;2;255;106;193;48;2;51;51;51:di=0;38;2;97;175;239:do=0;38;2;0;0;0;48;2;255;106;193:ex=1;38;2;224;108;117:fi=0:ln=0;38;2;255;106;193:mh=0:mi=0;38;2;0;0;0;48;2;224;108;117:no=0:or=0;38;2;0;0;0;48;2;224;108;117:ow=0:pi=0;38;2;0;0;0;48;2;97;175;239:rs=0:sg=0:so=0;38;2;0;0;0;48;2;255;106;193:st=0:su=0:tw=0:*.1=0;38;2;229;192;123:*.a=1;38;2;224;108;117:*.c=0;38;2;152;195;121:*.d=0;38;2;152;195;121:*.h=0;38;2;152;195;121:*.m=0;38;2;152;195;121:*.o=0;38;2;102;102;102:*.p=0;38;2;152;195;121:*.r=0;38;2;152;195;121:*.t=0;38;2;152;195;121:*.v=0;38;2;152;195;121:*.z=4;38;2;86;182;194:*.7z=4;38;2;86;182;194:*.ai=0;38;2;255;106;193:*.as=0;38;2;152;195;121:*.bc=0;38;2;102;102;102:*.bz=4;38;2;86;182;194:*.cc=0;38;2;152;195;121:*.cp=0;38;2;152;195;121:*.cr=0;38;2;152;195;121:*.cs=0;38;2;152;195;121:*.db=4;38;2;86;182;194:*.di=0;38;2;152;195;121:*.el=0;38;2;152;195;121:*.ex=0;38;2;152;195;121:*.fs=0;38;2;152;195;121:*.go=0;38;2;152;195;121:*.gv=0;38;2;152;195;121:*.gz=4;38;2;86;182;194:*.ha=0;38;2;152;195;121:*.hh=0;38;2;152;195;121:*.hi=0;38;2;102;102;102:*.hs=0;38;2;152;195;121:*.jl=0;38;2;152;195;121:*.js=0;38;2;152;195;121:*.ko=1;38;2;224;108;117:*.kt=0;38;2;152;195;121:*.la=0;38;2;102;102;102:*.ll=0;38;2;152;195;121:*.lo=0;38;2;102;102;102:*.ma=0;38;2;255;106;193:*.mb=0;38;2;255;106;193:*.md=0;38;2;229;192;123:*.mk=0;38;2;152;195;121:*.ml=0;38;2;152;195;121:*.mn=0;38;2;152;195;121:*.nb=0;38;2;152;195;121:*.nu=0;38;2;152;195;121:*.pl=0;38;2;152;195;121:*.pm=0;38;2;152;195;121:*.pp=0;38;2;152;195;121:*.ps=0;38;2;224;108;117:*.py=0;38;2;152;195;121:*.rb=0;38;2;152;195;121:*.rm=0;38;2;255;106;193:*.rs=0;38;2;152;195;121:*.sh=0;38;2;152;195;121:*.so=1;38;2;224;108;117:*.td=0;38;2;152;195;121:*.ts=0;38;2;152;195;121:*.ui=0;38;2;229;192;123:*.vb=0;38;2;152;195;121:*.wv=0;38;2;255;106;193:*.xz=4;38;2;86;182;194:*FAQ=0;38;2;40;44;52;48;2;229;192;123:*.3ds=0;38;2;255;106;193:*.3fr=0;38;2;255;106;193:*.3mf=0;38;2;255;106;193:*.adb=0;38;2;152;195;121:*.ads=0;38;2;152;195;121:*.aif=0;38;2;255;106;193:*.amf=0;38;2;255;106;193:*.ape=0;38;2;255;106;193:*.apk=4;38;2;86;182;194:*.ari=0;38;2;255;106;193:*.arj=4;38;2;86;182;194:*.arw=0;38;2;255;106;193:*.asa=0;38;2;152;195;121:*.asm=0;38;2;152;195;121:*.aux=0;38;2;102;102;102:*.avi=0;38;2;255;106;193:*.awk=0;38;2;152;195;121:*.bag=4;38;2;86;182;194:*.bak=0;38;2;102;102;102:*.bat=1;38;2;224;108;117:*.bay=0;38;2;255;106;193:*.bbl=0;38;2;102;102;102:*.bcf=0;38;2;102;102;102:*.bib=0;38;2;229;192;123:*.bin=4;38;2;86;182;194:*.blg=0;38;2;102;102;102:*.bmp=0;38;2;255;106;193:*.bsh=0;38;2;152;195;121:*.bst=0;38;2;229;192;123:*.bz2=4;38;2;86;182;194:*.c++=0;38;2;152;195;121:*.cap=0;38;2;255;106;193:*.cfg=0;38;2;229;192;123:*.cgi=0;38;2;152;195;121:*.clj=0;38;2;152;195;121:*.com=1;38;2;224;108;117:*.cpp=0;38;2;152;195;121:*.cr2=0;38;2;255;106;193:*.cr3=0;38;2;255;106;193:*.crw=0;38;2;255;106;193:*.css=0;38;2;152;195;121:*.csv=0;38;2;229;192;123:*.csx=0;38;2;152;195;121:*.cxx=0;38;2;152;195;121:*.dae=0;38;2;255;106;193:*.dcr=0;38;2;255;106;193:*.dcs=0;38;2;255;106;193:*.deb=4;38;2;86;182;194:*.def=0;38;2;152;195;121:*.dll=1;38;2;224;108;117:*.dmg=4;38;2;86;182;194:*.dng=0;38;2;255;106;193:*.doc=0;38;2;224;108;117:*.dot=0;38;2;152;195;121:*.dox=0;38;2;152;195;121:*.dpr=0;38;2;152;195;121:*.drf=0;38;2;255;106;193:*.dxf=0;38;2;255;106;193:*.eip=0;38;2;255;106;193:*.elc=0;38;2;152;195;121:*.elm=0;38;2;152;195;121:*.epp=0;38;2;152;195;121:*.eps=0;38;2;255;106;193:*.erf=0;38;2;255;106;193:*.erl=0;38;2;152;195;121:*.exe=1;38;2;224;108;117:*.exr=0;38;2;255;106;193:*.exs=0;38;2;152;195;121:*.fbx=0;38;2;255;106;193:*.fff=0;38;2;255;106;193:*.fls=0;38;2;102;102;102:*.flv=0;38;2;255;106;193:*.fnt=0;38;2;255;106;193:*.fon=0;38;2;255;106;193:*.fsi=0;38;2;152;195;121:*.fsx=0;38;2;152;195;121:*.gif=0;38;2;255;106;193:*.git=0;38;2;102;102;102:*.gpr=0;38;2;255;106;193:*.gvy=0;38;2;152;195;121:*.h++=0;38;2;152;195;121:*.hda=0;38;2;255;106;193:*.hip=0;38;2;255;106;193:*.hpp=0;38;2;152;195;121:*.htc=0;38;2;152;195;121:*.htm=0;38;2;229;192;123:*.hxx=0;38;2;152;195;121:*.ico=0;38;2;255;106;193:*.ics=0;38;2;224;108;117:*.idx=0;38;2;102;102;102:*.igs=0;38;2;255;106;193:*.iiq=0;38;2;255;106;193:*.ilg=0;38;2;102;102;102:*.img=4;38;2;86;182;194:*.inc=0;38;2;152;195;121:*.ind=0;38;2;102;102;102:*.ini=0;38;2;229;192;123:*.inl=0;38;2;152;195;121:*.ino=0;38;2;152;195;121:*.ipp=0;38;2;152;195;121:*.iso=4;38;2;86;182;194:*.jar=4;38;2;86;182;194:*.jpg=0;38;2;255;106;193:*.jsx=0;38;2;152;195;121:*.jxl=0;38;2;255;106;193:*.k25=0;38;2;255;106;193:*.kdc=0;38;2;255;106;193:*.kex=0;38;2;224;108;117:*.kra=0;38;2;255;106;193:*.kts=0;38;2;152;195;121:*.log=0;38;2;102;102;102:*.ltx=0;38;2;152;195;121:*.lua=0;38;2;152;195;121:*.m3u=0;38;2;255;106;193:*.m4a=0;38;2;255;106;193:*.m4v=0;38;2;255;106;193:*.mdc=0;38;2;255;106;193:*.mef=0;38;2;255;106;193:*.mid=0;38;2;255;106;193:*.mir=0;38;2;152;195;121:*.mkv=0;38;2;255;106;193:*.mli=0;38;2;152;195;121:*.mos=0;38;2;255;106;193:*.mov=0;38;2;255;106;193:*.mp3=0;38;2;255;106;193:*.mp4=0;38;2;255;106;193:*.mpg=0;38;2;255;106;193:*.mrw=0;38;2;255;106;193:*.msi=4;38;2;86;182;194:*.mtl=0;38;2;255;106;193:*.nef=0;38;2;255;106;193:*.nim=0;38;2;152;195;121:*.nix=0;38;2;229;192;123:*.nrw=0;38;2;255;106;193:*.obj=0;38;2;255;106;193:*.obm=0;38;2;255;106;193:*.odp=0;38;2;224;108;117:*.ods=0;38;2;224;108;117:*.odt=0;38;2;224;108;117:*.ogg=0;38;2;255;106;193:*.ogv=0;38;2;255;106;193:*.orf=0;38;2;255;106;193:*.org=0;38;2;229;192;123:*.otf=0;38;2;255;106;193:*.otl=0;38;2;255;106;193:*.out=0;38;2;102;102;102:*.pas=0;38;2;152;195;121:*.pbm=0;38;2;255;106;193:*.pcx=0;38;2;255;106;193:*.pdf=0;38;2;224;108;117:*.pef=0;38;2;255;106;193:*.pgm=0;38;2;255;106;193:*.php=0;38;2;152;195;121:*.pid=0;38;2;102;102;102:*.pkg=4;38;2;86;182;194:*.png=0;38;2;255;106;193:*.pod=0;38;2;152;195;121:*.ppm=0;38;2;255;106;193:*.pps=0;38;2;224;108;117:*.ppt=0;38;2;224;108;117:*.pro=0;38;2;152;195;121:*.ps1=0;38;2;152;195;121:*.psd=0;38;2;255;106;193:*.ptx=0;38;2;255;106;193:*.pxn=0;38;2;255;106;193:*.pyc=0;38;2;102;102;102:*.pyd=0;38;2;102;102;102:*.pyo=0;38;2;102;102;102:*.qoi=0;38;2;255;106;193:*.r3d=0;38;2;255;106;193:*.raf=0;38;2;255;106;193:*.rar=4;38;2;86;182;194:*.raw=0;38;2;255;106;193:*.rpm=4;38;2;86;182;194:*.rst=0;38;2;229;192;123:*.rtf=0;38;2;224;108;117:*.rw2=0;38;2;255;106;193:*.rwl=0;38;2;255;106;193:*.rwz=0;38;2;255;106;193:*.sbt=0;38;2;152;195;121:*.sql=0;38;2;152;195;121:*.sr2=0;38;2;255;106;193:*.srf=0;38;2;255;106;193:*.srw=0;38;2;255;106;193:*.stl=0;38;2;255;106;193:*.stp=0;38;2;255;106;193:*.sty=0;38;2;102;102;102:*.svg=0;38;2;255;106;193:*.swf=0;38;2;255;106;193:*.swp=0;38;2;102;102;102:*.sxi=0;38;2;224;108;117:*.sxw=0;38;2;224;108;117:*.tar=4;38;2;86;182;194:*.tbz=4;38;2;86;182;194:*.tcl=0;38;2;152;195;121:*.tex=0;38;2;152;195;121:*.tga=0;38;2;255;106;193:*.tgz=4;38;2;86;182;194:*.tif=0;38;2;255;106;193:*.tml=0;38;2;229;192;123:*.tmp=0;38;2;102;102;102:*.toc=0;38;2;102;102;102:*.tsx=0;38;2;152;195;121:*.ttf=0;38;2;255;106;193:*.txt=0;38;2;229;192;123:*.typ=0;38;2;229;192;123:*.usd=0;38;2;255;106;193:*.vcd=4;38;2;86;182;194:*.vim=0;38;2;152;195;121:*.vob=0;38;2;255;106;193:*.vsh=0;38;2;152;195;121:*.wav=0;38;2;255;106;193:*.wma=0;38;2;255;106;193:*.wmv=0;38;2;255;106;193:*.wrl=0;38;2;255;106;193:*.x3d=0;38;2;255;106;193:*.x3f=0;38;2;255;106;193:*.xlr=0;38;2;224;108;117:*.xls=0;38;2;224;108;117:*.xml=0;38;2;229;192;123:*.xmp=0;38;2;229;192;123:*.xpm=0;38;2;255;106;193:*.xvf=0;38;2;255;106;193:*.yml=0;38;2;229;192;123:*.zig=0;38;2;152;195;121:*.zip=4;38;2;86;182;194:*.zsh=0;38;2;152;195;121:*.zst=4;38;2;86;182;194:*TODO=1:*hgrc=0;38;2;152;195;121:*.avif=0;38;2;255;106;193:*.bash=0;38;2;152;195;121:*.braw=0;38;2;255;106;193:*.conf=0;38;2;229;192;123:*.dart=0;38;2;152;195;121:*.data=0;38;2;255;106;193:*.diff=0;38;2;152;195;121:*.docx=0;38;2;224;108;117:*.epub=0;38;2;224;108;117:*.fish=0;38;2;152;195;121:*.flac=0;38;2;255;106;193:*.h264=0;38;2;255;106;193:*.hack=0;38;2;152;195;121:*.heif=0;38;2;255;106;193:*.hgrc=0;38;2;152;195;121:*.html=0;38;2;229;192;123:*.iges=0;38;2;255;106;193:*.info=0;38;2;229;192;123:*.java=0;38;2;152;195;121:*.jpeg=0;38;2;255;106;193:*.json=0;38;2;229;192;123:*.less=0;38;2;152;195;121:*.lisp=0;38;2;152;195;121:*.lock=0;38;2;102;102;102:*.make=0;38;2;152;195;121:*.mojo=0;38;2;152;195;121:*.mpeg=0;38;2;255;106;193:*.nims=0;38;2;152;195;121:*.opus=0;38;2;255;106;193:*.orig=0;38;2;102;102;102:*.pptx=0;38;2;224;108;117:*.prql=0;38;2;152;195;121:*.psd1=0;38;2;152;195;121:*.psm1=0;38;2;152;195;121:*.purs=0;38;2;152;195;121:*.raku=0;38;2;152;195;121:*.rlib=0;38;2;102;102;102:*.sass=0;38;2;152;195;121:*.scad=0;38;2;152;195;121:*.scss=0;38;2;152;195;121:*.step=0;38;2;255;106;193:*.tbz2=4;38;2;86;182;194:*.tiff=0;38;2;255;106;193:*.toml=0;38;2;229;192;123:*.usda=0;38;2;255;106;193:*.usdc=0;38;2;255;106;193:*.usdz=0;38;2;255;106;193:*.webm=0;38;2;255;106;193:*.webp=0;38;2;255;106;193:*.woff=0;38;2;255;106;193:*.xbps=4;38;2;86;182;194:*.xlsx=0;38;2;224;108;117:*.yaml=0;38;2;229;192;123:*stdin=0;38;2;102;102;102:*v.mod=0;38;2;152;195;121:*.blend=0;38;2;255;106;193:*.cabal=0;38;2;152;195;121:*.cache=0;38;2;102;102;102:*.class=0;38;2;102;102;102:*.cmake=0;38;2;152;195;121:*.ctags=0;38;2;102;102;102:*.dylib=1;38;2;224;108;117:*.dyn_o=0;38;2;102;102;102:*.gcode=0;38;2;152;195;121:*.ipynb=0;38;2;152;195;121:*.mdown=0;38;2;229;192;123:*.patch=0;38;2;152;195;121:*.rmeta=0;38;2;102;102;102:*.scala=0;38;2;152;195;121:*.shtml=0;38;2;229;192;123:*.swift=0;38;2;152;195;121:*.toast=4;38;2;86;182;194:*.woff2=0;38;2;255;106;193:*.xhtml=0;38;2;229;192;123:*Icon\r=0;38;2;102;102;102:*LEGACY=0;38;2;40;44;52;48;2;229;192;123:*NOTICE=0;38;2;40;44;52;48;2;229;192;123:*README=0;38;2;40;44;52;48;2;229;192;123:*go.mod=0;38;2;152;195;121:*go.sum=0;38;2;102;102;102:*passwd=0;38;2;229;192;123:*shadow=0;38;2;229;192;123:*stderr=0;38;2;102;102;102:*stdout=0;38;2;102;102;102:*.bashrc=0;38;2;152;195;121:*.config=0;38;2;229;192;123:*.dyn_hi=0;38;2;102;102;102:*.flake8=0;38;2;152;195;121:*.gradle=0;38;2;152;195;121:*.groovy=0;38;2;152;195;121:*.ignore=0;38;2;152;195;121:*.matlab=0;38;2;152;195;121:*.nimble=0;38;2;152;195;121:*COPYING=0;38;2;153;153;153:*INSTALL=0;38;2;40;44;52;48;2;229;192;123:*LICENCE=0;38;2;153;153;153:*LICENSE=0;38;2;153;153;153:*TODO.md=1:*VERSION=0;38;2;40;44;52;48;2;229;192;123:*.alembic=0;38;2;255;106;193:*.desktop=0;38;2;229;192;123:*.gemspec=0;38;2;152;195;121:*.mailmap=0;38;2;152;195;121:*Doxyfile=0;38;2;152;195;121:*Makefile=0;38;2;152;195;121:*TODO.txt=1:*setup.py=0;38;2;152;195;121:*.DS_Store=0;38;2;102;102;102:*.cmake.in=0;38;2;152;195;121:*.fdignore=0;38;2;152;195;121:*.kdevelop=0;38;2;152;195;121:*.markdown=0;38;2;229;192;123:*.rgignore=0;38;2;152;195;121:*.tfignore=0;38;2;152;195;121:*CHANGELOG=0;38;2;40;44;52;48;2;229;192;123:*COPYRIGHT=0;38;2;153;153;153:*README.md=0;38;2;40;44;52;48;2;229;192;123:*bun.lockb=0;38;2;102;102;102:*configure=0;38;2;152;195;121:*.gitconfig=0;38;2;152;195;121:*.gitignore=0;38;2;152;195;121:*.localized=0;38;2;102;102;102:*.scons_opt=0;38;2;102;102;102:*.timestamp=0;38;2;102;102;102:*CODEOWNERS=0;38;2;152;195;121:*Dockerfile=0;38;2;229;192;123:*INSTALL.md=0;38;2;40;44;52;48;2;229;192;123:*README.txt=0;38;2;40;44;52;48;2;229;192;123:*SConscript=0;38;2;152;195;121:*SConstruct=0;38;2;152;195;121:*.cirrus.yml=0;38;2;152;195;121:*.gitmodules=0;38;2;152;195;121:*.synctex.gz=0;38;2;102;102;102:*.travis.yml=0;38;2;152;195;121:*INSTALL.txt=0;38;2;40;44;52;48;2;229;192;123:*LICENSE-MIT=0;38;2;153;153;153:*MANIFEST.in=0;38;2;152;195;121:*Makefile.am=0;38;2;152;195;121:*Makefile.in=0;38;2;102;102;102:*.applescript=0;38;2;152;195;121:*.fdb_latexmk=0;38;2;102;102;102:*.webmanifest=0;38;2;229;192;123:*CHANGELOG.md=0;38;2;40;44;52;48;2;229;192;123:*CONTRIBUTING=0;38;2;40;44;52;48;2;229;192;123:*CONTRIBUTORS=0;38;2;40;44;52;48;2;229;192;123:*appveyor.yml=0;38;2;152;195;121:*configure.ac=0;38;2;152;195;121:*.bash_profile=0;38;2;152;195;121:*.clang-format=0;38;2;152;195;121:*.editorconfig=0;38;2;152;195;121:*CHANGELOG.txt=0;38;2;40;44;52;48;2;229;192;123:*.gitattributes=0;38;2;152;195;121:*.gitlab-ci.yml=0;38;2;152;195;121:*CMakeCache.txt=0;38;2;102;102;102:*CMakeLists.txt=0;38;2;152;195;121:*LICENSE-APACHE=0;38;2;153;153;153:*pyproject.toml=0;38;2;152;195;121:*CODE_OF_CONDUCT=0;38;2;40;44;52;48;2;229;192;123:*CONTRIBUTING.md=0;38;2;40;44;52;48;2;229;192;123:*CONTRIBUTORS.md=0;38;2;40;44;52;48;2;229;192;123:*.sconsign.dblite=0;38;2;102;102;102:*CONTRIBUTING.txt=0;38;2;40;44;52;48;2;229;192;123:*CONTRIBUTORS.txt=0;38;2;40;44;52;48;2;229;192;123:*requirements.txt=0;38;2;152;195;121:*package-lock.json=0;38;2;102;102;102:*CODE_OF_CONDUCT.md=0;38;2;40;44;52;48;2;229;192;123:*.CFUserTextEncoding=0;38;2;102;102;102:*CODE_OF_CONDUCT.txt=0;38;2;40;44;52;48;2;229;192;123:*azure-pipelines.yml=0;38;2;152;195;121"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# shopt persisant vars
shopt -s cdable_vars
shopt -s complete_fullquote # Enable full quotes during tab-completion
shopt -s extquote           # Enables extended quote parsing for multiline commands
shopt -s dotglob            # Enables dotfiles to be included in filename expansion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Use this file for configurations shared between zsh and bash
[[ -f $HOME/.dotfiles/.env ]] && source $HOME/.dotfiles/.env || error "'~/.dotfiles/.env' not found"


