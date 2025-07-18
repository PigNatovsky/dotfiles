DIRS = common
common: prepare
	stow --verbose --adopt --dotfiles --target=$$HOME --restow home
	stow --verbose --adopt --target=$$HOME/.config/ --restow config
prepare:
	./prepare.sh
delete:
	for dir in $(DIRS); do \
		stow --verbose --dotfiles --target=$$HOME --delete $$dir ; \
	done

.PHONY : prepare
.PHONY : common
.PHONY : delete

