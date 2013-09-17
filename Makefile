HOSTNAME ?= $(shell hostname)
INSTALL ?= $(HOME)

VIM_DIR = $(INSTALL)/.vim
VIM_BUNDLE_DIR = $(VIM_DIR)/bundle
VIM_VUNDLE_DIR = $(VIM_BUNDLE_DIR)/vundle

.PHONY: default
default:

.PHONY: show-config
show-config:
	@echo "HOSTNAME=$(HOSTNAME)"
	@echo "INSTALL=$(INSTALL)"
	@echo "VIM_DIR=$(VIM_DIR)"
	@echo "VIM_BUNDLE_DIR=$(VIM_BUNDLE_DIR)"
	@echo "VIM_VUNDLE_DIR=$(VIM_VUNDLE_DIR)"

.PHONY: ack
ack:
	cp ackrc $(INSTALL)/.ackrc

.PHONY: bash
bash: env
	cp bashrc $(INSTALL)/.bashrc
	cp bash_profile $(INSTALL)/.bash_profile

.PHONY: env
env:
	cp env $(INSTALL)/.env

.PHONY: git
git: gitconfig gitignore

.PHONY: gitconfig
gitconfig:
	cp gitconfig $(INSTALL)/.gitconfig

.PHONY: gitignore
gitignore:
	cp gitignore $(INSTALL)/.gitignore

.PHONY: hg
hg:
	cp hgrc $(INSTALL)/.hgrc
	cp hgignore $(INSTALL)/.hgignore

.PHONY: i3
i3:
	-mkdir $(INSTALL)/.i3
	cp i3/config $(INSTALL)/.i3/config

.PHONY: i3status
i3status:
	cp i3status.conf $(INSTALL)/.i3status.conf

.PHONY: inputrc
inputrc:
	cp inputrc $(INSTALL)/.inputrc

.PHONY: pip
pip:
	-mkdir $(INSTALL)/.pip
	cp -r pip/* $(INSTALL)/.pip

.PHONY: vim
vim:
	-mkdir $(INSTALL)/.vim
	cp -r vim/* $(VIM_DIR)
	cp vimrc $(INSTALL)/.vimrc
	cp gvimrc $(INSTALL)/.gvimrc
	[ -e $(VIM_VUNDLE_DIR) ] || git clone https://github.com/gmarik/vundle.git $(VIM_VUNDLE_DIR)
	vim +BundleInstall +qall

.PHONY: xmobar
xmobar:
	cp xmobarrc $(INSTALL)/.xmobarrc

.PHONY: xmodmap
xmodmap:
	cp xmodmap $(INSTALL)/.xmodmap

.PHONY: xmonad
xmonad:
	-mkdir $(INSTALL)/.xmonad
	cp xmonad/xmonad.hs $(INSTALL)/.xmonad/xmonad.hs

.PHONY: Xresources
Xresources:
	-mkdir $(INSTALL)/.Xresources.d
	cp -r Xresources.d/* $(INSTALL)/.Xresources.d
	cp Xresources $(INSTALL)/.Xresources
	ln -f -s $(INSTALL)/.Xresources.d/$(HOSTNAME) $(INSTALL)/.Xresources.d/current

.PHONY: xsession
xsession: env
	cp xsession $(INSTALL)/.xsession
