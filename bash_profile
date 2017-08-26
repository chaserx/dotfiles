export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/packer:$PATH"

export EDITOR='/usr/local/bin/vim'

alias subl='sublime'
alias gst='git status'
alias o='open -a Finder ./'
alias ll='ls -lah'

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# added by Anaconda2 4.1.1 installer
export PATH="/Users/chase/anaconda/bin:$PATH"

# added by Anaconda2 4.2.0 installer
export PATH="/Users/chase/anaconda/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
