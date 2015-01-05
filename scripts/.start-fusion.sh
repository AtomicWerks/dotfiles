start-fusion.sh
#!/bin/sh
# add more apps here if necessary or start another panel, tray like pypanel, bmpanel, stalonetray
tint2 &
xterm &
urxvt &
emerald &
cairo-dock &
nitrogen --restore &
LIBGL_ALWAYS_INDIRECT=1 compiz --sm-disable --ignore-desktop-hints ccp --indirect-rendering
#fusion-icon
