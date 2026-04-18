#!/usr/bin/env bash
# This script just creates soft links from the directories here to the same named directories in $XDG_CONFIG_HOME

if [[ -z "${XDG_CONFIG_HOME}" ]]; then
    echo "XDG_CONFIG_HOME environment variable is not set, defaulting to ${HOME}/.config"
    XDG_CONFIG_HOME="$HOME/.config"
fi


directories=("alacritty" "ghostty" "hypr" "nvim" "tmux" "waybar" "wofi" "zsh")
for dir in ${directories[@]}; do
    if [[ -d "${XDG_CONFIG_HOME}/${dir}" ]]; then
        echo "${dir} already exists in ${XDG_CONFIG_HOME}, please remove the existing directory if you'd like to use this script"
    else
        echo "Creating soft link for ${dir} in ${XDG_CONFIG_HOME}"
        ln -s "./${dir}" "${XDG_CONFIG_HOME}/${dir}"
    fi
done
