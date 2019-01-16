#!/usr/bin/env bash

set -e

if [ $# -ne 2 ]
then
  echo 'Usage: ./setup.sh "Nome do Problema" "linguagem"'
  exit 1
fi

base_path="$(pwd)/dojos"
problem="$1"
language="$2"

if [ ! -d "setup_$language" ]; then
  echo ">>> There is no setup folder for '$language'"
else
  exec "setup_$language/setup.sh" "$problem"  "$base_path"
fi
