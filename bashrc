# some colors 
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='01;31'
export CLICOLOR=1 

# setup Vagrant
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

# Add Homebrew in my path: 
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

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # Lists all the colors, uses vars in .bashrc_non-interactive



# Misc 
export HISTCONTROL=ignoredups
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# a few bash autocompletion add ons
# for homebrew bash-completion (1)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi
# for homebrew bash-completion2
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi

# enable shims and autocompletion 
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# enable git bash completion:
if [ -f ~/.git-completion ]; then
    source ~/.git-completion
fi


# export PS1="\[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path
##export PS1="\[${COLOR_CYAN}\]\u@\h \[${COLOR_GREEN}\]\w\[${COLOR_RED}\]\$(__git_ps1)\[${COLOR_NC}\] \$ "  
#export PS1="\[\e[0;1m\]\[${COLOR_NC}\]┌─\[${COLOR_CYAN}\]\u@\h \[${COLOR_GREEN}\]\w\[${COLOR_RED}\]\$(__git_ps1)\[${COLOR_NC}\] \n└──┤|▶ \[\e[0m\]"
#export PS1="\h:\W \u\$" # base mac OSX PS1

# This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
# weird wrapping errors occur on some systems, so this method is superior
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'  # user@host path

export PS2='> '    # Secondary prompt
export PS3='#? '   # Prompt 3
export PS4='+'     # Prompt 4

function xtitle {  # change the title of your xterm* window
  unset PROMPT_COMMAND
  echo -ne "\033]0;$1\007" 
}

# source CDPATH if exists
if [ -f ~/.bash/cdpath ]; then
    source ~/.bash/cdpath
fi

# source dvm env if exists
if [ -f ~/.bash/dvm ]; then
    source ~/.bash/dvm
fi

# some useful aliases:

alias ..='cd ..'
alias ...='cd .. ; cd ..'

# ls 
alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'

# Misc
alias g='grep -i'  # Case insensitive grep
alias f='find . -iname'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias m='more'
alias df='df -h'

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias veewee="bundle exec veewee"

# Editor ----------------------------------------------------------
export EDITOR='vim'  #Command line

## setup ansible environment:
source ~/GitRepos/ansible/hacking/env-setup -q

#ec2-api-tools
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.7.1.0/libexec"
source ~/.ec2/.initrc

# awscli
complete -C aws_completer aws

# if bash-git-prompt is installed use it
if [ -f $(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh ]; then
    source $(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh
    export GIT_PROMPT_START="\[\e[0;1m\]\[${COLOR_NC}\]┌─\[${COLOR_CYAN}\]\u@\h \[${COLOR_GREEN}\]\w"
    export GIT_PROMPT_END="\[${COLOR_NC}\] \n└──┤|▶ \[\e[0m\]"
elif [ -f ~/.git-prompt ]; then
    source ~/.git-prompt
    export PS1="\[\e[0;1m\]\[${COLOR_NC}\]┌─\[${COLOR_CYAN}\]\u@\h \[${COLOR_GREEN}\]\w\[${COLOR_RED}\]\$(__git_ps1)\[${COLOR_NC}\] \n└──┤|▶ \[\e[0m\]"
else
    export PS1="\h:\W \u\$"
fi

