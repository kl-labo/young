#!/bin/sh

list1="1"
list2="3"
list3="5"

# for(in句)
for i in "$list1" "$list2" "$list3"; do
  echo "$i"
done

