HOSTNAME?=`hostname`
INSTALL?=$(HOME)

VIM_DIR=$(INSTALL)/.vim
VIM_VUNDLE_DIR=$(VIM_DIR)/bundle

.PHONY: default all xsession vim vim-vundle inputrc gitignore Xresources bash gitconfig xmodmap xmonad hg

default:

all: xsession vim vim-vundle inputrc gitignore Xresources bash gitconfig xmodmap

xsession: 
	cp xsession.$(HOSTNAME) ~/.xsession

vim: | $(VIM_DIR)
	cp -r vim/* $(VIM_DIR)
	cp vimrc $(INSTALL)/.vimrc
	cp gvimrc $(INSTALL)/.gvimrc

$(VIM_DIR):
	mkdir $(VIM_DIR)

vim-vundle: | $(VIM_VUNDLE_DIR)
	git clone https://github.com/gmarik/vundle.git $(INSTALL)/.vim/bundle/vundle
	vim +BundleInstall +qall

$(VIM_VUNDLE_DIR):
	-mkdir $(VIM_VUNDLE_DIR)

inputrc:
	cp inputrc $(INSTALL)/.inputrc

gitignore:
	cp gitignore $(INSTALL)/.gitignore

Xresources:
	-mkdir $(INSTALL)/.Xresources.d
	cp -r Xresources.d/* $(INSTALL)/.Xresources.d
	cp Xresources $(INSTALL)/.Xresources
	ln -f -s $(INSTALL)/.Xresources.d/$(HOSTNAME) $(INSTALL)/.Xresources.d/current

bash:
	cp bashrc $(INSTALL)/.bashrc
	cp bash_profile $(INSTALL)/.bash_profile

gitconfig:
	cp gitconfig $(INSTALL)/.gitconfig

xmodmap:
	cp xmodmap $(INSTALL)/.xmodmap

xmonad:
	-mkdir $(INSTALL)/.xmonad
	cp xmonad/xmonad.hs $(INSTALL)/.xmonad/xmonad.hs

hg:
	cp hgrc $(INSTALL)/.hgrc
	cp hgignore $(INSTALL)/.hgignore
