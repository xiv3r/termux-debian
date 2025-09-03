<img align="center" src="https://github.com/xiv3r/termux-debian/blob/main/deabian.jpg">

# Requirements 
- [Termux](https://github.com/termux/termux-app/releases)
- [VNC](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)

# Auto Install
- Step 1
```
apt update && pkg install -y wget && wget https://raw.githubusercontent.com/xiv3r/termux-debian/refs/heads/main/install.sh -O install.sh && chmod +x install.sh && ./install.sh
```
- Step 2
```
apt update && apt install -y wget && wget -qO- https://raw.githubusercontent.com/xiv3r/termux-debian/refs/heads/main/debian.sh | sh
```

# Configure VNC
```
vncpasswd
```

# Run VNC Server
```
vncserver
```
- Open the Real VNC and put the address `localhost:1` and your vnc password and connect.

### Login
```
debian 
```
### Logout 
```
exit
```
### Uninstall 
```
uninstall-debian
```
