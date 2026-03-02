#!/bin/sh
printf '\033c\033]0;%s\a' FelpoJam
base_path="$(dirname "$(realpath "$0")")"
"$base_path/FelpoJam.x86_64" "$@"
