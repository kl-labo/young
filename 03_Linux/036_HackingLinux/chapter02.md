# Chapter02

### Linux ネットワークコマンド

自分のipアドレスを調べる

```
ifconfig
```

自分のipアドレスを再割り当てする

+ en0：無線
+ eth0：有線
+ ipアドレスは希望数字

```
ifconfig en0 192.168.1.5
```

グローバルアドレスを調べる（ルータ再起動で割当IPが変わる）。

```
curl inet-ip.info
```

ホストのipアドレスを調べる。処理を終える時は ctl+c

```
ping yahoo.co.jp
```

ホストまでの経路を調べる

```
traceroute yahoo.co.jp
```
