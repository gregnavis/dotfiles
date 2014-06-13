HOSTNAME ?= $(shell hostname)
INSTALL ?= $(HOME)

VIM_DIR = $(INSTALL)/.vim
VIM_BUNDLE_DIR = $(VIM_DIR)/bundle
VIM_VUNDLE_DIR = $(VIM_BUNDLE_DIR)/vundle

YCM_BUILD = /tmp/ycm_build

.PHONY: default
default:

.PHONY: all
all: ack bash ctags env fbpanel fonts.conf git gitconfig gitignore hg \
	inputrc openbox pip startx vim vim-ycm xmodmap Xresources xsession

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
	-mkdir $(INSTALL)/.bash
	cp dependencies/fabric-completion/fabric-completion.bash $(INSTALL)/.bash
	cp bashrc $(INSTALL)/.bashrc
	cp bash_profile $(INSTALL)/.bash_profile

.PHONY: ctags
ctags:
	cp ctags $(INSTALL)/.ctags

.PHONY: env
env:
	cp env $(INSTALL)/.env

.PHONY: fbpanel
fbpanel:
	-mkdir $(INSTALL)/.config/fbpanel
	cp fbpanel/* $(INSTALL)/.config/fbpanel

.PHONY: fonts.conf
fonts.conf:
	cp fonts.conf $(INSTALL)/.fonts.conf

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

.PHONY: inputrc
inputrc:
	cp inputrc $(INSTALL)/.inputrc

.PHONY: openbox
openbox: env startx
	-mkdir -p $(INSTALL)/.config/openbox
	cp -r openbox/* $(INSTALL)/.config/openbox

.PHONY: pip
pip:
	-mkdir $(INSTALL)/.pip
	cp -r pip/* $(INSTALL)/.pip

.PHONY: startx
startx:
	cp startx $(INSTALL)/.startx

.PHONY: vim
vim:
	-mkdir $(VIM_DIR)
	cp -r vim/* $(VIM_DIR)
	[ -e $(VIM_VUNDLE_DIR) ] || git clone https://github.com/gmarik/vundle.git $(VIM_VUNDLE_DIR)
	vim +BundleInstall +qall

.PHONY: vim-ycm
vim-ycm:
	mkdir $(YCM_BUILD)
	cd $(YCM_BUILD) && cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/usr/lib/llvm-3.5 . $(VIM_DIR)/bundle/YouCompleteMe/third_party/ycmd/cpp
	make -C $(YCM_BUILD) ycm_support_libs

.PHONY: xmodmap
xmodmap:
	cp xmodmap $(INSTALL)/.xmodmap

.PHONY: Xresources
Xresources:
	-mkdir $(INSTALL)/.Xresources.d
	cp -r Xresources.d/* $(INSTALL)/.Xresources.d
	cp -r dependencies/base16-xresources/*.xresources $(INSTALL)/.Xresources.d/colors
	cp Xresources $(INSTALL)/.Xresources

.PHONY: xsession
xsession: env startx
	cp xsession $(INSTALL)/.xsession
