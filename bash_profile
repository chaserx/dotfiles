export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/packer:$PATH"

export EDITOR='/usr/local/bin/vim'

alias subl='sublime'
alias gst='git status'
alias o='open -a Finder ./'
alias ll='ls -lah'

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
