#!/bin/bash

# Tarball
DISTRO=debian

# Shortcut login - fixed variable usage
sed -i '/termux-wake-lock/d' $PREFIX/etc/bash.bashrc
sed -i '/clear/d' $PREFIX/etc/bash.bashrc
sed -i '/proot-distro login $DISTRO/d' $PREFIX/etc/bash.bashrc
cat >> $PREFIX/etc/bash.bashrc << EOF
termux-wake-lock
clear
proot-distro login $DISTRO
EOF

# Create proper login script - fixed variable usage
cat > $PREFIX/bin/$DISTRO << EOF
#!/bin/bash
proot-distro login $DISTRO
EOF
chmod +x $PREFIX/bin/$DISTRO

# Manual Login - fixed to use correct DISTRO variable
cat > $PREFIX/bin/ubuntu << EOF
#!/bin/bash
proot-distro login $DISTRO
EOF
chmod +x $PREFIX/bin/ubuntu

# Uninstaller - fixed variable usage and consistency
cat > $PREFIX/bin/uninstall-$DISTRO << EOF
#!/bin/bash
proot-distro remove $DISTRO
sed -i '/termux-wake-lock/d' $PREFIX/etc/bash.bashrc
sed -i '/clear/d' $PREFIX/etc/bash.bashrc
sed -i '/proot-distro login $DISTRO/d' $PREFIX/etc/bash.bashrc
rm -f $PREFIX/bin/$DISTRO
rm -f $PREFIX/bin/uninstall-$DISTRO
EOF
chmod +x $PREFIX/bin/uninstall-$DISTRO

# Upgrade packages
pkg upgrade -y

# Install proot-distro first
pkg install -y proot-distro

# Install the distribution
proot-distro install $DISTRO
sleep 5
proot-distro login $DISTRO
