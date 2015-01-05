#
# ~/.bashrc
#
#virtualbox
VBOX_USB=usbfs
#android jdk6
#export JAVA_HOME=/opt/java6/
#export PATH=$PATH:$JAVA_HOME/bin

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
alias scat='sudo cat'
alias reboot='sudo reboot'
alias svim='sudo vim'
alias grep='grep --color=auto'
alias yao='yaourt'
alias pac='sudo pacman'
alias pacs='sudo pacman -Sy'
alias pacsearch="pacman -Sl | cut -d' ' -f2 | grep "
alias pacup="sudo pacman -Syu"
alias ":q"="exit"
alias ls='ls --color=auto'
alias rc.d='sudo rc.d'
alias c='clear'

#go-mtpfs for nexus
alias nexus='go-mtpfs /media/nexus'
alias nonexus='fusermount -u /media/nexus'
#rsync nexus
alias rsyncnexus='rsync -avz --exclude '*.mp3' /media/nexus/Internal\ storage/ /media/sarai/android/nexus_backup/'

#alias big-files='find . -type f -printf '%s %p \n' | sort -rn | less | more'
#auto-completion


eval $(dircolors -b /etc/dir_colors)
#PS1
#PS1='[\u@\h \W]\$ '
#PS1='[\u@\h \W]\$ '
# Color Console
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[m\] 
#\[\e[1;32m\]\$ \[\e[m\]\[\e[1;37m\] '

bash_prompt_cmd() {
        local CY="\[\e[1;36m\]" # Each is 12 chars long
        local BL="\[\e[1;34m\]"
        local WH="\[\e[1;37m\]"
        local BR="\[\e[1;33m\]"
        local RE="\[\e[0;31m\]"
        local PROMPT="${RE}$"
        [ $UID -eq "0" ] && PROMPT="${RE}#"

        # Add the first part of the prompt: username,host, and time
        local PROMPT_PWD=""
        local PS1_T1="$BL.:[ $RE`whoami`@`hostname` $BL: $RE\t $BL:$RE "
        local ps_len=$(( ${#PS1_T1} - 12 * 6 + 6 + 4 )) #Len adjust for colors, time and var
        local PS1_T2=" $BL]:.\n${PROMPT} \[\e[0m\]"
        local startpos=""

        PROMPT_PWD="${PWD/#$HOME/~}"
        local overflow_prefix="..."
        local pwdlen=${#PROMPT_PWD}
        local maxpwdlen=$(( COLUMNS - ps_len ))
        # Sometimes COLUMNS isn't initiliased, if it isn't, fall back on 80
        [ $maxpwdlen -lt 0 ] && maxpwdlen=$(( 80 - ps_len )) 

        if [ $pwdlen -gt $maxpwdlen ] ; then
                startpos=$(( $pwdlen - maxpwdlen + ${#overflow_prefix} ))
                PROMPT_PWD="${overflow_prefix}${PROMPT_PWD:$startpos:$maxpwdlen}"
        fi      
        export PS1="${PS1_T1}${PROMPT_PWD}${PS1_T2}"
}
#PROMPT_COMMAND=bash_prompt_cmd

#dcat type ps1

prompt () {
	_ERR=$?
	_UID=$(id -u)
	_JOB=$(jobs | wc -l)

	[ $_UID -eq 0 ] && echo -n '[31m━' || echo -n '[30m─'
	[ $_JOB -ne 0 ] && echo -n '[32m─' || echo -n '[30m─'
	[ $_ERR -ne 0 ] && echo -n '[33m─' || echo -n '[30m─'
	
	echo -n '[0m'
}

PS1='$(prompt) '


#shell completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


