# Chapter01

### Linux基本コマンド

カレントディレクトリを移動する

```
cd
```

新しいファイルを作成する

```
touch newfile.txt
```

/rootディレクトリにnewfile.txtをコピーする

```
cp newfile.txt /root
```

コマンドの詳細を教えてくれる

```
man XXXX
```

オプションを表示する

```
XXXX --help
```

ファイルを移動する

```
mv newfile.txt Desctop/LinuxFolder
```

ファイルの内容を表示する

```
cat newfile.txt
```

ファイルの先頭行を表示する（指定なしなら10行）

```
head -30 newfile.txt
```

ファイルの後行を表示する（指定なしなら10行）

```
tail -30 newfile.txt
```

トップページからEnter（1行）、Space（1ページ）単位でスクロールする

```
more newfile.txt
```

more + /XXXX　で検索機能がついている

```
less newfile.txt
```

カレントディレクトリ、または指定ディレクトリ内を検索する

```
find linuxTest/ -name "te*"
```

指定したソースを探し、フルパスで返す

```
which ls
```

指定したソース、バイナリおよびマニュアルページのすべてを検索し、フルパスで返す

```
whereis ls
```
