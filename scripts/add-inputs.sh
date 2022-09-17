#!/usr/bin/env bash

# this script will collect all directory names beginning with 'ch'
# and generate a `input.tex` file which is used to include the
# directory contents. It is assumed that the index TeX file in each
# directory is 'chapter.tex'.

# order of directoies is handled by FS sorting, thus 'ch0*' comes before
# 'ch1*' and so on.

# we use subfileinclude as this helps to speedup subsequent compilations,
# we however need to pre-populate the build directory with the chapter
# hierarchy in order to store the AUX file. We do this as part of the make
# call.

_first=true

for dir in ch*; do
    if [ -f "$dir/chapter.tex" ]; then
        if [ $_first = true ]; then
            echo "\newcommand{\subdir}{$dir}"
            _first=false
        else
            echo "\renewcommand{\subdir}{$dir}"
        fi
        echo "\subfileinclude{\subdir/chapter}"
    else
        echo "Chapter directory \`$dir' is missing chapter.tex, skipping..." >&2
    fi
done
