#!/bin/bash
set -e

dirname="${1:-feature_ahead_main}"
filename="animals.txt"

if [[ -d "$dirname" ]]; then
    echo "Directory $dirname already exists"
    exit 1
fi

mkdir "$dirname"
cd "$dirname"
git init
git branch -m main
echo "## This is animals repository" > README.md
git add README.md
git commit -m "C0: initial commit"


main_commit_names=("CA" "CB" "CC" "CD")
animals=("axolotl" "bat" "cat" "dog")
main_commit_count=${#main_commit_names[@]}

for ((i = 0; i < main_commit_count; ++i))
do
    a="${animals[i]}"
    echo "I am $a" >> "$filename"
    git add "$filename"
    git commit -m "${main_commit_names[i]}: add $a in $filename"
done


git branch feature
git reset --hard HEAD~2

echo "Feature-ahead-main repository created"