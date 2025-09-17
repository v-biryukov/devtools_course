#!/bin/bash

mkdir animals
cd animals
git init
echo "## This is animals repository" > README.md
git add README.md
git commit -m "C0: initial commit"


commit_names=("CA" "CB" "CC" "CD")
animals=("axolotl" "bat" "cat" "dog")

for i in {0..3}
do
    a=${animals[i]}
    echo "I am $a" > $a.txt
    git add $a.txt
    git commit -m "${commit_names[i]}: add $a.txt"
done

echo "Animals repository created"

