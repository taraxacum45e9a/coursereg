#!/bin/bash
set -ex
source "$(dirname "$0")/commit.sh"

wget --no-verbose https://www.comp.nus.edu.sg/cug/soc-sched/ -O soc-sched.html
wget --no-verbose https://www.comp.nus.edu.sg/cug/specialterm -O specialterm.html

for file in soc-sched specialterm; do
    DATE=$(./clean-sched.py "$file.html" "$DIR/$file.json")
    sed -n '/<article/,/<\/article>/p' "$file.html" >"$DIR/$file.html"
    commit_if_changed "$DATE" "$file.html" "$file.json"
done
