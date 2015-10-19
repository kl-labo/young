#!/bin/sh

val1=3;
val2=5;

#論理積
if [ "$val1" -gt 2 -a "$val2" -gt 2 ]; then
  echo "変数val1、変数val2は2より大きいです。"
fi

#論理和
if [ "$val1" -gt 4 -o "$val2" -gt 4 ]; then
  echo "変数val1は4より小さいが、変数val2は4より大きい"
fi

