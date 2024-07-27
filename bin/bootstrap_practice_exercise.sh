#!/usr/bin/env bash

# Exit if anything fails.
set -euo pipefail

# If argument not provided, print usage and exit
if [ $# -ne 1 ]; then
    echo "Usage: bin/bootstrap_practice_exercise.sh <exercise-slug>"
    exit 1
fi

SLUG="$1"
exercise_dir="exercises/practice/${SLUG}"

# build configlet
echo "Fetching latest version of configlet..."
./bin/fetch-configlet

if [[ -z $author ]]; then
    echo
    read -rp "What's your github username? " author
fi

bin/configlet create --practice-exercise $SLUG --author "${author}" --difficulty 5

# Create V files
touch $exercise_dir/.meta/example.v
touch $exercise_dir/$SLUG.v
touch $exercise_dir/run_test.v
