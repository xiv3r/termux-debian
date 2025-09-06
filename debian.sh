#!/bin/sh

cd

# Neofetch
wget -O /bin/neofetch https://raw.githubusercontent.com/dylanaraps/neofetch/refs/heads/master/neofetch
chmod +x /bin/neofetch

# auto startup
sed -i '/rm -rf /tmp/.X*/d' .bashrc
sed -i '/neofetch/d' .bashrc
sed -i '/vncserver/d' .bashrc
cat >> .bashrc << EOF
rm -rf /tmp/.X*
neofetch
vncserver
EOF

# VNC startup config
mkdir -p .vnc
cat > .vnc/xstartup << EOF
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x .vnc/xstartup

# Install dependencies 
apt upgrade -y
apt install -y xfce4 xfce4-goodies tightvncserver xrdp dbus-x11
