#!/bin/bash

STATUS_ARGS=$1
PATHSPEC=$2

function check() {
  set -e
  output=$(git status --porcelain $STATUS_ARGS $PATHSPEC)
  set +e

  echo "$output"
  if [[ -z "$output" ]];
  then
    return 0
  else
    return 1
  fi
}

changes=$(check)
changed=$?

# Escape result
changes="${changes//'%'/'%25'}"
changes="${changes//$'\n'/'%0A'}"
changes="${changes//$'\r'/'%0D'}"

echo ::set-output name=changed::$changed
echo ::set-output name=changes::$changes
