#!/bin/bash
REPO=$1
FOLDER=../$2
BASE=$3
BROWSER=$4
VERSION=$5

rm -rf $FOLDER
mkdir -p $FOLDER

echo FROM $REPO/$BASE:$VERSION > $FOLDER/Dockerfile
cat ./Dockerfile >> $FOLDER/Dockerfile

cp ./entry_point.sh $FOLDER

BROWSER_LC=$(echo $BROWSER |  tr '[:upper:]' '[:lower:]')

cat ./README.template.md \
  | sed "s/##BROWSER##/$BROWSER/" \
  | sed "s/##BROWSER_LC##/$BROWSER_LC/" \
  | sed "s/##BASE##/$BASE/" \
  | sed "s/##FOLDER##/$1/" > $FOLDER/README.md


cat ./README-short.template.txt \
  | sed "s/##BROWSER##/$BROWSER/" > $FOLDER/README-short.txt
