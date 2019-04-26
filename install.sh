#!/usr/bin/env bash

## Install HomeBrew Linux/WSL Requirements
##
## On MacOS
# ``` sh
# xcode-select --install
# brew tap caskroom/fonts
# brew cask install font-hack-nerd-font
# ```
## On Fedora, CentOS, or Red Hat
# sudo yum groupinstall -y 'Development Tools' && sudo yum install -y curl file git
## On Debian or Ubuntu
# sudo apt-get install -y build-essential curl file git

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

## Config bashrc
cat .bashrc | tee -a ~/.bashrc
## Config fish
cat .config/fish/config.fish | tee -a ~/.config/fish/config.fish

