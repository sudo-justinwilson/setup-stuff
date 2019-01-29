# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source global definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

## added by Anaconda2 4.3.1 installer
#export PATH="/home/justin/anaconda2/bin:$PATH"
#
## added by Anaconda3 4.3.1 installer
#export PATH="/home/justin/anaconda3/bin:$PATH"

# set prompt to show git branch and status:
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (*\([^)]*\))*/\1/'
}

markup_git_branch() {
  if [[ -n $@ ]]; then
    if [[ -z $(git status --porcelain 2> /dev/null) ]]; then
      echo -e " \001\033[32m\002($@)\001\033[0m\002"
    else
      echo -e " \001\033[31m\002($@)\001\033[0m\002"
    fi
  fi
}

export PS1="\h:\W\$(markup_git_branch \$(parse_git_branch)) \u$ "
