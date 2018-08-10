#!/bin/sh


# sym link the dotfiles directory -> ~/.dotfiles
ln -s Dropbox/dev/dotfiles/ .dotfiles
# sym link the .ssh dir
ln -s .dotfiles/private/ssh/ .ssh
# do the same for .vim, .vimrc, .zshrc, Dev, Documents
ln -s .dotfiles/vim .vim
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/zshrc .zshrc
ln -s Dropbox/dev Dev
sudo rm -rf Documents
ln -s Dropbox/Documents Documents
# symlink the iterm2 shell integration script
ln -s .dotfiles/.iterm2_shell_integration.zsh .iterm2_shell_integration.zsh
# make symlink for ranger config
ln -s ~/.dotfiles/config .config

# new hosts need an askii art welcom generated using colossal font at:
# http://patorjk.com/software/taag/#p=display&f=Colossal&t=[host]
# http://patorjk.com/software/taag/#p=display&f=Colossal&t=BRXMBP

## note for the above to work well the hostname shoule be simple. preferably 1
## word. To verify see what `hostname -s` prints.
#
# at this point everhing looks like it should work for standard work.


## setting changes
# dark menubar


###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dashboard" "Dock" "Finder" \
	"SystemUIServer" "Terminal" "Transmission" \
	"iTunes"; do
	killall "$app" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."


#################################################################################################################################################################################
