# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

function rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'ruby-' '{print $2}')
  [ "$gemset" != "" ] && echo "$gemset"
}

export PS1='\[\033[1;34m\]$(rvm_version)\[\033[0m\] \W$(__git_ps1 "\[\033[1;32m\](%s)\[\033[0m\]") \$ '
