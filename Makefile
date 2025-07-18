DIRS = common
common: prepare
	stow --verbose --adopt --dotfiles --target=$$HOME --restow common
prepare:
	./prepare.sh
delete:
	for dir in $(DIRS); do \
		stow --verbose --dotfiles --target=$$HOME --delete $$dir ; \
	done

.PHONY : prepare
.PHONY : common
.PHONY : delete

