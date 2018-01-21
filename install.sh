#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)"


# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"


# Update dotfiles itself first

if [ -x "$(command -v git)" ]
then
	printf "Updating dot files"
  	git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master;
fi

# Copy configuration files

#ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# TMUX

if [ ! -x "$(command -v tmux)" ]; then
	printf 'Installing TMUX';
	sudo -v;
	sudo apt update;
	sudo apt install tmux;
fi

if [ ! -d ~/.tmux-powerline ]; then
	printf 'Adding tmux powerline';
	git clone https://github.com/erikw/tmux-powerline.git ~/tmux-powerline
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
	printf 'Adding tmux package manager';
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
fi

ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~

# VIM

if [ ! -x "$(command -v vim)" ]; then
	printf 'Installing VIM';
	sudo -v;
	sudo apt update;
	sudo apt install vim;
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	printf 'Adding vundle';
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~

printf "Installation finished"
