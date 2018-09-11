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
