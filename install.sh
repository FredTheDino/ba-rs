#!/usr/bin/bash

# Compile
cargo build --release
status=$?
if [[ "$status" != "0" ]]; then
    echo "Aborting compilation"
    exit $status
fi

# Kill current running bar
killall bardata
killall lemonbar

mkdir -p ~/.local/bin

# Copy over the bar
cp target/release/bardata ~/.local/bin/bardata
cp togglebar ~/.local/bin/togglebar

# Start the bar
./togglebar &
disown %./togglebar
