#!/bin/sh

a=test2

#以下case文
case "$a" in
 "test1" ) echo "変数aの値はtest1です";;
 "test2" ) echo "変数aの値はtest2です";;
 "test3" ) echo "変数aの値はtest3です";;
esac
