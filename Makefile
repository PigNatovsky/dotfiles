DIRS = common
all: prepare link_configs doom_emacs install_vim_plugins
link_configs:
	stow --verbose --adopt --dotfiles --target=$$HOME --restow home
	stow --verbose --adopt --dotfiles --target=$$HOME/.config/ --restow config

install_vim_plugins:
	echo "Installing plugins..."
	vim +PlugInstall +qa

compile_ycm:
	echo "Compiling YCM..."
	python3 $$HOME/.vim/plugged/YouCompleteMe/install.py --all

doom_emacs:
	~/.config/emacs/bin/doom sync

prepare:
	./prepare.sh

delete:
	for dir in $(DIRS); do \
		stow --verbose --dotfiles --target=$$HOME --delete $$dir ; \
	done

.PHONY : prepare
.PHONY : link_configs
.PHONY : delete
.PHONY : install_vim_plugins
.PHONY : doom_emacs

