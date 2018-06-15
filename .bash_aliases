if [ ! -f /usr/bin/ack ]; then
  alias ack=ack-grep
fi
alias gs='git status'
alias gc='git commit'
alias git-merged='git branch --merged | grep -E "( issue|ticket|fix|tmp|maint)"'

alias be='bundle exec'
alias bi='bundle install --path=./.bundle/gems'

alias sp='bundle exec rake parallel:spec[3]'

alias emacs='emacs -nw'

alias vmcheck='vboxmanage list runningvms'

# TMux completion
source /usr/share/doc/tmux/examples/bash_completion_tmux.sh

export EDITOR=vim

# Puppet internal gem source
export GEM_SOURCE='https://artifactory.delivery.puppetlabs.net/artifactory/api/gems/rubygems/'

# PATH additions
if [ -d "$HOME/work/src/integration-tools/bin" ]; then
  PATH="$PATH:$HOME/work/src/integration-tools/bin"
fi

source ~/.functions
