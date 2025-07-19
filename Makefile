DIRS = common
common: prepare
	stow --verbose --adopt --dotfiles --target=$$HOME --restow home
	stow --verbose --adopt --dotfiles --target=$$HOME/.config/ --restow config
	echo "Installing plugins..."
	vim +PlugInstall +qa
	echo "Compiling YCM..."
	python3 $$HOME/.vim/plugged/YouCompleteMe/install.py --all

prepare:
	./prepare.sh

delete:
	for dir in $(DIRS); do \
		stow --verbose --dotfiles --target=$$HOME --delete $$dir ; \
	done

.PHONY : prepare
.PHONY : common
.PHONY : delete

