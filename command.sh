#!/bin/bash
set -e

function check() {
  if [[ -z "$(git status --porcelain)" ]];
  then
    return 1
  else
    return 0
  fi
}

$(check)
