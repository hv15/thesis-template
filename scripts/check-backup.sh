#!/usr/bin/bash

# this script checks whether our backup of the repo is up-to-date

# assume that arg1 is .git location
GITDIR="${1:-.}"

echo "checking if git remote \`backup' is set..." >&2
if ! git -C "$GITDIR" remote show | grep --quiet 'backup'; then
    # missing remote
    git -C "$GITDIR" remote add backup gitolite@git.hans.ninja:phdthesis.git
fi

echo "fetching latest changes..." >&2
git -C "$GITDIR" fetch --all --quiet

echo "comparing state..." >&2
if ! git -C "$GITDIR" diff --quiet --exit-code origin/master..backup/master; then
    echo "backup is *not* up-to-date!!!"
    echo "back is behind by $(git -C "$GITDIR" log --oneline origin/master..backup/master | wc -l) commits..."
    echo "check upstream gitlab config, or force the push locally!"
fi
