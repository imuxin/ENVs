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
sudo yum install -y curl file git
## On Debian or Ubuntu
# sudo apt-get install -y build-essential curl file git

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
brew install git bash-completion && sudo yum remove -y git

# Install fisher, A package manager for the fish shell
## GitHub ref: `https://github.com/jorgebucaran/fisher`
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fish -c "fisher add oh-my-fish/theme-bobthefish"

# Install powerline
## Ref link: `https://github.com/powerline/powerline`
pip3 install powerline-status
sudo chmod -R 777 $PIP3_INSTALL_PATH/powerline/bindings/bash/powerline.sh

## Config bashrc
cat .bashrc | tee -a ~/.bashrc ~/.config/fish/config.fish
## Config fish
cat .config/fish/config.fish | tee -a ~/.config/fish/config.fish

cat .config/fish/functions/fish_right_prompt.fish | tee -a ~/.config/fish/functions/fish_right_prompt.fish
cat .config/fish/functions/fish_greeting.fish | tee -a ~/.config/fish/functions/fish_greeting.fish

## TODO: Modify bobthefish colors in solarized theme
##

