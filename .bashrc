# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/chaikalef/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/chaikalef/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chaikalef/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/chaikalef/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export PYTHONPATH='/home/chaikalef/Files/Programs/Python/TPU_demo/GitLab/hitech.release2.0/'

# User specific aliases and functions
alias cls='clear '

alias gcl='git clone '
alias gs='git status '
alias gl='git log '
alias gd='git diff '
alias ga='git add '
alias gr='git reset '
alias gc='git commit -m '
alias gb='git branch '
alias gf='git log —follow — '
alias gg='git log —all —graph —decorate '
alias gch='git checkout '
alias gpu='git push '
alias gpl='git pull '
alias gbf="git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | awk '/^blob/ {print substr($0,6)}' | sort --numeric-sort --key=2 | tail | cut --complement --characters=13-40 | numfmt --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest "

alias tb='tensorboard --logdir=. '
alias ap='autopep8 -r --in-place . '

alias pi='pip install -e . '

alias ca='conda activate '
alias cak='conda activate keras '
alias cab='conda activate base '
alias cac='conda activate cpp '
alias cu='conda update '
alias ci='conda install '
alias cl='conda list '
alias cs='conda search '
alias cc='conda create -n '
alias cel='conda env list '
alias cu='conda uninstall '
alias cr='conda remove -n '
alias cutp='conda uninstall tensorflow keras tensorflow-gpu keras-gpu tensorboard pytorch torchvision cudatoolkit pytorch-cpu torchvision-cpu -y '
alias citc='conda install tensorflow keras tensorboard -y '
alias citg='conda install tensorflow-gpu keras-gpu tensorboard -y '
alias cic='conda install valgrind gcc conda git cmake make cython -y '
alias cib='conda install autopep8 pandas matplotlib qt pyqt pyqtgraph ipython conda numpy pip python opencv git pillow cmake make cython -y '
alias cif='conda install autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias ciftc='conda install tensorflow keras tensorboard autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias ciftg='conda install tensorflow-gpu keras-gpu tensorboard autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias cipc='conda install pytorch-cpu torchvision-cpu -y '
alias cipg='conda install pytorch torchvision -y '
alias cifpc='conda install pytorch-cpu torchvision-cpu autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias cifpg='conda install pytorch torchvision autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '

alias sa='source ~/anaconda3/bin/activate '
