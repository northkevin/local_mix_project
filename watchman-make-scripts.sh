#!/bin/bash

# Path to your project
PROJECT_DIR=~/dev/local_mix_project

cd $PROJECT_DIR

# Get the list of changed files
changed_files=$(watchman -- trigger $PROJECT_DIR/scripts compile-scripts '*.exs' -- echo "$@")

for file in $changed_files
do
  if [[ $file == *.exs ]]; then
    echo "Detected change in $file, running the script..."
    mix run $file
  fi
done
