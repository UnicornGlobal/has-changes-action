#!/bin/bash
set -e

function check() {
  if [[ -z "$(git status --porcelain)" ]];
  then
    return 0
  else
    return 1
  fi
}

$(check)
