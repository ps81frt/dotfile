#!/bin/sh

# custom st changing font size if hidpi laptop monitor
sudo cp bin/st-custom
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/st-custom 50

# handle monitor and dpi
cp config/.xsessionrc ~/.xsessionrc
cp config/.Xresources-hidpi ~/.Xresources-hidpi
