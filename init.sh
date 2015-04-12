#!/bin/bash -e
# Homeshick and dotfiles initialization for new environments.

die () {
    echo $1 && return 1;
}
which git > /dev/null || die "git not installed"

REPOS=$HOME/.homesick/repos
DOTFILES_REPO_DIR=$REPOS/dotfiles
DOTFILES_REPO_NAME="cdschmitz/dotfiles"
HOMESHICK_REPO_DIR=$REPOS/homeshick
HOMESHICK_REPO_URL="https://github.com/andsens/homeshick.git"

cd ~
if [[ ! -d $HOMESHICK_REPO_DIR ]]; then
    git clone $HOMESHICK_REPO_URL $HOMESHICK_REPO_DIR
else
    echo "homeshick repo already installed at $HOMESHICK_REPO_DIR"
fi

if [[ ! -d $DOTFILES_REPO_DIR ]]; then
    source $HOMESHICK_REPO_DIR/homeshick.sh
    echo y | homeshick clone $DOTFILES_REPO_NAME
else
    echo "dotfiles repo already installed at $DOTFILES_REPO_DIR"
fi
