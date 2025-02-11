#!/usr/bin/env bash

# Function to check and install packages on pacman systems
install_pacman() {
  if command -v pacman &> /dev/null; then
    local packages=("$@")
    for pkg in "${packages[@]}"; do
      if ! command -v "$pkg" &> /dev/null; then
        echo "Installing $pkg with pacman..."
        sudo pacman -S --noconfirm "$pkg" || return 1  # Exit with error if installation fails
      fi
    done
  fi
}

# Function to check and install packages on apt systems
install_apt() {
  if command -v apt &> /dev/null; then
    local packages=("$@")
    for pkg in "${packages[@]}"; do
      if ! command -v "$pkg" &> /dev/null; then
        echo "Installing $pkg with apt..."
        sudo apt-get update && sudo apt-get install -y "$pkg" || return 1 # Exit with error
      fi
    done
  fi
}


