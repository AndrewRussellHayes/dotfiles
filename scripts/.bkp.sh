#!/bin/bash

CMD="tar czfP ~/backupdotfiles/dotfilesBackup-$(date +"%y%m%d-%H%M%S").tar.gz ~/OneDrive\ -\ Capital\ One\ Financial\ Corporation/dev/dotfiles/"
echo $CMD 
eval $CMD

CMD="tar czfP ~/backupdotfiles/passBackup-$(date +"%y%m%d-%H%M%S").tar.gz ~/.password-store/"
echo $CMD 
eval $CMD
