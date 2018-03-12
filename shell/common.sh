#!/bin/sh
# Disclaimer: This document along with the others in my dotfiles repository is
#   sourced from my own experiementation as well as from documents throughout
#   internet. If you see something that you believe deserves attribution, let
#   me know.
# - If you found this document in my CapitalOne repository clone contact me at:
#   - Andrew.Hayes@CapitalOne.com
# - If you found this document in the original GitHub repository contact me at:
#   - Andrew.Russell.Hayes@gmail.com
##

##
# Common Boilerplate Starter Stuff
##

# If not running interactively, don't do anything
# This is important because we can customize whatever we want but scripts we
# run will still rely on the standard Functions ($PS1 is unset in
# non-interactive shells).
[ -z "$PS1" ] && return


################# Color Stuff
# TODO: test on other systems, move to OS-Specific if needed
# Color LS for mac
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx #black bkgd
#export LSCOLORS=ExFxCxDxBxegedabagacad #white bkgd

##
# Common Functions
##
psadd(){
# Usage: psadd devBoxEast1
#   This command will take your current PS1 env var (aka your prompt) and it
# will append to the end of it whatever you pass in followed immediately by an
# ">" and a single space.
# So, if your prompt is "[XXXX] " executing "psadd devBoxEast1" will result in a
# new prompt: "[XXXX] devBoxEast1> "
# NOTE: This command is very useful when you are moving from one machine to
# another often. It allows you to quickly set a reminder for yourself where you
# are.
# TODO: add -rgbyw args to make that thing a specific color
# - add args for all the colors aka -roygbvpwbG etc. so that you can also add
#     color to the thing youre adding to the end of the prompt.
    export PSEND="$@> "
    if [[ -z "$@" ]]; then
        export PSEND=''
    fi
}

##
# Aliases
##
# common dirs
alias db="cd $HOME/dev/go/src/github.com/AndrewRussellHayes/devBuilder"

# cd alias's
alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias cd....="cd ../../../.."
alias cd.....="cd ../../../../.."
alias cd......="cd ../../../../../.."
alias cd.......="cd ../../../../../../.."
alias cd........="cd ../../../../../../../.."
alias cd.........="cd ../../../../../../../../.."
alias cd..........="cd ../../../../../../../../../.."
alias cd...........="cd ../../../../../../../../../../.."
alias cd............="cd ../../../../../../../../../../../.."
alias cd.............="cd ../../../../../../../../../../../../.."
alias cd..............="cd ../../../../../../../../../../../../../.."
alias cd...............="cd ../../../../../../../../../../../../../../.."
alias cd................="cd ../../../../../../../../../../../../../../../.."

# make grep have color output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# git alias's
## may need to make another file if these grow too large
alias gss='git status'
alias gs='git status --short'
alias ga='git add'
alias gcm='git commit -m'

# listing
#alias ls="ls -AbFG"
alias l="ls  -1AbFGh"
#alias l="ls  -1AbFGhT" # T needs an arg on centos
#alias ls="ls  -1AbFGhT"
alias ll="ls -lAbFGh"
#alias ll="ls -lAbFGhT"
#alias lrt="ls -rtlAbFGhT"
#alias ld="ls -lAbFGhT | egrep '^d'"
alias ld="ls -lAbFGh | egrep '^d'"
#alias lf="ls -lAbFGhT | egrep -v '^d'"
alias lf="ls -lAbFGh | egrep -v '^d'"

# below notes are from a mac machine running 10.12.6
# -1 = Force output to be one entry per line.  This is the default when output
#      is not to a terminal.
# -A = List all entries except for . and ...  Always set for the super-user.
# -a = Include directory entries whose names begin with a dot (.).
# -b = Same thing as -B, but use C escape codes whenever possible. B is: "Force
#      printing of non-printable characters (as defined by ctype(3) and current
#      locale settings) in file names as \xxx, where xxx is the numeric value of
#      the character in octal.
# -F = Display a slash (`/') immediately after each pathname that is a
#      directory, an asterisk (`*') after each that is executable, an at sign
#      (`@') after each symbolic link, an equals sign (`=') after each socket, a
#      percent sign (`%') after each whiteout, and a vertical bar (`|') after
#      each that is a FIFO.
# -G = Enable colorized output.  This option is equivalent to defining CLICOLOR
#      in the environment. (If you use LSCOLORS then this will do nothing)
# -h = Human readable sizes
# -l = List in long format.
# -R = Recursive ls.
# -r = Reverse sort order.
# -S = Sort Files by Size.
# -T = When used with the -l (lowercase letter ``ell'') option, display complete
#      time information for the file, including month, day, hour, minute,
#      second, and year.
# -t = Sort by time modified (most recently modified first) before sorting the
#      operands by lexicographical order.

##
# OS-Specific Blocks
##
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # tested on: redhat
        # echo "Detected OS: linux-gnu"
        : #this command does nothing but suppresses a bash empty block error.
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        # echo "Detected OS: Mac OSX"
        : #this command does nothing but suppresses a bash empty block error.
else
        # Unknown.
        # echo "Unable to detect OS"
        : #this command does nothing but suppresses a bash empty block error.
fi
