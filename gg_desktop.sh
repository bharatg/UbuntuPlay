#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install gnome-shell
sudo apt-get -y install ubuntu-gnome-desktop
sudo apt-get -y install autocutsel
sudo apt-get -y install tightvncserver
sudo apt-get -y install gnome-core
sudo apt-get -y install gnome-panel
sudo apt-get -y install gnome-themes-standard
sudo apt-get -y install adwaita-icon-theme-full adwaita-icon-theme



cat << EOF >> ~/.vnc/xstartup﻿ 
#!/bin/sh
autocutsel -fork
xrdb $HOME/.Xresources
xsetroot -solid grey
export XKL_XMODMAP_DISABLE=1
export XDG_CURRENT_DESKTOP="GNOME-Flashback:Unity"
export XDG_MENU_PREFIX="gnome-flashback-"
unset DBUS_SESSION_BUS_ADDRESS
gnome-session --session=gnome-flashback-metacity --disable-acceleration-check --debug &
EOF

vncserver -geometry 1024x640
#vncserver -kill :1

######vncserver host:590(1)  1 is display number
