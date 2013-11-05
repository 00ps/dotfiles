# some colors 
export TERM=xterm-color

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

export CLICOLOR=1 

alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups


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



# Misc -------------------------------------------------------------
export HISTCONTROL=ignoredups
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
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

# enable git branch in the prompt:
if [ -f ~/.git-prompt ]; then
    source ~/.git-prompt
fi

# Prompts ----------------------------------------------------------
# export PS1="\[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path
export PS1="\[${COLOR_GRAY}\]\u@\h \[${COLOR_GREEN}\]\w\$(__git_ps1) \$ \[${COLOR_NC}\]"  # Primary prompt with user, host, and path
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



# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'

# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
	touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
	command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility



# Other aliases ----------------------------------------------------
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

# Editors ----------------------------------------------------------
#export EDITOR='mate -w'  # OS-X SPECIFIC - TextMate, w is to wait for TextMate window to close
#export EDITOR='gedit'  #Linux/gnome
export EDITOR='vim'  #Command line

## setup ansible environment:
source ~/GitRepos/ansible/hacking/env-setup -q


