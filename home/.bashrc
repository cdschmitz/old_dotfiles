[[ "$-" != *i* ]] && return

[[ -f ~/.git-completion.bash ]] && source ~/.git-completion.bash
[[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh

set -o vi

export HISTIGNORE="&:cd:ls:gs:db:st:va:rs:rsp:s"
export LS_COLORS='di=36:ex=31:ln=35:or=41:mi=41:pi=93'
export TERM="xterm-color"
unset COLORFGBG

alias bashrc="vim ~/.bashrc"
alias envs="env | sort"
alias freeze="pip freeze"
alias h="history"
alias ipy="ipython"
alias ls="ls -lhp"
alias lsa="ls -a"
alias psa="ps -a"
alias py="python"
alias s="source ~/.bashrc"
alias vimrc="vim ~/.vimrc"

alias u="cd .."
alias u2="cd ../.."
alias u3="cd ../../.."
alias u4="cd ../../../.."
alias u5="cd ../../../../.."

alias ck="git checkout"
alias cherry="git cherry -v"
alias commit="git commit"
alias gb="git branch"
alias gba="git branch -a"
alias gd="git diff"
alias gdc="git diff --cached"
alias grs="git remote show"
alias grso="git remote show origin"
alias gs="git status"
alias log="git log"
alias logp="git log -p"
alias logs="git log --stat"


#export BEST_TAUTOMER="-W 'e,-ms,1'"
export PATH="$(brew --prefix coreutils)/libexec/gnubin":$PATH
export PIP_DOWNLOAD_CACHE=~/Library/Caches/pip-downloads
export PS1="\[\e[32;40m\][\u \[\e[33;40m\]\w$(__git_ps1 ' (%s)')] \[\e[0m\]"
#export PS1="\[\e[32;40m\][\u \[\e[33;40m\]\w] \[\e[0m\]"
export PYTHONPATH=/Users/schmitz/scripts/SCRIPTS/:${PATH}
export SCHRODINGER=/opt/schrodinger/suites2014-4
export SCHRODINGER_PDB=/Users/schmitz/PDB_archive
export SCRIPTS=/Users/schmitz/scripts/SCRIPTS

alias f8="flake8"
alias profile="python -m cProfile -s cumulative"

alias copy_librarian_db="scp lucy:/wstore/www/site2011/internal/librarian/library/database/library.sq3 library.sqlite"
copy_newco_db () {
    backup_script=${SCRIPTS}/validb1_backup.py
    if [ $(which mysqldump) ]; then
        python $backup_script -o . -db newco
    else
        echo "Backup failed, mysqldump not in PATH"
    fi
}

# Other
alias djprod="ssh -t pdx-ddagdjango-lv01 'cd /ddag_apps/; bash'"
alias djdev="ssh -t pdx-ddagdjangodev-lv01 'cd /ddag_apps/; bash'"
alias chrome="open /Applications/Google\ Chrome.app/"
alias ls="ls -lhp --color --group-directories-first"
alias preview="open /Applications/Preview.app/"
alias s="source ~/.bashrc"
alias sq="sqlite3"
alias usage="du -hs * | sort -hr"
alias vimrc="vim ~/.vimrc"

alias cC="$SCHRODINGER/utilities/canvasConvert"
alias copy="tr -d '\n' | pbcopy"
alias count="$SCHRODINGER/run $SCRIPTS/count.py"
alias jobs="$SCHRODINGER/jobcontrol -list"
alias ligprep="$SCHRODINGER/ligprep"
alias maestro="$SCHRODINGER/maestro"
alias prep="run ~/scripts/prepare/prepare_set.py"
alias run="$SCHRODINGER/run"

c() { cd "$@" && ls; }
ccp() {
    local file="$1"
    [[ -z $file ]] && echo "No argument provided." && return 1

    if [[ -a $file ]]; then
        local backup=$(dirname "$file")/_$(basename "$file")
        if [[ -d $file ]]; then
            cp -R $file $backup
        elif [[ -f $file ]]; then
            cp $file $backup
        else
            echo "Directories and normal files only."
        fi
    else
        echo "$file does not exist."
    fi
}

################################
# Emscripten
################################
export EMSCRIPTEN_HOME=$HOME/emscripten
export EMSCRIPTEN_ROOT_PATH=$EMSCRIPTEN_HOME/emscripten
export LLVM=$EMSCRIPTEN_HOME/llvm-build/Release+Asserts/bin
#export LLVM=$EMSCRIPTEN_HOME/llvm-3.4.2-build/Release+Asserts/bin
#export LLVM=$EMSCRIPTEN_HOME/fastcomp/build/Release/bin

emscripten () {
    [[ -z $OLD_PATH ]] && export OLD_PATH=$PATH
    #cd $EMSCRIPTEN_HOME

    # Default 3.2
    #export PATH=$EMSCRIPTEN_HOME/emscripten:$EMSCRIPTEN_HOME/build-emscripten-qt/install/bin:$LLVM:$PATH
    export PATH=$EMSCRIPTEN_HOME/emscripten:$EMSCRIPTEN_HOME/bqt/install/bin:$LLVM:$PATH
    #export PATH=$EMSCRIPTEN_HOME/emscripten:$LLVM:$PATH
    #export PATH=$LLVM:$PATH
    export QMAKESPEC=$EMSCRIPTEN_HOME/bqt/install/mkspecs/qws/emscripten-clang

    # Fastcomp
    #export LLVM=$EMSCRIPTEN_HOME/fastcomp/build/Release/bin
    #export PATH=$EMSCRIPTEN_HOME/build-emscripten-qt-fastcomp/install/bin:$EMSCRIPTEN_HOME/emscripten:$LLVM:$PATH
    #export QMAKESPEC=$EMSCRIPTEN_HOME/build-emscripten-qt-fastcomp/install/mkspecs/qws/emscripten-clang
}

emscripten_deactivate () {
    [[ -z $OLD_PATH ]] && return
    export PATH=$OLD_PATH
    unset OLD_PATH
    unset EMSCRIPTEN_ROOT_PATH
    unset QMAKESPEC
}

export WORKON_HOME="/Users/schmitz/.virtualenvs"
export VIRTUALENVWRAPPER_HOOK_DIR="$WORKON_HOME/hooks"
alias ddag="workon ddag_portal"
alias de="deactivate"
alias dev="workon dev"
alias pldb="cd ~/pldb; source ~/pldb/pldb_env/bin/activate;"
alias tracking="cd ~/git/scripts/users/schmitz/tracking/; . ../valid/valid_env/bin/activate"
alias valid="cd ~/git/scripts/users/schmitz/valid/; . valid_env/bin/activate"
source /usr/local/bin/virtualenvwrapper.sh

source $HOME/.homesick/repos/homeshick/homeshick.sh
source $HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash

# Keep this line at the end.
source ~/.bash_prompt.sh
