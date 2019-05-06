#!/usr/bin/env bash

# Set locale to en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## Install HomeBrew Linux/WSL Requirements
##
## On MacOS
# ``` sh
# xcode-select --install
# brew tap caskroom/fonts
# brew cask install font-hack-nerd-font
# ```
## On Fedora, CentOS, or Red Hat
# sudo yum install -y curl file git
## On Debian or Ubuntu
# sudo apt-get install -y build-essential curl file git
## On OpenSuse
sudo zypper install git kernel-devel tree
sudo zypper install --type pattern devel_basis


sudo chown -R $(whoami): /home/
sudo chown -R $(whoami): /home/$(whoami)

# Install HomeBrew in an official way
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Install fish shell
brew install fish
brew link --overwrite fish

# Install useful tools
brew install python
PIP3_INSTALL_PATH=$(pip3 show powerline-status|grep Location|awk -F ': ' '{print $2}')

# Install git completion
## Ref link: `https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion`
brew install git bash-completion && sudo zypper remove -y git

# Install fisher, A package manager for the fish shell
## GitHub ref: `https://github.com/jorgebucaran/fisher`
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fish -c "fisher add oh-my-fish/theme-bobthefish"

## Config bashrc
cat .bashrc_for_opensuse | tee -a ~/.bashrc ~/.config/fish/config.fish
## Config fish
cat .config/fish/config.fish | tee -a ~/.config/fish/config.fish

cat .config/fish/functions/fish_right_prompt.fish | tee -a ~/.config/fish/functions/fish_right_prompt.fish
cat .config/fish/functions/fish_greeting.fish | tee -a ~/.config/fish/functions/fish_greeting.fish

## TODO: Modify bobthefish colors in solarized theme
##



# vim configurations

## Install vundle plugin manager for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Google Chrome
sudo zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
sudo zypper ref
wget https://dl.google.com/linux/linux_signing_key.pub
sudo rpm --import linux_signing_key.pub
sudo zypper install google-chrome-stable


# How to install docker
# 1. `sudo yast2  sw_single` to start yast2 software management window.
# 2. input 'docker' to search docker package.
# 3. select and install.
# 4. `sudo yast2  services-manager` open service management window.
# 5. select docker service and start and on-boot it.

# How to install ibus-googlepinyin
## reboot needed
sudo zypper in ibus ibus-qt ibus-googlepinyin
