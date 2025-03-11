DIRS = common desktop laptop
common: prepare
	stow --verbose --dotfiles --target=$$HOME --restow common
prepare:
	./prepare.sh
desktop: common
	stow --verbose --dotfiles --target=$$HOME --restow desktop
laptop: common
	stow --verbose --dotfiles --target=$$HOME --restow laptop
delete:
	for dir in $(DIRS); do \
		stow --verbose --dotfiles --target=$$HOME --delete $$dir ; \
	done

.PHONY : prepare
.PHONY : common
.PHONY : laptop
.PHONY : desktop
.PHONY : delete

