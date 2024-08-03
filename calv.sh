#! /bin/sh

set -x

location="$HOME/.appointments"

if [ "$1" = "-a" ]; then
    title="$2"
    description="$3"
    date="$4"
    echo "$title"'\n'"$description"'\n'"$date"'\n' >> "$location"
fi
