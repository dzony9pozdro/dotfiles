#!/bin/bash

# Define the config file
CONFIG_FILE="$HOME/.config/alacritty/font.toml"

# 1. Get unique list of installed font families, filtered for Nerd Fonts
# 2. Use 'fzf' to let you fuzzy-search/select
selected_font=$(fc-list : family | grep -i "Nerd Font" | sed 's/,[^,]*//g' | sort -u | fzf --height 40% --reverse --header="Select a font:")

# If you hit Esc or didn't select anything, just exit
if [ -z "$selected_font" ]; then
    exit 0
fi

# Apply the change
sed -i '' "s/^[[:space:]]*family =.*/family = \"$selected_font\"/" "$CONFIG_FILE"
echo "🎯 Set Alacritty font to: \"$selected_font\""
touch alacritty.toml
