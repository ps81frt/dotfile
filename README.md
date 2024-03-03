# My personnal dotfiles

## Get list installed package and export .txt file

        dpkg -l | awk '/^ii/ { print $2 ;}' >  list_installed_packages.txt

## install package from .txt file

        xarg -a list_installed_packages.txt sudo apt install -y
