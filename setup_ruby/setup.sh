#!/usr/bin/env bash

set -e

if [ $# -ne 1 ] && [ $# -ne 2 ]
then
  echo 'Usage: ./setup.sh "Nome do Problema" [folder base]'
  exit 1
fi

problem="$1"
folder_base="$2"
base_path="$folder_base"
language="ruby"
setup_base=$(dirname -- "$0")

[ ! -n "$folder_base" ] && base_path="$setup_base/../dojos"

folder="$base_path/$(echo "$problem" | tr '[:upper:]' '[:lower:]'| tr ' ' '_')/$language"

if [ -d "$folder" ]; then
  echo ">>> Problem folder for '$problem' already exist at '$folder'"
else
  echo ">>> Create problem folder for '$problem' at '$folder'"
  [ ! -d "$folder" ] && mkdir -p "$folder" && cp -r "$setup_base/" "$folder/"

  echo ">>> Set date"
  sed "s/\\[DATA\\]/$(date "+%Y-%m-%d %H:%M:%S")/g" "$setup_base/README.md" > "$folder/README_tmp.md"

  echo ">>> Set Problem"
  sed "s/\\[PROBLEM\\]/$problem/g" "$folder/README_tmp.md" > "$folder/README.md"

  echo ">>> Set Ruby Version"
  sed "s/\\[RUBY_VERSION\\]/$(cat "$setup_base/.ruby-version")/g" "$folder/README.md" > "$folder/README_tmp.md"

  mv "$folder/README_tmp.md" "$folder/README.md"

  echo ">>> Remove setup script"
  [ -e "$folder/setup.sh" ] && rm "$folder/setup.sh"
fi

echo ""
echo ">>> DONE"
