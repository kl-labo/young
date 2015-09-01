# Gitの使い方

## Gitとは

Gitは分散型バージョン管理システムの一つです。

<img src="https://dl.dropboxusercontent.com/u/141509/git1.png" height="400px">

# Git体験ツアー

## はじめてのコミット

ここではローカルのGitリポジトリにファイルをコミットするところまでを体験します。

<img src="https://dl.dropboxusercontent.com/u/141509/git2.png" height="400px">


## Gitの初期設定

Gitコマンドで利用するアカウント情報を設定します。

    $ git config --global user.name "murayama333"
    $ git config --global user.email murayama333@gmail.com
    $ git config --global color.ui true

> 自分のアカウント名を入れてください。

次のコマンドでGitの設定情報を確認できます。

    $ git config --list


### Gitリポジトリの作成

任意のディレクトリに移動します。

    $ cd xxx

カレントディレクトリにGitリポジトリを作成します。

    $ git init

> git initコマンドによって、.gitディレクトリが作成されます。もし、Gitリポジトリを破棄したい場合は.gitディレクトリを削除すれば良いでしょう。

### ステージング

まずはバージョン管理対象となるファイルを作成しましょう。

    $ echo Hello > README.md

作成したファイルはGitのコントロール下に置かれます。次のコマンドを実行します。

    $ git status

> 赤色の文字（Untracked File）でREADME.mdが表示されます。

次に作成したファイルをステージングします。ステージングとはコミット対象のファイルを確定することです。

    $ git add README.md

> ここまでできたら、git statusコマンドで確認してみましょう。ファイル名が緑色で表示されるでしょう。

### コミット

ローカルリポジトリに更新を確定（コミット）する。

    $ git commit -m "add README.md"

コミット時にはコミットメッセージが必須です。-mオプションでコミットメッセージを指定します。

> ここまでできたら、git statusコマンドで確認してみましょう。コミットによって更新が確定したこと（更新がないこと）を確認します。

### ログの確認

ログを見てみましょう。

    $ git log
    commit 60f8a67bcc4fc6a766684546470acb6052271dee
    Author: murayama <murayama333@gmail.com>
    Date:   Mon Aug 24 15:14:53 2015 +0900

    add README.md

## はじめてのPUSH

ここではGitHub上に空のリポジトリ（murayama333/sample.git）が存在するものとします。

    $ git remote add origin https://github.com/murayama333/sample.git
    $ git push -u origin master


> これで自宅からCLONE（PULL）できます。

## 練習

次のHello.javaを作成してコミットしてください。それからPUSHしてみましょう。

```java
class Hello {
    public static void main(String[] args) {
        System.out.println("Hello World");
    }
}
```
