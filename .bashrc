# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# Avoid duplicates
export HISTCONTROL=ignoreboth:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# override PS1
# export PS1="\e[34m\W \e[39m\$ "
export PS1="\e[34m\W \e[90m \n\$\e[39m "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=${HOME}/.npm-global/bin:$PATH

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/deon/golang
export PATH=$PATH:/home/deon/golang/bin
export PATH=$PATH:$HOME/.opam/4.05.0/bin
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.daml/bin
export PATH=$PATH:$HOME/.mvn/bin
export PATH=$PATH:$HOME/.mix/escripts
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.java/bin
export PATH=$PATH:/opt/gradle/gradle-6.0.1/bin
#export PATH=$HOME/bin:$PATH

#toggle=$((pactl list sinks | grep -q Mute:.no && echo 1) || echo 0)
#pactl set-sink-mute 0 $toggle
alias python=python3
alias chrome=google-chrome-stable
alias wiki="vim ~/vimwiki/index.wiki"
eval "$(direnv hook bash)"

#disable caps lock
setxkbmap -option caps:none

# added by travis gem
[ -f /home/deon/.travis/travis.sh ] && source /home/deon/.travis/travis.sh


cd() {
  if builtin cd "$@" 3>&2 2>/dev/null; then
    :
  else
    if builtin cd "$HOME/$1" 3>&2 2>/dev/null
    then
      echo -e "\e[92m$1 exists in home directory going there\e[39m"
    elif 
      builtin cd "$HOME/dev/$1" 3>&2 2>/dev/null
    then
      echo -e "\e[92m$1 exists in dev directory going there\e[39m"
    elif
      builtin cd "../$1" 3>&2 2>/dev/null
    then
      echo  -e "\e[92m$1 exists in parent directory going there\e[39m"
    elif
      builtin cd "../../$1" 3>&2 2>/dev/null
    then
      echo -e "\e[92m$1 exists in parent directory going there\e[39m"
    elif
      builtin cd "../../../$1" 3>&2 2>/dev/null
    then
      echo -e "\e[92m$1 exists in parent directory going there\e[39m"
    elif
      builtin cd "../../../../$1" 3>&2 2>/dev/null
    then
      echo -e "\e[92m$1 exists in parent directory going there\e[39m"
    #current popular project
    elif
      builtin cd "$HOME/dev/themove/$1" 3>&2 2>/dev/null
    then
      echo -e "\e[92m$1 exists in themove directory going there\e[39m"
    elif
      builtin cd "$HOME/dev/hashed/$1" 3>&2 2>/dev/null
    then
      echo -e "\e[92m$1 exists in hashed directory going there\e[39m"
    else
      echo -e "\e[31mbash: cd $1 No such file or directory"
    fi
  fi

  IFS="/"; declare -a Array=($PWD)
  export PS1="\e[34m${Array[-1]} \e[90m \n\$\e[39m "
  #export PS1="\e[34m${Array[-1]} \e[39m\$ "
  unset IFS
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -e /home/deon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/deon/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


eval "$(direnv hook bash)"
export GPG_TTY=$(tty)


alias cleos='sudo docker exec -it eosio /opt/eosio/bin/cleos --url http://127.0.0.1:7777 --wallet-url http://127.0.0.1:5555'

export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0
export LD_LIBRARY_PATH=/usr/local/lib


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias pull='git pull origin master'
alias push='git push'

eval "$(thefuck --alias)"
