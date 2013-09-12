export PATH="/usr/local/bin:$PATH"

# Path to the bash it configuration
export BASH_IT="/Users/chase/.bash_it"

# Lock and Load a custom theme file
export BASH_IT_THEME="chase"

alias subl='sublime'
alias gst='git status'
alias o='open -a Finder ./'

export EDITOR='/usr/bin/vim'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Load Bash It
source $BASH_IT/bash_it.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
