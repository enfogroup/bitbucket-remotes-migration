#!/bin/bash

SOURCE_TEAM="UPDATEME"
DST_TEAM="UPDATEME"

echo "This will take a while, all $SOURCE_TEAM remotes have to be validated."
echo "Remotes which are not found will be updated to point to $DST_TEAM."
echo "If the remote is unreachable (new name, other remote) this will be reported."
echo ""

for directory in $(ls -d -1 "$PWD/"**/); #iterate over directories
do
  GITCONFIG=$directory/.git/config
  if test ! -f "$GITCONFIG"; then #not a git repository
    continue
  fi

  if ! grep -q $SOURCE_TEAM $GITCONFIG; then #does not belong to SOURCE_TEAM
    continue
  fi

  cd $directory
  ORIGIN=$(git config --get remote.origin.url)

  if git ls-remote -h $ORIGIN &> /dev/null; then #the remote exists
    continue
  fi

  DST_ORIGIN=$(echo $ORIGIN | sed -e "s/$SOURCE_TEAM/$DST_TEAM/")
  if ! git ls-remote -h $DST_ORIGIN &> /dev/null; then #the new remote does not exist
    echo "$directory is not available in $DST_TEAM. This repository will be left untouched"
    continue
  fi

  echo "Updating origin for $directory"
  git remote set-url origin $DST_ORIGIN 
done

