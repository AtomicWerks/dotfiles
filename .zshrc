# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nyan sprunge systemd)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch HIST_IGNORE_DUPS completealiases nohashdirs
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/stephen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#history search
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# map carriage return in stty
stty icrnl

#zmv PATTERM REPLACEMENT
autoload zmv

# Copied from .bashrc 12/30/14

zstyle ':completion:*' menu select
# Lines configured by zsh-newuser-install
#virtualbox
VBOX_USB=usbfs
#android jdk6
#export JAVA_HOME=/opt/java6/
#export PATH=$PATH:$JAVA_HOME/bin

#scripts
export PATH=$PATH:/home/stephen/scripts

#local bin
export PATH=$PATH:/home/stephen/.local/bin
#bspwm panel
export PATH=$PATH:/home/stephen/.config/bspwm
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
# dmenu
#export PANEL_HEIGHT=20
#export PANEL_FOREGROUND="#000000"
#export PANEL_BACKGROUND="#ffffff"
#export DMENU_OPTIONS="-i -t -o 0.8 -dim 0.2 -h $PANEL_HEIGHT -w 400 -l 20 -fn Sans-10:normal -nb $PANEL_BACKGROUND -nf $PANEL_FOREGROUND -sb #073642 -sf $PANEL_BACKGROUND"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#exports
export BROWSER=chromium
export GREP_COLORS="1;33"
export EDITOR="vim"
export R600_ENABLE_ST3C=1
export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=r600
export R600_GLSL130=1
export R600_STREAMOUT=1
export R600_TILING=1
export R600_SURF=1
export RADEON_HYPERZ=1
export R600_DEBUG=hyperz

#Qt5 gtk look
export QT_STYLE_OVERRIDE=gtk

#aliases
# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
#general
alias smount='sudo mount'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias ..='cd ..'
alias scat='sudo pygmentize -g'
alias cat='pygmentize -g'
alias reboot='sudo reboot'
alias svim='sudo vim'
alias grep='grep --color=auto'
alias yao='yaourt'
alias pac='sudo pacman'
alias pacs='sudo pacman -Sy'
alias pacsearch='pacman -Sl | cut -d' ' -f2 | grep'
alias pacup="sudo pacman -Syu"
alias ":q"="exit"
alias ls='ls --color=auto'
alias rc.d='sudo rc.d'
alias c='clear'

#screenfetch
alias rice='alsi -f ~/scripts/info-at -l'

#go-mtpfs for nexus
alias nexus='go-mtpfs /media/nexus'
alias nonexus='fusermount -u /media/nexus'
#rsync nexus
#alias rsyncnexus='rsync -avz --exclude '*.mp3' /media/nexus/Internal\ storage/ /media/sarai/android/nexus_backup/'


#dir_colors
eval $(dircolors -b ~/.dircolors)


# usage: ternary <evaluate> <true return> <false return>
ternary () {
        [[ $1 -eq 0 ]] && printf $2 || printf $3
}
PROMPT="%{$fg[0]%(! $fg[red] )─$fg[0]%(1j $fg[green] )─$fg[0]%(?  $fg[red])─$reset_color%} "


w3mimg () { w3m -o imgdisplay=/usr/lib/w3m/w3mimgdisplay $1 }


#retain tty control for misbehavinf function keys
ttyctl -f
