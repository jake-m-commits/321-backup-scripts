#!/usr/bin/env bash
#
# Backup everything in root dir to DEST dir
#
DEST1=$1
DEST2=$2

if [ ! -x "$(command -v rsync)" ]; then
    echo rsync is not installed. ; exit 1
fi

[ $DEST1 ] && rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} $DEST1
[ $DEST2 ] && rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} $DEST2
