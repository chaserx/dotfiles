#personal Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="my_muse"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf github bundler shrink-path zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
path=/Users/chase/.asdf/shims
path+=/opt/homebrew/bin
path+=/opt/homebrew/sbin
path+=/usr/local/bin
path+=/Users/chase/.local/bin
path+=/usr/bin
path+=/bin
path+=/usr/sbin
path+=/sbin
path+=/opt/X11/bin
path+=/usr/X11/bin
path+=/usr/local/etc/personal_ctags
path+=/usr/local/opt/go/libexec/bin
path+=/usr/local/opt/python/libexec/bin
path+=/usr/local/sbin
path+=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
path+=/opt/homebrew/opt/libpq/bin
path+="$HOME/.cargo/bin:$PATH"
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
path+="$HOME/helpers/git-fuzzy/bin"
# go
export GOPATH=$(asdf where golang)/packages
export GOROOT=$(asdf where golang)/go
export PATH="${PATH}:$(go env GOPATH)/bin"

# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# export RUBY_CONFIGURE_OPTS="--with-zlib-dir=$(brew --prefix zlib) --with-libyaml-dir=$(brew --prefix libyaml) --with-openssl-dir=$(brew --prefix openssl@3)"

export ENABLE_LIVERELOAD=1

# GitLab in Docker Specific
# this is useful for running gitlab self-managed locally via docker
export GITLAB_HOME=$HOME/gitlab

## DOCKER
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.100:2376"
# export DOCKER_CERT_PATH="/Users/chase/.docker/machine/machines/default"
# export DOCKER_MACHINE_NAME="default"

# these need to be unset to use Docker for Mac
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH
unset DOCKER_MACHINE_NAME
unset DOCKER_HOST

# for Rust/Cargo SSL build error http://stackoverflow.com/a/34615626/281699
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export DEP_OPENSSL_INCLUDE=${OPENSSL_INCLUDE_DIR}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export TERM=xterm-256color
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias rezsh="source ~/.zshrc"
alias ll="ls -lah"
alias ltr="ls -ltr"
alias pyss="python -m SimpleHTTPServer"
alias beru="bundle exec rubocop"
alias fs='foreman start'
alias gcm='git checkout master'
alias meh="echo '¯\_(ツ)_/¯' | tee >(pbcopy)"
alias weather="curl -s wttr.in/lex | sed -n 3,7p"
alias dcra="docker-compose run app"
alias kuse="kubectl config set current-context"
alias dad="curl -s -H 'Accept: text/plain' https://icanhazdadjoke.com/; echo"
alias rake='noglob rake'
alias pyss3="python3 -m http.server"
alias k="kubectl"
alias goop="cd ~/outside_projects"
alias gtw="cd ~/work"
alias gsw="git switch"
alias restartAlfred="osascript -e 'tell application \"Alfred 4\" to quit';open -a \"Alfred 4\""
alias tf="terraform"
alias tn="date -u \"+%H:%M:%S\" | pbcopy"
alias dtn="date -u \"+%Y-%m-%d @ %H:%M\" | pbcopy; echo 'UTC timestamp copied to clipboard'"
alias audio-fix="sudo killall coreaudiod"
alias work="timer 30m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '/Users/chase/Pictures/gitlab-logo-500.png'\
        -sound Crystal"

export OPENAI_API_KEY=""
function hey_gpt() {
    # local prompt="What was the number one album of 1996"
    local gpt_req=$(curl https://api.openai.com/v1/chat/completions -s -H "Content-Type: application/json" -H "Authorization: Bearer $OPENAI_API_KEY" -d '{ "model": "gpt-3.5-turbo", "messages": [{"role": "user", "content": "'$1'"}], "temperature": 0.7 }')
    echo -E $gpt_req | sed 's/\\[tn]//g' | jq -r '.choices[0].message.content'
}


eval "$(thefuck --alias)"

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
# if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
#  . $LUNCHY_DIR/lunchy-completion.zsh
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source <(fzf --zsh)

#into_fuzzy_vim () { vim $(fzf); }
#zle -N into_fuzzy_vim
#bindkey -s '^p' into_fuzzy_vim
path+=/usr/local/opt/icu4c/bin
path+=/usr/local/opt/icu4c/sbin

# zsh autocomplete https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

gfs() {
  # git switch  "$(git branch | fzf| tr -d '[:space:]')"
  git switch  $(git branch --format '%(refname:short)' | sed 's~origin/~~' | sort | uniq | fzf)
}

### GDK shell completion
autoload bashcompinit
bashcompinit

source ~/work/gitlab-development-kit/support/completions/gdk.bash
### END GDK config


eval "$(starship init zsh)"

#  fortune | cowsay | lolcat
source ~/.iterm2_shell_integration.zsh

. ~/.asdf/plugins/golang/set-env.zsh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/chase/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH
eval "$(direnv hook zsh)"
