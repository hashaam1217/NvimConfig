#!/bin/sh
cd ~/.config/nvim
touch ANYTHING_PLEASE
current_time=$(date "+%Y-%m-%d %H:%M:%S")
git add .
git commit -m "Automatic commit on $current_time"
git push origin main

touch $current_time
