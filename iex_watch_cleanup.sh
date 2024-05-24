#!/bin/bash

# Path to your project
PROJECT_DIR=~/dev/local_mix_project

# Start Watchman and IEx
cd $PROJECT_DIR
watchman watch lib
watchman watch scripts
watchman -- trigger lib compile-scripts '*.ex' -- ~/dev/local_mix_project/watchman-make-lib.sh
watchman -- trigger scripts compile-scripts '*.exs' -- ~/dev/local_mix_project/watchman-make-scripts.sh

# Start IEx
iex -S mix run --no-halt -r ./iex_helpers.exs

# Cleanup Watchman on exit
watchman watch-del-all
watchman shutdown-server
