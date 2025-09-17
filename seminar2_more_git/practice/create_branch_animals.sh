#!/bin/bash

mkdir branch_animals
cd branch_animals
git init
git branch -m main
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

commit_names_branch=("CE" "CF" "CG")
animals_branch=("emu" "fox" "giraffe")

git switch -c other HEAD~3
for i in {0..1}
do
    a=${animals_branch[i]}
    echo "I am $a" > $a.txt
    git add $a.txt
    git commit -m "${commit_names_branch[i]}: add $a.txt"
done

git switch main
echo "Branch animals repository created"

