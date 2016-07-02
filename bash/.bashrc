# ======================================================================= #
#
# MY PERSONAL $HOME/.bashrc FILE 
# By Kevin Hoarau
# Based on the .bashrc FILE of Emmanuel Rouat http://tldp.org/LDP/abs/html/sample-bashrc.html
# Last modification : 19/03/2016 22:11
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# ======================================================================= #

# If not running interactively, don't do anything 
case $- in
    *i*) ;;
    *) return ;; 
esac
#--------------------------------------------------------------------------
# Source global definitions (if any)
#--------------------------------------------------------------------------

if [ -f /etc/bashrc ]; then 
    . /etc/bashrc # --> Read /etc/.bashrc, if present.
fi

#--------------------------------------------------------------------------
# Greeting, motd etc...
#--------------------------------------------------------------------------

#set -o nounset     # These two options are useful for debugging.
#set -o xtrace
alias debug="set -o nounset; set -o xtrace"

ulimit -S -c 0      # Don't want coredumps
set -o notify
set -o noclobber
set -o ignoreeof

# Enable option
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob    # Necessary for programmable completion.

export EDITOR=vim

# Disable option
shopt -u mailwarn
unset MAILCHECK    # Don't want my shell to warn me of incoming mail.

# Color definitions .
# Some color might look different on some terminals.

# Normal Colors
Black='\e[0;30m'    # Black 
Red='\e[0;31m'      # Red
Green='\e[0;32m'    # Green
Yellow='\e[0;33m'   # Yellow
Blue='\e[0;34m'     # Blue
Purple='\e[0;35m'   # Purple
Cyan='\e[0;36m'     # Cyan
White='\e[0;37m'    # White

# Bold 
BBlack='\e[1;30m'    # Black 
BRed='\e[1;31m'      # Red
BGreen='\e[1;32m'    # Green
BYellow='\e[1;33m'   # Yellow
BBlue='\e[1;34m'     # Blue
BPurple='\e[1;35m'   # Purple
BCyan='\e[1;36m'     # Cyan
BWhite='\e[1;37m'    # White

# Bakground
On_Black='\e[40m'    # Black 
On_Red='\e[41m'      # Red
On_Green='\e[42m'    # Green
On_Yellow='\e[43m'   # Yellow
On_Blue='\e[44m'     # Blue
On_Purple='\e[55m'   # Purple
On_Cyan='\e[46m'     # Cyan
On_White='\e[47m'    # White

NC="\e[m"              # Color Reset

ALERT=${BWhite}${On_Red} # Bold White on red background

#echo -e "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\
#    - DISPLAY on ${BRed}$DISPLAY${NC}\n"
#date 
if [ -x /usr/games/fortune ]; then 
    /usr/games/fortune -s   # Makes our day a bit more fun... )
fi

function _exit()            # Function to run uopn exit a shell
{
    echo -e "${BRed}Nou artrouv${NC}"
}
trap _exit EXIT

#==========================================================================
#
# SHELL PROMPT
#
#==========================================================================
#  Current Format [TIME USER@HOST PWD] > 
#  TIME:
#       Green       == machine load is low
#       Orange      == machine load is medium
#       Red         == machine load is high
#       ALERT       == machine load is very high
#  USER:
#       Cyan        == normal user
#       Orange      == SU to user
#       Red         == root
#  HOST:
#       Cyan        == local session
#       Green       == secured remote connection (via ssh)
#       Red         == unsecured remote connection
#  PWD:
#       Green       == more than 10% free disk space
#       Orange      == less than 10% free disk space
#       ALERT       == less than 5% free disk space
#       Red         == current user does not have write privileges
#       Cyan        == current filesystem is size zero (like /proc)
#  >:
#       White       == no background or suspended jobs in this shell 
#       Cyan        == at least one background job in this shell
#       Orange      == at least one suspended job in this shell
#
#       Command is added too the history file each time you hit enter, 
#       so it's available to all shells (using 'history -a').

# Test connection type:
if [ -n "${SSH_CONNECTION}" ]; then 
    CNX=${Green}    # Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then 
    CNX=${ALERT}    # Connected on remote machine, not via ssh (bad).
else 
    CNX=${BCyan}    # Connected on local machine. 
fi

# Test user type:
if [[ ${USER} == "root" ]]; then 
    SU=${Red}    # User is root.
elif [[ ${USER} != $(logname) ]]; then 
    SU=${BRed}    # User is not login user.
else 
    SU=${BCyan}    # User is normal.
fi

NCPU=$(grep -c 'processor' /proc/cpuinfo)   #number of CPUs
SLOAD=$(( 100*${NCPU} ))        # Small load
MLOAD=$(( 200*${NCPU} ))        # Medium load
XLOAD=$(( 400*${NCPU} ))        # Xlarge load

