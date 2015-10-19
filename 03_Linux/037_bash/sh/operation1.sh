#!/bin/bash

#足し算
add=`expr 1 + 1`
echo "1 + 1 = $add"

#引き算
sub=`expr 3 - 1`
echo "3 - 1 = $sub"

#掛け算
mul=`expr 2 \* 3`
echo "2 * 3 = $mul"

#割り算
div=`expr 6 / 3`
echo "6 / 3 = $div"

#余り
tom=`expr 5 % 3`
echo "5 % 3 = $tom"
