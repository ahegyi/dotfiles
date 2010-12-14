export INPUTRC="~/.inputrc"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
export PATH="$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/mysql/bin:/Library/PostgreSQL/9.0/bin:/usr/local/ec2/bin:~/bin"
export MANPATH="$MANPATH:/opt/local/man:/usr/local/mysql/man"
export EDITOR=`which vim`

# Source global definitions
[[ -s "/etc/bashrc" ]] && source "/etc/bashrc"

# Source global aliases
[[ -s "$HOME/.aliases.sh" ]] && source "$HOME/.aliases.sh"

# Git completion
[[ -s "$HOME/.git-completion.sh" ]] && source "$HOME/.git-completion.sh"

# Load RVM into a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# Ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# Autofix typos
shopt -s cdspell

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make 'less' more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u@\H\[$(tput setaf 1)\] ▿ \$(~/.rvm/bin/rvm-prompt)\[$(tput sgr0)\]\n\[$(tput setaf 6)\]ॐ \[$(tput setaf 4)\]\W\[$(tput sgr0)\]/ \[$(tput bold)\]\[$(tput setaf 3)\]\$(__git_ps1 '± %s ')\[$(tput setaf 0)\]\!> \[$(tput sgr0)\]"
else
    PS1='\u@\h:\W '
fi
unset color_prompt

ssh-add ~/.ssh/id_dsa
