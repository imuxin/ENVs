#!/usr/bin/env bash

# Set locale to en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


sudo apt install -y build-essential curl file git


sudo chown -R $(whoami): /home/
sudo chown -R $(whoami): /home/$(whoami)


# Install HomeBrew in an official way
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"


# Install fish shell
brew install fish
brew link --overwrite fish


# Install fisher, A package manager for the fish shell
## GitHub ref: `https://github.com/jorgebucaran/fisher`
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c "fisher add oh-my-fish/theme-bobthefish"


# Install python
brew install python
PIP3_INSTALL_PATH=$(pip3 show powerline-status|grep Location|awk -F ': ' '{print $2}')


# Install powerline
## Ref link: `https://github.com/powerline/powerline`
pip3 install powerline-status
PIP3_INSTALL_PATH=$(pip3 show powerline-status|grep Location|awk -F ': ' '{print $2}')
sudo chmod -R 777 $PIP3_INSTALL_PATH/powerline/bindings/bash/powerline.sh


# Install git completion
## Ref link: `https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion`
brew install git bash-completion && sudo apt remove -y git


# Config fish
cat .bashrc | tee -a ~/.bashrc
cat .config/fish/config_linux.fish | tee -a ~/.config/fish/config.fish
# TODO: change color setting
# TODO: change prompt
