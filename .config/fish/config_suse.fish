# muxin's fish config
# Ref link: `https://github.com/imuxin/ENVs`
# Persornal aliases

# Set locale to en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
# export http_proxy=http://localhost:8123
# export https_proxy=http://localhost:8123

alias zypper="sudo zypper"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias tree="tree -N"

## disable virtual env prompt
set -g VIRTUAL_ENV_DISABLE_PROMPT 1

# ping 8.8.8.8
function up
  ping 8.8.8.8
end

# clear fish history cache
function bye
  builtin history clear
end

# Create empty folder git can add
function mk_git_dir
  for dir_name in $argv
    mkdir -p $dir_name
    echo -e "# Ignore everything in this directory\n*\n# Except this file\n!.gitignore\n" > $dir_name/.gitignore
  end
end

# docker images --tree
function dockviz
  docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz images -t
end

# enable polipo http&https proxy
function plp
  export http_proxy=http://localhost:8123
  export https_proxy=http://localhost:8123
end

## fish system's colors setting

set fish_color_autosuggestion fdf6e3
set fish_pager_color_completion red --bold

# bobthefish theme settings
# set -g theme_color_scheme light
# set -g theme_color_scheme dark
set -g theme_color_scheme solarized
# set -g theme_color_scheme solarized-light
# set -g theme_color_scheme dracula
# set -g theme_color_scheme gruvbox
# set -g theme_color_scheme zenburn
# set -g theme_color_scheme base16
# set -g theme_color_scheme base16-light

set -g theme_nerd_fonts yes
set -g theme_powerline_fonts noexport PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
set -g theme_show_exit_status yes
set -g theme_display_git_untracked no
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes
# set -g theme_git_worktree_support yes
