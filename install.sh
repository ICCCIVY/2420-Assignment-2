#!/bin/bash

# Create an indexed array named "packages"
declare -a packages=("kakoune" "tmux")

echo "Here is a list of available packages for installation:"

# Use a for loop to display available packages
for item in "${packages[@]}"; do  # using ${packages[@]} to access all elements in the array
    echo "$item"
done
echo "-----------------------------------"

# Use for loop to install each package in the list
# https://wiki.archlinux.org/title/Pacman (Reference for pacman command)
for package in "${packages[@]}"; do
    if pacman -Qq "$package" ; then # Use pacman -Qq to search for already installed packages
        echo "$package is already installed."
    else
        echo "Installing $package..."
        sudo pacman -S "$package" # Use pacman -S to install a single package or list of packages
    fi
    echo "-------------------------------"
done # Inside the for loop, use if statement to check if the packages have been installed, if the packages are not been installed, proceed to installation process
