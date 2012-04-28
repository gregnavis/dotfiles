ENVIRONMENT?=default
INSTALL?=$(HOME)
RUBY?=ruby1.8

.PHONY: all xsession vim vim-vundle

all:
	echo Please specify what to install.

xsession: 
	cp xsession.$(ENVIRONMENT) ~/.xsession

vim:
	mkdir $(INSTALL)/.vim
	cp -r vim/* $(INSTALL)/.vim
	cp vimrc $(INSTALL)/.vimrc
	cp gvimrc $(INSTALL)/.gvimrc

vim-vundle:
	mkdir $(INSTALL)/.vim/bundle
	git clone https://github.com/gmarik/vundle.git $(INSTALL)/.vim/bundle/vundle
	vim +BundleInstall +qall
	# build command-t
	cd $(INSTALL)/.vim/bundle/command-t/ruby/command-t; $(RUBY) extconf.rb; make
