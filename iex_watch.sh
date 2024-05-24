#!/bin/bash

# Path to your project
PROJECT_DIR=~/dev/local_mix_project

cd $PROJECT_DIR

# Start Watchman trigger
watchman watch $PROJECT_DIR/lib
watchman -- trigger $PROJECT_DIR/lib compile-scripts '*.ex' -- $PROJECT_DIR/watchman-make.sh &
WATCHMAN_PID=$!

# Trap the EXIT signal to stop Watchman when IEx exits
trap "watchman watch-del $PROJECT_DIR/lib; kill $WATCHMAN_PID" EXIT

# Start IEx
iex -S mix
