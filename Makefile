DIRS = common desktop laptop
common:
	stow --verbose --dotfiles --target=$$HOME --restow common
desktop: common
	stow --verbose --dotfiles --target=$$HOME --restow desktop
laptop: common
	stow --verbose --dotfiles --target=$$HOME --restow laptop
delete:
	for dir in $(DIRS); do \
		stow --verbose --dotfiles --target=$$HOME --delete $$dir ; \
	done
.PHONY : common
.PHONY : laptop
.PHONY : desktop
.PHONY : delete

