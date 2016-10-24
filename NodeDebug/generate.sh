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

cat ../NodeBase/entry_point.sh \
  | sed 's/^xvfb-run/sudo -E -i -u seluser \\\
  DISPLAY=$DISPLAY \\\
  xvfb-run/' \
  | sed 's/^wait \$NODE_PID/for i in $(seq 1 10)\
do\
  xdpyinfo -display $DISPLAY >\/dev\/null 2>\&1\
  if [ $? -eq 0 ]; then\
    break\
  fi\
  echo Waiting xvfb...\
  sleep 0.5\
done\
\
fluxbox -display $DISPLAY \&\
\
x11vnc -forever -usepw -shared -rfbport 5900 -display $DISPLAY \&\
\
wait \$NODE_PID/' \
  > $FOLDER/entry_point.sh

cat ./README.template.md \
  | sed "s/##BROWSER##/$BROWSER/" \
  | sed "s/##BASE##/$BASE/" \
  | sed "s/##FOLDER##/$1/" > $FOLDER/README.md

cp ./README-short.txt $FOLDER/README-short.txt
