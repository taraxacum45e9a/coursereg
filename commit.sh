# Shared helpers for the update-*.sh scripts. Source, don't execute.

export TZ=Asia/Singapore
DIR=repo

if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist." >&2
    exit 1
fi

# commit_if_changed DATE FILE...: stage FILEs in $DIR and commit them at DATE
commit_if_changed() {
    local date=$1
    shift
    git -C "$DIR" add "$@"
    if git -C "$DIR" diff --cached --quiet; then
        echo "No change in $*"
    else
        git -C "$DIR" commit -m "Update $1 to $date" --date="$date"
    fi
}
