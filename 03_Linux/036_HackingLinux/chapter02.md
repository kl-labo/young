# Chapter02

### Linux ネットワークコマンド

```
ifconfig

自分のipアドレスを調べる
```

```
ifconfig en0 192.168.1.5

自分のipアドレスを再割り当てする
en0：無線
eth0：有線
ipアドレスは希望数字
```

```
curl inet-ip.info

グローバルアドレスを調べる
★ルータ再起動で割当IPが変わる
```

```
ping yahoo.co.jp

ホストのipアドレスを調べる(接続確認)
★抜ける時は ctl+c
```

```
traceroute yahoo.co.jp

ホストまでの経路を調べる
```
