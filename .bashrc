# muxin's bashrc
# the following configuration is appended from muxin's fish config
# Ref link: `https://github.com/imuxin/ENVs`

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# enable powerline in bash.
PIP3_INSTALL_PATH=$(pip3 show powerline-status|grep Location|awk -F ': ' '{print $2}')
bash -c "$PIP3_INSTALL_PATH/powerline/bindings/bash/powerline.sh"

