## a little bit verbose ... commented out
# /usr/local/bin/fortune | /usr/local/bin/cowsay

# Load in .bashrc: 
source ~/.bashrc


# Notes: 
# When you start an interactive shell (log in, open terminal or iTerm in OS X, 
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile
#     .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started 
# (when you run "bash" from inside a shell, or when you start a shell in 
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed, 
# in this order:
#     bashrc
#     .bashrc
#
# Therefor, let us keep .bash_profile as clean as possible, and let is source 
# .bashrc.
