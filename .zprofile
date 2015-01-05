#
# ~/.zprofile
#
export PATH="usr/lib/colorgcc/bin:$PATH"

[[ -f ~/.zshrc ]] && . ~/.zshrc


#if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
# exec startx
#  # Could use xinit instead of startx
#  #exec xinit -- /usr/bin/X -nolisten tcp vt7
#fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- -keeptty -nolisten tcp > /media/sarai/.xorg.log 2>&1
