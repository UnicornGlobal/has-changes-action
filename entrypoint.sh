#!/bin/bash
set -e

STATUS_ARGS=$1
PATHSPEC=$2

function check() {
  
  git config --global --add safe.directory $GITHUB_WORKSPACE;
  
  if [[ -z "$(git status --porcelain $STATUS_ARGS $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
