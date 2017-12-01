#!/usr/bin/env bash


# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)"


# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"


# Check for executable install script 

if [ -x "$DOTFILES_DIR/install.sh" ]; then
	printf "Please give executable permisions to '${DOTFILES_DIR}/install.sh'";
	exit 0;
fi


# Update dotfiles itself first

if [ -x "$(command -v git)" ]
then
	printf "Updating dot files"
  	git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master;
fi

# Copy configuration files

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~


# Directories

BASHRC_FILE=~/.bashrc
GIT_CONFIG=~/.gitconfig
OHMYSZH_DIR=~/.oh-my-zsh
TMUX_FILE=~/.tmux.conf
TMUX_TPM_DIR=~/.tmux/plugins/tpm/
VIMRC_FILE=~/.vimrc
VUNDLE=~/.vim/bundle/Vundle.vim
ZSH_FILE=~/.zshrc
