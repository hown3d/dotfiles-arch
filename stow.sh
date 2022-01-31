#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && /bin/pwd )"
for folder in $(find $DIR -mindepth 1 -maxdepth 1 -type d) 
do
  folder=$(basename $folder)
  if [[ $folder == ".git" ]]; then
    continue
  fi
  if [[ $folder == "config" ]]; then
    continue
  fi
  if [[ $1 == "create" ]]; then
    if [[ ! -e $HOME/.config/$folder ]]; then
      mkdir $HOME/.config/$folder
    fi
    stow --restow --target $HOME/.config/$folder "$folder"
  elif [[ $1 == "clean" ]]; then
    stow -D --target $HOME/.config/$folder "$folder"
    rm $HOME/.config/$folder
  else
    echo use clean or create!
  fi
done

