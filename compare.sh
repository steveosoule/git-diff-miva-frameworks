#!/bin/sh

# ------------------------
# Framework Diffs
#
# Usage:
# In a terminal just run the command:
#
# sh compare.sh framework-a.pkg framework-b.pkg
#
# ------------------------


echo ":-) Cleaning up last run (if any)..."
rm -rf ./git

echo ":-) Extracting framework-a framework pgk: $1..."
rm -rf ./framework-a
mkdir framework-a
tar -vxjf $1 -C framework-a


echo ":-) Extracting framework-b framework pgk $2..."
rm -rf ./framework-b
mkdir framework-b
tar -vxjf $2 -C framework-b


echo ":-) Preparing git repo..."
mkdir git


echo ":-)  Creating git README.md file..."
echo "# Framework Diff $1 vs. $2" > git/README.md


echo ":-) Initializing git repo"
cd git
git init
git checkout -b master
git add .
git commit -m "initial commit"


echo ":-) Creating framework-a framework branch..."
git checkout -b framework-a
git checkout framework-a
cd ../
cp -R framework-a/. git/
cd git
git add .
git commit -m "commiting framework-a framework files"


echo ":-) Creating framework-b framework branch..."
git checkout master
git checkout -b framework-b
cd ../
cp -R framework-b/. git/
cd git
git add .
git commit -m "commiting framework-b framework files"


echo ':-) framework-bing gitk...

1. Select the "framework-b" branch
2. Then right-click on the "framework-a" branch
3. Select, "Diff this -> selected"
4. Thats it! Compare the differences.

You can also close gitk and open the repo in another program (SourceTee, GitKraken, GitHub, etc.)'
git checkout master
gitk framework-a framework-b