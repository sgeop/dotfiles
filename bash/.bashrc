export EDITOR=vim

export TERM="xterm-256color"

# GIT_PROMPT_ONLY_IN_REPO=1
# source ~/.bash-git-prompt/gitprompt.sh

export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTTIMEFORMAT="[%F %T] "

# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_history_large

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export CDPATH=$HOME/handydev/repos:$HOME/handydev/repos/datapipeline-infrastructure

# aliases
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias emacs='emacs -nw'
