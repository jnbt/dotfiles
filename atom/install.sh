#!/bin/sh

set -e

SCRIPT_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

_install_packages() {
  apm install --packages-file "$SCRIPT_FOLDER/package-list.txt" --quiet
}

_install_config() {
  was=$(pwd)
  target="$HOME/.atom"
  source="$SCRIPT_FOLDER"
  if [ -d "$target" ]
  then
    echo "Config already present at \"$target\""
  else
    echo "Installing config \"$source\" to \"$target\""
    ln -s "$source" "$target"
  fi
}

install() {
  _install_config
  _install_packages
}

save() {
  apm list --installed --bare > "$SCRIPT_FOLDER/package-list.txt"
}

update() {
  apm update
  apm upgrade
  save
}

case "$1" in
  (save)
    save
    exit 1
    ;;
  (update)
    update
    exit 1
    ;;
  (*)
    install
    exit 1
    ;;
esac
