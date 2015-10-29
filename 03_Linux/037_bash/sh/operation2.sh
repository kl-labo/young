#!/bin/bash

a=`expr 1 + 1`

#等しい
if [ "$a" -eq 2 ]; then
  echo "変数aは2と等しい"
fi

#等しくない
if [ "$a" -ne 1 ]; then
 echo "変数aは2と等しくない"
fi

#より大きい
if [ "$a" -gt 1 ]; then
 echo "変数aは1より大きい"
fi

#より小さい
if [ "$a" -lt 3 ]; then
 echo "変数aは2より小さい"
fi

#以上(等しいも含むため、あえて同一の値で)
if [ "$a" -ge 2 ]; then
 echo "変数aは2以上"
fi

#以下(等しいも含むため、あえて同一の値で)
if [ "$a" -le 2 ]; then
 echo "変数aは2以下"
fi
