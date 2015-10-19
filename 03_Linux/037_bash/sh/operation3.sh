#!/bin/sh

str1=test1;
str2=;
str3=test2;
str4=test1;

#文字列の長さが0より大きい場合は真
if [ "$str1" ]; then
  echo "変数str1の文字列の長さは0より大きいです"
fi

#文字列の長さが0の場合は真
if [ !"$str2" ]; then
  echo "変数str2の文字列の長さは0です"
fi

#2つの文字列の値が同じ場合は真
if [ "$str1" = "$str4" ]; then
  echo "変数str1と変数str4は同じ値です"
fi

#2つの文字列の値が異なる場合は真
if [ "$str1" != "$str3" ]; then
  echo "変数str1と変数str3は同じ値ではありません"
fi

