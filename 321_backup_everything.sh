#!/usr/bin/env bash
#
# Backup everything in root dir to DEST dir
#
DEST1=$1
DEST2=$2
DEST3=$3

if [ ! -x "$(command -v rsync)" ]; then
    echo "rsync is not installed."; exit 1
fi

if [ "$(id -u)" != "0" ]; then echo "Run as root or use sudo/doas."; exit 1; fi

[ $DEST1 ] && rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} $DEST1
[ $DEST2 ] && rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} $DEST2
[ $DEST3 ] && rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} $DEST3
