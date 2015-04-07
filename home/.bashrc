[[ "$-" != *i* ]] && return

set -o vi

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

function _source () {
    [[ -f $1 ]] && source $1
}

_source $HOME/.git-completion.bash
_source $HOME/.git-prompt.sh

export HISTIGNORE="&:cd:ls:gs:s"
export LS_COLORS='di=36:ex=31:ln=35:or=41:mi=41:pi=93'
export PS1="\[\e[32;40m\][\u \[\e[33;40m\]\w$(__git_ps1 ' (%s)')] \[\e[0m\]"
export TERM="xterm-color"
unset COLORFGBG

alias .vim="cd $HOME/.vim"
alias bashrc="vim $HOME/.bashrc"
alias de="deactivate"
alias envs="env | sort"
alias freeze="pip freeze"
alias h="history"
alias hs="homeshick"
alias ipy="ipython"
alias ls="ls -GFlhp"
alias lsa="ls -a"
alias psa="ps -a"
alias py="python"
alias s="source $HOME/.bashrc"
alias vimrc="vim $HOME/.vimrc"

alias u="cd .."
alias u2="cd ../.."
alias u3="cd ../../.."
alias u4="cd ../../../.."
alias u5="cd ../../../../.."

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

_source $HOME/.homesick/repos/homeshick/homeshick.sh
_source $HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash
_source /usr/local/bin/virtualenvwrapper.sh
_source $HOME/.bashrc_local

# Keep this line at the end.
_source $HOME/.bash_prompt.sh
unset _source
