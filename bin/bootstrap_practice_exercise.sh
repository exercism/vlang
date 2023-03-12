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

# Preparing config.json
echo "Adding instructions and configuration files..."
NAME=$(echo $SLUG | sed -e 's/-/ /g' -e 's/\b\(.\)/\u\1/g' )
UUID=$(bin/configlet uuid)
jq --arg slug "$SLUG" --arg name "$NAME" --arg uuid "$UUID" \
    '.exercises.practice += [{slug: $slug, name: $name, uuid: $uuid, practices: [], prerequisites: [], difficulty: 5}]' \
    config.json > config.json.tmp
# jq always rounds whole numbers, but average_run_time needs to be a float
sed -i 's/"average_run_time": \([[:digit:]]\+\)$/"average_run_time": \1.0/' config.json.tmp
mv config.json.tmp config.json

# Create instructions and config files
./bin/configlet sync --update --yes --docs --metadata --exercise "$SLUG"
./bin/configlet sync --update --yes --filepaths --exercise "$SLUG"
./bin/configlet sync --update --tests include --exercise "$SLUG"

# Create V files
touch $exercise_dir/.meta/example.v
touch $exercise_dir/$SLUG.v
touch $exercise_dir/run_test.v
