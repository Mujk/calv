#! /bin/sh

set -x

location="$HOME/.appointments"

option="$1"
title="$2"
description="$3"
date="$4"
if [ "$option" = "-a" ]; then
    echo "$title"'\n'"$description"'\n'"$date"'\n' >> "$location"
elif [ "$option" = "-d" ]; then
    title="$2"
    set -- "$(grep -n "$title" "$location" | cut -d : -f 1 | tr '\n' ' ')"
    if [ -z "$date" ]; then
    for line in "$@"
    do
        last_line="$(($line+2))"
        sed -i ""$line", "$last_line"d" "$location"
    done
    else
        date="$4"
        lines_with_date=grep -n "$date" "$location" | cut -d : -f 1 | head -1
#       sed -i '"$lines_with_title", "$lines_with_title"d' "$appointments"
    fi
fi
