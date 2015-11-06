#!/bin/bash

num1=6;
num2=5;

total=`expr $num1 + $num2`

#if 〜 else if 〜 else 文
if [ "$total" -eq 10 ]; then
  echo "変数totalは10です。"

elif [ "$total" -gt 10 ]; then
  echo "変数totalは10より大きいです。"

else
  echo "変数totalは10より小さいです。"
fi
