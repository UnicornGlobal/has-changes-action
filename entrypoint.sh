#!/bin/bash
set -e

function check() {
  if [[ -z "$(git status --porcelain)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
