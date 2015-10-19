

#if
if [ 条件 ]; then
  処理1
fi


#if-else
if [ 条件 ]; then
　処理1
else
  処理2
fi


#if-elif-else
if [ 条件1 ]; then
  処理1
elif [ 条件2 ]; then
  処理2
else
  処理3
fi


#case文
case 値 in
  パターン1 ) 処理1 ;;
  パターン2 ) 処理2 ;;
  パターン3 ) 処理3 ;;
  ・・・
  パターンn ) 処理n ;;
esac



#for文
for 繰り返し条件; do
  処理
done

#繰り返し条件の指定の仕方
#初期値・ループ条件・ループ時の処理
for ((初期値; ループ条件; ループ時の処理)); do
　　処理
done


#in句
for 変数 in 値のリスト; do
    # ...
done



#while文
while 条件式 do
  処理
done
