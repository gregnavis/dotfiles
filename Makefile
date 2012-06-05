ENVIRONMENT?=default
INSTALL?=$(HOME)
RUBY?=ruby1.8

VIM_DIR=$(INSTALL)/.vim
VIM_VUNDLE_DIR=$(VIM_DIR)/bundle

.PHONY: all xsession vim vim-vundle inputrc gitignore Xresources

all:
	echo Please specify what to install.

xsession: 
	cp xsession.$(ENVIRONMENT) ~/.xsession

vim: | $(VIM_DIR)
	cp -r vim/* $(VIM_DIR)
	cp vimrc $(INSTALL)/.vimrc
	cp gvimrc $(INSTALL)/.gvimrc

$(VIM_DIR):
	mkdir $(VIM_DIR)

vim-vundle: | $(VIM_VUNDLE_DIR)
	git clone https://github.com/gmarik/vundle.git $(INSTALL)/.vim/bundle/vundle
	vim +BundleInstall +qall
	# build command-t
	cd $(INSTALL)/.vim/bundle/command-t/ruby/command-t; $(RUBY) extconf.rb; make

$(VIM_VUNDLE_DIR):
	mkdir $(VIM_VUNDLE_DIR)

inputrc:
	cp inputrc $(INSTALL)/.inputrc

gitignore:
	cp gitignore $(INSTALL)/.gitignore

Xresources:
	cp Xresources $(INSTALL)/.Xresources
	cp Xresources.solarized-dark $(INSTALL)/.Xresources.solarized-dark
	cp Xresources.solarized-light $(INSTALL)/.Xresources.solarized-light
