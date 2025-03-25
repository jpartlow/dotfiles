if [ ! -f /usr/bin/ack ]; then
  alias ack=ack-grep
fi
alias gs='git status'
alias gc='git commit'
alias git-merged='git branch --merged | grep -E "( issue|ticket|fix|tmp|maint)"'

alias be='bundle exec'
#alias bi='bundle install --path=./.bundle/gems'
alias bi='bundle install'

alias sp='bundle exec rake parallel:spec[3]'

alias emacs='emacs -nw'

alias vmcheck='vboxmanage list runningvms'

# TMux completion
if [ -f /usr/share/doc/tmux/examples/bash_completion_tmux.sh ]; then
  source /usr/share/doc/tmux/examples/bash_completion_tmux.sh
fi

export EDITOR=vim

# PATH additions
if [ -d "$HOME/work/src/integration-tools/bin" ]; then
  PATH="$PATH:$HOME/work/src/integration-tools/bin"
fi

source ~/.functions
