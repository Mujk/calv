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
    lines="$(grep -n "$title" "$location" | cut -d : -f 1)"
    deleted_lines=0
    if [ -z "$date" ]; then
        echo "$lines" | while read line; do
          line="$(($line-$deleted_lines))"
          last_line="$(($line+4))"
          sed -i ""$line", "$last_line"d" "$location"
          deleted_lines="$(($deleted_lines+4))"
        done
    else
        date="$4"
        lines_with_date=grep -n "$date" "$location" | cut -d : -f 1 | head -1
#       sed -i '"$lines_with_title", "$lines_with_title"d' "$appointments"
    fi
fi
