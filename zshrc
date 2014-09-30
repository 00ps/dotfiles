# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GITREPOS=$HOME/GitRepos
# Set name of the theme to load.
ZSH_THEME="00ps"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
ZSH_CUSTOM=~/GitRepos/dotfiles/custom #/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew battery jsontools pass sudo git-extras osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# using zsh-git-prompt upstream project instead
# of omz plugin:
source $GITREPOS/zsh-git-prompt/zshrc.sh

# git-prompt theming
# ... this does not work when called from the template
ZSH_THEME_GIT_PROMPT_PREFIX="[ "
ZSH_THEME_GIT_PROMPT_SUFFIX=" ]"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" |"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{✔%G%}"

#export PATH="/Users/fred/GitRepos/ansible/bin:/usr/local/var/rbenv/shims:/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

######
# configuring the PATH

# adding /usr/local to the path
homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

# add ~/bin foler in my path if present
# this is a convenient place to store scripts etc ...
if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH  
fi

# rbenv uses Homebrew's directories rather than ~/.rbenv 
export RBENV_ROOT=/usr/local/var/rbenv

# adding path to gem
export PATH=$(brew --prefix ruby)/bin:$PATH

# set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)

####
# setting up colored environment
# although i am not sure that everything is really relevant
# with zsh
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 

#####
# setup Vagrant
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

#####
# I want these directory in my cdpath
export CDPATH='.:~:~/GitRepos:~/Documents'

####
# zsh syntax highlighter
# see: git://github.com/zsh-users/zsh-syntax-highlighting.git
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# You may need to manually set your language environment
# export LC_ALL=en_US.UTF-8

###
# vim is the default editor
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# rbenv environment setup
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# dvm environment setup
if which dvm > /dev/null; then eval "$(dvm env)"; fi

## setup ansible environment:
source ~/GitRepos/ansible/hacking/env-setup -q

#ec2-api-tools
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.7.1.0/libexec"
source ~/.ec2/.initrc

# awscli completion
source /usr/local/share/zsh/site-functions/_aws

# let's define some aliases:
alias g='grep -i' # case insensitive grep
alias f='find . -iname'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias m='more'
alias df='df -h'
alias gi='git'
