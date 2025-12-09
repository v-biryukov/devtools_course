#!/bin/bash
set -e

dirname="${1:-octopus_repo}"

if [[ -d "$dirname" ]]; then
    echo "Directory $dirname already exists"
    exit 1
fi

mkdir "$dirname"
cd "$dirname"
git init
git branch -m main
echo "## This is octopus repository" > README.md
git add README.md
git commit -m "C0: initial commit"


alphabet=( {A..Z} )
names=(alice bob casper diana)
count=${#names[@]}

for ((i = 0; i < count; ++i))
do
    git switch -c "${names[$i]}" main
    echo "First ${names[$i]}" >> "${names[$i]}.txt"
    git add .
    git commit -m "C${alphabet[$i]}1: add first ${names[$i]} line"
    echo "Second ${names[$i]}" >> "${names[$i]}.txt"
    git add .
    git commit -m "C${alphabet[$i]}1: add second ${names[$i]} line"
done

git switch main
echo "First main comment" >> README.md
git commit -am "C1: add new line to readme file"
echo "Second main comment" >> README.md
git commit -am "C2: add new line to readme file"

echo "Octopus repository created"