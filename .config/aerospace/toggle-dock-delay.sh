#!/bin/bash
current=$(defaults read com.apple.dock autohide-delay 2>/dev/null || echo "0")
# treat anything below 1s as "fast", flip to slow; otherwise flip to fast
if (( $(echo "$current < 1" | bc -l) )); then
  defaults write com.apple.dock autohide-delay -float 1000
else
  defaults write com.apple.dock autohide-delay -float 0
fi
killall Dock