# Returns system load as percentage, i.e., '40' rather than '0.40'.
function load()
{
    local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.') 
    # System load of the current host.
    echo $((10#$SYSLOAD))    # Convert to decimal
}

# Returns a color indicating system load.
function load_color()
{
    local SYSLOAD=$(load)
    if [ ${SYSLOAD} -gt ${XLOAD} ]; then 
        echo -en ${ALERT}
    elif [ ${SYSLOAD} -gt ${MLOAD} ]; then 
        echo -en ${Red}
    elif [ ${SYSLOAD} -gt ${SLOAD} ]; then 
        echo -en ${BRed}
    else
        echo -en ${Green}
    fi
}

# Returns a color according to free disk space in $PWD
function disk_color()
{
    if [ ! -w "${PWD}" ] ; then 
        echo -en ${Red}
        # No 'write' privileges in the current directory
    elif [ -s "${PWD}" ] ; then 
        local used=$(command df -P "$PWD" |
                awk 'END {print $5} {sub(/%/,"")}')
        if [ ${used} -gt 95 ]; then 
            echo -en ${ALERT}           # Disk almost full (>95%).
        elif [ ${used} -gt 90 ]; then 
            echo -en ${BRed}            # Free disk space almost gone.
        else 
            echo -en ${Green}           # Free disk space is ok.
        fi
    else
        echo -en ${Cyan}
        #Current directory is size '0' (like /proc, /sys etc).
    fi
}

# Returns a color according to running/suspended jobs.
function job_color()
{
    if [ $(jobs -s | wc -l) -gt "0" ]; then 
        echo -en ${BRed}
    elif [ $(jobs -r | wc -l) -gt "0" ]; then 
        echo -en ${BCyan}
    fi
}
 
# No we construct the prompt 
PROMPT_COMMAND="history -a"
case ${TERM} in
    *term | rxvt | linux)
        PS1="\[\$(load_color)\][\A\[${NC}\] "
        # Time of day (with load_info):
        PS1="\[\$(load_color)\][\A\[${NC}\] "
        # User@Host (with connection type info):
        PS1=${PS1}"\[${SU}\]\u\[${NC}\]@\[${CNX}\]\h\[${NC}\] "
        # PWD (with 'disk space' info):
        PS1=${PS1}"\[\$(disk_color)\]\W]\[${NC}\] "
        # Prompt (with 'job' info):
        PS1=${PS1}"\[\$(job_color)\]>\[${NC}\] "
        # Set title of current xterm:
        PS1=${PS1}"\[\e]0;[\u@\h] \w\a\]"
        ;;
    *)
        PS1="(\A \u@\h \W) > "      # --> PS1=(\A \u@\h \w) > "
                                    # --> Shows full pathname of current dir.
        ;;
esac

export TIMEFORMAT=$'\nreal %3R\tuser %3u\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HISTCONTROL=ignoredumps
export HOSTFILE=$HOME/.hosts        # Put a list of remote hosts in ~/.hosts

shopt -s histappend                 # append to the history file, don't overwrite it


#==========================================================================
#
# ALIASES AND FUNCTIONS 
#
#==========================================================================

#--------------------------------------------------------------------------
# Personal Aliases
#--------------------------------------------------------------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias empty='truncate -s0'

#--------------------------------------------------------------------------
# ls command Aliases
#--------------------------------------------------------------------------

# Add color for filetype and human-readable sizes by default on 'ls':
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls -h --color'
alias l='ls -CF'            # Sort in colums, with indicators /*>
alias lx='ls -lXB'          # Sort by extension.
alias lk='ls -lSr'          # Sort by size, biggest last.
alias lt='ls -ltr'          # Sort by date, most recent last.
alias lc='ls -ltcr'         # Sort by/show change time, most recent last.
alias lu='ls -ltur'         # Sort by/show access time, most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll='ls -lv --group-directories-first'
alias lm='ll | more'        # Pipe through 'more'
alias lr='ll -R'            # Recursive ls.
alias la='ll -A'            # Show hidden files.
#alias tree='tree -Csuh'    # Nice alternative to 'recursive ls' ... //to install

# Force the coloured output of the less command
alias less='less -r'

#--------------------------------------------------------------------------
# Tailoring 'less'
#--------------------------------------------------------------------------
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'

#--------------------------------------------------------------------------
# vi  command aliases
#--------------------------------------------------------------------------
alias vi='vim'

#--------------------------------------------------------------------------
# Directory nav aliases
#--------------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'

# Add an "alert" alias for long running commands. Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#--------------------------------------------------------------------------
# Programmable completion features
#--------------------------------------------------------------------------

# Enable programmable completion features
if ! shopt -oq posix; then 
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then 
        . /etc/bash_completion
    fi
fi


#--------------------------------------------------------------------------
# Files and strings related functions
#--------------------------------------------------------------------------

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# mkdir and cd commands in one 
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

function extract ()     # extraction wrappper command
{
    if [ -f $1 ] ; then 
        case $1 in 
            *.tar.bz2)  tar xvjf $1     ;;
            *.tar.gz)   tar xvzf $1     ;;
            *.bz2)      bunzip   $1     ;;
            *.rar)      unar     $1     ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xvf $1      ;;
            *.tbz2)     tar xvjf $1     ;;
            *.tgz)      tar xvzf $1     ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;; 
            *)      echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz" "${1%%/}/"; }

# Creates a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

#--------------------------------------------------------------------------
# Other functions
#--------------------------------------------------------------------------

function play ()    # Just play a folder
{
    if [ "$#" -ne 1 ] ; then 
        echo "Usage: play [DIR]"
    else
        SONGDIR=$1
        OLDPWD=$(pwd)
          if [ -d "$SONGDIR" ] ; then
              cd "$SONGDIR" && mplayer *.mp3
              cd $OLDPWD
          else
              mplayer $SONGDIR
              cd $OLDPWD
          fi
    fi
}
