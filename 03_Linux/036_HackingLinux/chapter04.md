### Practice01


# **ping**

pingとは指定したターゲットホストがネットワーク上に存在するかを判定するコマンドです。  
>プロトコルは`ICMP`  
> ターゲットホストに``ICMPエコー要求メッセージ``（タイプ8）を送付し   
> ``ICMPエコー応答メッセージ``(タイプ0)が帰ってくれば到達可能となる

さっそくpingコマンドを実行してみましょう。  

```コマンド
$ ping -c 3 yahoo.co.jp

```

### -c　カウント  
ICMPエコー応答パケットをパケットで指定した数だけ送信する

```
PING yahoo.co.jp (182.22.59.229): 56 data bytes  
64 bytes from 182.22.59.229: icmp_seq=0 ttl=53   time=124.831 ms
64 bytes from 182.22.59.229: icmp_seq=1 ttl=53   time=49.173 ms
64 bytes from 182.22.59.229: icmp_seq=2 ttl=53   time=77.902 ms

--- yahoo.co.jp ping statistics ---
3 packets transmitted, 3 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 49.173/83.969/124.831/31.184 ms
```
- icmp_seq  ICMPヘッダに含まれるシーケンス番号を表します。エコー要求が送られるたびに増加します。  
- ttl TTL(Time To Live)パケット生存時間を表します。  
  実際には時間ではなくルータの中継回数という意味になります。  
  TTLは8ビットのため0〜255の値をとることができ、256個目のルーターは超えることができません。

### -i　ウェイト  
パケットを投げる間隔を設定できます。デフォルトは1秒。

```コマンド
$ ping -c 3 -i 0.1  yahoo.co.jp
```

```結果
PING yahoo.co.jp (183.79.135.206): 56 data bytes
64 bytes from 183.79.135.206: icmp_seq=0 ttl=52 time=60.914 ms
64 bytes from 183.79.135.206: icmp_seq=1 ttl=52 time=65.072 ms
64 bytes from 183.79.135.206: icmp_seq=2 ttl=52 time=59.962 ms

--- yahoo.co.jp ping statistics ---
3 packets transmitted, 3 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 59.962/61.983/65.072/2.219 ms
```

### -q　
途中の表示を簡潔にします。

```コマンド
$ ping -c 3 -q yahoo.co.jp
```

```結果
PING yahoo.co.jp (182.22.59.229): 56 data bytes

--- yahoo.co.jp ping statistics ---
3 packets transmitted, 3 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 42.317/56.154/71.100/11.777 ms
```

### -r　
pingパケットが通常の経路を通らず、直接接続されたネットワーク上のホストに対して送信されます。
ホストが直接接続されていなければエラーとなる。  
★エラーにならないよう同じネットワーク上にある携帯電話のIPを設定

```コマンド
$ ping -r 192.168.179.4
```

```結果
PING 192.168.179.4 (192.168.179.4): 56 data bytes
64 bytes from 192.168.179.4: icmp_seq=0 ttl=64 time=9.222 ms
64 bytes from 192.168.179.4: icmp_seq=1 ttl=64 time=4.329 ms
64 bytes from 192.168.179.4: icmp_seq=2 ttl=64 time=4.188 ms

--- 192.168.179.4 ping statistics ---
3 packets transmitted, 3 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 4.188/5.913/9.222/2.341 ms
```

### -s パケットサイズ
送信するパケットサイズを変更できる。デフォルトは56バイト+ICMPヘッダ8バイト  
100バイトとした場合

```コマンド
$ ping -s 100
```
```結果
PING yahoo.co.jp (183.79.135.206): 100 data bytes
108 bytes from 183.79.135.206: icmp_seq=0 ttl=52 time=67.294 ms
108 bytes from 183.79.135.206: icmp_seq=1 ttl=52 time=66.845 ms
108 bytes from 183.79.135.206: icmp_seq=2 ttl=52 time=64.915 ms

--- yahoo.co.jp ping statistics ---
3 packets transmitted, 3 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 64.915/66.351/67.294/1.032 ms
```
100バイトを指定した場合でも、受信時はICMPヘッダ8バイト分がプラスされ108バイトの応答となる。  
