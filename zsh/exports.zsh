
# ----------------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------------
# since homebrew complains about path...
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Ruby
if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
fi
if [ -e /usr/local/opt/chruby/share/chruby/auto.sh ]; then
    source /usr/local/opt/chruby/share/chruby/auto.sh
fi
# added by Anaconda 1.9.2 installer
export PATH=$HOME/anaconda/bin:$PATH

typeset -U path
path=($path)

# ----------------------------------------------------------------------------
# misc
# ----------------------------------------------------------------------------
export LANG=en_US.UTF-8
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR=/usr/bin/local/vim
export VISUAL=/usr/bin/local/vim

export ARCHFLAGS='-arch x86_64'

# for TMUX
if [[ $IS_LINUX -eq 1 ]]; then
    ZSH=/usr/bin/zsh
fi
if [[ $IS_MAC -eq 1 ]]; then
    ZSH=/usr/local/bin/zsh
fi
