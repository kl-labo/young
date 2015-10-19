#!/bin/bash

a=`expr 1 + 1`

#等しい
if [ "$a" -eq 2 ]; then
  echo "変数aは2と等しいよ"
fi

#等しくない
if [ "$a" -ne 1 ]; then
 echo "変数aは2と等しくないよ"
fi

#より大きい
if [ "$a" -gt 1 ]; then
 echo "変数aは1より大きいよ"
fi

#より小さい
if [ "$a" -lt 3 ]; then
 echo "変数aは2より小さいよ"
fi

#以上(等しいも含むため、あえて同一の値で)
if [ "$a" -ge 2 ]; then
 echo "変数aは2以上だよ"
fi

#以下(等しいも含むため、あえて同一の値で)
if [ "$a" -le 2 ]; then
 echo "変数aは2以下だよ"
fi
