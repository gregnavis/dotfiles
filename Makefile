HOSTNAME ?= $(shell hostname)
INSTALL ?= $(HOME)

VIM_DIR = $(INSTALL)/.vim

.PHONY: default
default:

.PHONY: all
all: ack bash ctags env fbpanel fonts.conf git gitconfig gitignore hg i3 \
	i3status inputrc openbox pip startx vim xmodmap Xresources xsession

.PHONY: show-config
show-config:
	@echo "HOSTNAME=$(HOSTNAME)"
	@echo "INSTALL=$(INSTALL)"
	@echo "VIM_DIR=$(VIM_DIR)"

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
	cp vimrc $(INSTALL)/.vimrc
	cp gvimrc $(INSTALL)/.gvimrc

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
