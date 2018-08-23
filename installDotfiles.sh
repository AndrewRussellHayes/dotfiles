#!/bin/bash
# sets up dotfiles
# By: Andrew Hayes

#NOTE: this program should be able to be ran on any system and only install all my dotfile and non-mac config non-distructively... work in progress

DRYRUN='' # make '' to run and 'yes' to perform dryrun
SOURCEPARENT=$HOME/Dropbox/dotfiles
OLD_file_dir="$HOME/oldDotfiles-`date +%y%m%d_%s`"
OLD_directory_dir="$HOME/oldDirs-`date +%y%m%d_%s`"


# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until this script has finished
# Note: not tested but the logic makes sense
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#make dir to store saved older config files
if [ $DRYRUN ] ; then
  echo mkdir $OLD_file_dir
else
  mkdir $OLD_file_dir
fi

linkdotfiles() {
  sourcePath=$SOURCEPARENT/$1
  originalPath=$HOME/$2

  if [ $DRYRUN ] ; then
    if [ -e $originalPath ]; then     # If the File exists
      if [ -h $originalPath ]; then     # AND is a symlink
        echo rm $originalPath             # print Delete the symlink
      else                              # Otherwise
        echo mv $originalPath $OLD_file_dir/$2 # print move the file to $OLD_file_dir
      fi
    fi
    echo ln -s $sourcePath $originalPath # print make new symlink
  else
    if [ -e $originalPath ]; then     # If the File exists
      if [ -h $originalPath ]; then     # AND is a symlink
        rm $originalPath                  # Delete the symlink
      else                              # Otherwise
        mv $originalPath $OLD_file_dir/$2 # move the file to $OLD_file_dir
      fi
    fi
    ln -s $sourcePath $originalPath   # make new symlink
  fi
}

############### Program
# the left side is where it is in dotfiles right side is its filename inside $HOME
linkdotfiles  ''                .dotfiles #this is a special case JUST for .dotfiles
linkdotfiles appconfigs         .appconfigs
linkdotfiles appconfigs/iterm/iterm2_shell_integration.bash  .iterm2_shell_integration.bash
linkdotfiles appconfigs/iterm/iterm2_shell_integration.zsh   .iterm2_shell_integration.zsh
linkdotfiles bash/bashrc        .bashrc
linkdotfiles bash/bash_profile  .bash_profile
linkdotfiles docker             .docker
linkdotfiles git/gitconfig      .gitconfig
linkdotfiles private/aws        .aws
linkdotfiles private/m2         .m2
linkdotfiles private/ssh        .ssh
linkdotfiles tmux.conf          .tmux.conf
linkdotfiles vim                .vim
#linkdotfiles vim/vimrc          .vimrc #i think this will be auto-found in the .vim dir
linkdotfiles zsh/zshrc          .zshrc


## testing
#linkdotfiles TESTFILE           .TESTFILE
#linkdotfiles TESTDIR            .TESTDIR
##



###linkdirs
#make dir to store saved older config files
if [ $DRYRUN ] ; then
  echo "\n\n\n\n"
  echo mkdir $OLD_directory_dir
else
  mkdir $OLD_directory_dir
fi

linkdirs() {
  #sourcePath=$SOURCEPARENT/$1
  originalPath=$HOME/$2

  if [ $DRYRUN ] ; then
    if [ -e $originalPath ]; then     # If the File exists
      if [ -h $originalPath ]; then     # AND is a symlink
        echo rm $originalPath             # print Delete the symlink
      else                              # Otherwise
        echo mv $originalPath $OLD_directory_dir/$2 # print move the file to $OLD_file_dir
      fi
    fi
    echo ln -s $1 $originalPath # print make new symlink
  else
    if [ -e $originalPath ]; then     # If the File exists
      if [ -h $originalPath ]; then     # AND is a symlink
        rm $originalPath                  # Delete the symlink
      else                              # Otherwise
        sudo mv $originalPath $OLD_directory_dir/$2 # move the file to $OLD_file_dir
      fi
    fi
    ln -s $1 $originalPath   # make new symlink
  fi
}

## non dotfiles dir linking
linkdirs $HOME/Dropbox/workdocsBRX  Documents
linkdirs $HOME/Dropbox/Documents    PersonalDocs
linkdirs $HOME/Dropbox/Desktop      Desktop
linkdirs $HOME/Dropbox/Downloads    Downloads
linkdirs $HOME/Dropbox/brx  				brx 
linkdirs $HOME/Dropbox/brx/dev			dev 


##########################
# TODO:
# - ssh-copy-id (create key if not exist)
#    - make a new keyfile for each host and use that. use the Host github.com \ IdentityFile ~/.ssh/github syntax in the .ssh/config file
# - tmux startup
# - add dzdo or sudo for yum -y install tmux vim
# - add tmux session create commands for dev, vim, log, test
#   - tmux new -s session_name
#   - make a cron that ensures the sessions are running when the machine comes on and every morning
# - add a function that takes a list or file of hosts and ssh-copy-id's onto them. also that makes a key if you dont have one. (https://www.ssh.com/ssh/copy-id)
# _ add a git clone function that pulls in the current list of dev repos

#ADD TO STEPS
# new hosts need an askii art welcom generated using colossal font at:
# http://patorjk.com/software/taag/#p=display&f=Colossal&t=[host]
# http://patorjk.com/software/taag/#p=display&f=Colossal&t=BRXMBP

## note for the above to work well the hostname shoule be simple. preferably 1
## word. To verify see what `hostname -s` prints.
