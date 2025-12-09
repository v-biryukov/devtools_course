#!/bin/bash
set -e

dirname="${1:-two_branch_repo}"
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


git switch -c feature HEAD~2
feature_commit_names=("CE" "CF")
feature_animals=("emu" "fox")
feature_commit_count=${#feature_commit_names[@]}

for ((i = 0; i < feature_commit_count; ++i))
do
    a=${feature_animals[i]}
    echo "I am $a" >> "$filename"
    git add "$filename"
    git commit -m "${feature_commit_names[i]}: add $a in $filename"
done

git switch main
echo "Two-branch repository created"