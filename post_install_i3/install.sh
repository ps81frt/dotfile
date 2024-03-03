#!/bin/sh

sudo apt update
sudo apt upgrade -y

# https://wiki.debian.org/Xorg
sudo apt install -y xorg i3 picom
mkdir -p ~/.config/i3
cp config/i3/* ~/.config/i3
sudo dpkg-reconfigure keyboard-configuration

cp config/user-dirs.dirs ~/.config/user-dirs.dirs
mkdir ~/data
mkdir ~/data/Documents
mkdir ~/data/Downloads
mkdir ~/data/Pictures
mkdir ~/data/Music
mkdir ~/data/Videos
mkdir ~/Desktop
mkdir ~/Templates
mkdir ~/Public

# TODO: configure git
# TODO: show volume indicator with keyboard
# TODO: font
# TODO: laptop power management
# TODO: printer
# TODO: copy file type associations

## Network
sudo apt install -y network-manager-gnome

# Sound
sudo apt install -y pavucontrol pulseaudio pulseaudio-utils pasystray paprefs pavumeter pulseaudio-module-zeroconf

# Bluetooth 
sudo apt install -y blueman pulseaudio-module-bluetooth

# Hack nerd fonts
sudo apt install -y curl unzip zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
mkdir -p ~/.local/share/fonts
unzip Hack.zip -d ~/.local/share/fonts/
fc-cache
sudo apt install fonts-noto


# st terminal
sudo apt install -y xorg-dev build-essential git
git clone https://github.com/dimitrimarion/st-flexipatch.git
cd st-flexipatch
sudo make clean install
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/st 40
sudo update-alternatives --set x-terminal-emulator /usr/local/bin/st
cd -

# vim
sudo apt install -y vim
cp config/vimrc ~/.vimrc
sudo update-alternatives --set editor /usr/bin/vim.basic

# file manager
sudo apt install -y pcmanfm

# image viewer
sudo apt install -y nsxiv
sudo cp bin/cnsxiv /usr/local/bin
sudo chmod +x /usr/local/bin
mkdir -p ~/.local/share/applications
cp applications/* ~/.local/share/applications
cp config/mimeapps.list ~/.config

# mail
# gmail sign in with app passwords: https://support.google.com/mail/answer/185833?hl=en
sudo apt install -y sylpheed sylpheed-plugins

# pdf
sudo apt install -y zathura
mkdir ~/.config/zathura
cp config/zathurarc ~/.config/zathura/zathurarc

# video player
sudo apt install -y mpv

# screenshot
sudo apt install -y flameshot

# pager
sudo apt install -y most
sudo update-alternatives --set pager /usr/bin/most

# password manager
sudo apt install -y keepassxc

# docker
sudo apt install -y docker-compose
sudo usermod -aG docker $USER


# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# vscode
sudo apt-get install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code


# gtk2 theme for pcmanfm and sylpheed
sudo apt install -y lxappearance greybird-gtk-theme
cp config/.gtkrc-2.0 ~/.gtkrc-2.0

# autostart X at login
cp config/.profile ~/.profile

# Deactivate laptop monitor if external connected 
# https://wiki.archlinux.org/title/xrandr #Toggle_external_monitor
#sudo vim /usr/share/sddm/scripts/Xsetup # deactivate laptop monitor

###
sudo apt install -y tldr xsel htop firefox-esr feh arandr

# wallpapers
mkdir ~/data/Pictures/wallpapers
git clone https://gitlab.com/dwt1/wallpapers.git ~/data/Pictures/wallpapers
rm ~/data/Pictures/wallpapers/README.md

# starship
curl -sS https://starship.rs/install.sh | sh
echo "eval "'"$(starship init bash)"'"" >> ~/.bashrc

# update locale
# might be not necessary if you want to use the same locale for everything
sudo update-locale LC_TIME=fr_FR.utf8 LC_PAPER=fr_FR.utf8 LC_NAME=fr_FR.utf8 LC_ADDRESS=fr_FR.utf8 LC_TELEPHONE=fr_FR.utf8 LC_MEASUREMENT=fr_FR.utf8
setxkbmap fr
echo "disable power management on lid switch"
echo " uncomment #HandleLidSwitch=ignore in /etc/systemd/logind.conf"
