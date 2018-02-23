# If you come from bash you might have to change your $PATH.
export MAVEN_HOME=/opt/maven
export IDEA_HOME=/opt/idea
export GOROOT=/usr/local/go
export GOPATH=/home/soro/go
export PATH=$HOME/bin:/usr/local/bin:$MAVEN_HOME/bin:$IDEA_HOME/bin:$GOROOT/bin:$GOPATH/bin:$PATH

export GITHUB_USER=danielsoro
export GITHUB_PASSWORD=<PASSWORD>

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Path to your oh-my-zsh installation.
export ZSH=/home/soro/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wezm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# User configuration
export nofail="-DfailIfNoTests=false"
export tomee_debug="-Dopenejb.server.debug=true"
export surfire_debug="-Dmaven.surefire.debug=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Utils
alias disable-touchpad="synclient TouchpadOff=1"

# GIT alias
alias git-config-enable-gpgsign="git config commit.gpgsign true"

alias git-config-tt-email="git config user.email dcunha@tomitribe.com"
alias git-config-tt-signingkey="git config user.signingkey 3341BA376EE3C06C"

alias git-config-apache-email="git config user.email danielsoro@apache.org"
alias git-config-apache-signingkey="git config user.signingkey 8B9CC2B9193683E4"

alias git-config-gmail-email="git config --global user.email danielsoro@gmail.com"
alias git-config-gmail-sigingkey="git config user.signingkey 31C0CC9EF41DFDA3"

# Maven alias
alias mvnarqtest="mvn clean process-test-classes surefire:test@arquillian -Darquillian.asciidoctor.skip=true"
alias mvninstall="mvn clean install"
alias mvnskip="mvninstall -DskipTests -Dsettings.offline=true"
