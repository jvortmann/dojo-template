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

[ -z "$folder_base" ] && base_path="$setup_base/../dojos"

folder="$base_path/$(echo "$problem" | tr '[:upper:]' '[:lower:]'| tr ' ' '_')/$language"

if [ -d "$folder" ]; then
  echo ">>> Problem folder for '$problem' already exist at '$folder'"
else
  echo ">>> Create problem folder for '$problem' at '$folder'"
  [ ! -d "$folder" ] && mkdir -p "$folder" && cp -r "$setup_base/template/" "$folder/"

  echo ">>> Configure Readme"
  sed "s/\\[DATA\\]/$(date "+%Y-%m-%d %H:%M:%S")/g" "$setup_base/template/README.md" | \
  sed "s/\\[PROBLEM\\]/$problem/g" | \
  sed "s/\\[RUBY_VERSION\\]/$(cat "$setup_base/template/.ruby-version")/g" > \
  "$folder/README.md"
fi

echo ""
echo ">>> DONE"
