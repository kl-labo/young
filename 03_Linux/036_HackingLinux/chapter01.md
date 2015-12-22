# Chapter01

### Linux基本コマンド

```
cd

階層移動
```

```
touch newfile.txt

新しいファイルを作成する
```

```
cp newfile.txt /root

ルートディレクトリにnewfile.txtをコピーする
```

```
man XXXX

コマンドの詳細を教えてくれる
```

```
XXXX --help

オプションを教えてくれる
```

```
mv newfile.txt Desctop/LinuxFolder

オプションを教えてくれる
```

```
cat newfile.txt

ファイルの内容を表示する

```

```
head -30 newfile.txt

ファイルの先頭行を表示する（指定なしなら10行）
```

```
tail -30 newfile.txt

ファイルの後行を表示する（指定なしなら10行）
```



```
more newfile.txt

トップページからEnter（1行）、Space（1ページ）単位でスクロール
```

```
less newfile.txt

more + /XXXX　で検索機能がついている
```

```
find linuxTest/ -name "te*"

カレントディレクトリ、または指定ディレクトリ内を検索する
```

```
which ls

指定したソースを探し、フルパスで返す
```

```
whereis ls

指定したソース、バイナリおよびマニュアルページのすべてを検索し、フルパスで返す
```
