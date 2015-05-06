# Exit immediately if shell is not interactive.
[[ "$-" != *i* ]] && return

set -o vi

# Create a backup of whatever file is passed to this function, with an
# underscore prepended to the name.  Directories are copied recursively.
# TODO:  If its a dotfile, add the underscore after the dot.
function ccp () {
    local file="$1"
    [[ -z $file ]] && echo "No argument provided." && return 1

    if [[ -a $file ]]; then
        local backup=$(dirname "$file")/_$(basename "$file")
        cp -R "$file" "$backup"
    else
        echo "$file does not exist."
    fi
}

# Make sure a file exists before sourcing it.
function _source () {
    [[ -f $1 ]] && source $1
}

export HISTIGNORE="&:cd:ls:gs:s"
export LS_COLORS='di=36:ex=31:ln=35:or=41:mi=41:pi=93'
export OS=$(uname -s)
export TERM="xterm-color"
unset COLORFGBG

alias .vim="cd $HOME/.vim"
alias b="vim $HOME/.bashrc"
alias bl="vim $HOME/.bashrc_local"
alias de="deactivate"
alias envs="env | sort"
alias freeze="pip freeze"
alias h="history"
alias hs="homeshick"
alias ipy="ipython"
alias ls="ls -Flhp"
alias lsa="ls -A"
alias py="python"
alias pyserver="python -m SimpleHTTPServer"
alias s="source $HOME/.bashrc"
alias v="vim $HOME/.vimrc"

alias u="cd .."
alias u2="cd ../.."
alias u3="cd ../../.."
alias u4="cd ../../../.."
alias u5="cd ../../../../.."

# Enable autocomplete for Git commands + other aliases.
_source $HOME/.git-completion.bash
alias ck="git checkout"
alias cherry="git cherry -v"
alias commit="git commit"
alias log="git log"
alias logp="git log -p"
alias logs="git log --stat"
alias gb="git branch"
alias gba="git branch -a"
alias gd="git diff"
alias gdc="git diff --cached"
alias grs="git remote show"
alias grso="git remote show origin"
alias gs="git status"
alias gsl="git stash list"

# Homeshick
_source $HOME/.homesick/repos/homeshick/homeshick.sh
_source $HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash

# virtualenv
_source /usr/local/bin/virtualenvwrapper.sh

# Config is slightly different between Mac and Linux.
os_specific_setup () {
    if [[ $OS = "Linux" ]]; then
        local ls_command="ls -BFlhp --color=auto"
        if ls --group-directories-first &> /dev/null; then
            ls_command="${ls_command} --group-directories-first"
        fi
        alias ls=${ls_command}
    elif [[ $OS = "Darwin" ]]; then
        alias ls="ls -FGlhp"
        vcp () {
            local file="$1"
            if [[ ! -f $file ]]; then
                echo "File not found: $file"
                return 1
            fi
            cat $file | pbcopy
        }
    fi
}
os_specific_setup

# Override config on a per-machine basis if necessary.
_source $HOME/.bashrc_local

# Keep this line at the end.
_source $HOME/.bash_prompt.sh
unset _source
