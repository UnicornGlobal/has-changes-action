#!/bin/bash
set -e

echo "git status --porcelain $1 $2"

function check() {
  if [[ -z "$(git status --porcelain $1 $2)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
