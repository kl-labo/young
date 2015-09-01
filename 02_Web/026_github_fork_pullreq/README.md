# GitHub入門

# はじめてのブランチ

GitHubというよりGitの話ですが、Gitにはブランチという仕組みがあります。ブランチ（branch）とは枝という意味で、作業目的に沿って作成します。ブランチの中では独自のコミットログが記録されるので、Aブランチで機能追加しつつ、Bブランチで緊急のバグフィックスをする、みたいなことができます。

> Gitにはデフォルトでmasterブランチが存在します。

## ブランチの確認

ローカルのブランチを確認してみましょう。

    $ git branch

## ブランチの作成と切り替え

新規ブランチを作るには次のコマンドを入力します。ここでは001-lsgというブランチを作成します。

    $ git branch 001-lsg

> git branchで確認してみましょう。


ブランチを切り替えるには次のコマンドを入力します。ここではmasterブランチから001-lsgブランチに切り替えます。

    $ git checkout 001-lsg


ブランチの作成と切り替えをまとめて、次のように実行できます。

    $ git checkout -b 001-lsg

## ブランチのマージ

現在のブランチ(001-lsg)に対して、コミットしておきましょう。

    $ echo hello > hello.txt
    $ git add .
    $ git commit -m "add hello.txt"


以上で001-lsgブランチに更新が記録されました。git logを見ておきましょう。

    $ git log

> コミットログ"add hello.txt"を確認しておきましょう。


続いて001-lsgへの更新をmasterブランチにマージしてみましょう。

まずmasterブランチをチェックアウトします。

    $ git checkout master

先にmasterブランチの更新履歴を確認しておきましょう。

    $ git log

> なんとコミットログ"add hello.txt"がないですね。よく見るとhello.txtファイルも存在しないはずです。

次のコマンドを実行して001-lsgブランチをマージします。

    $ git merge 001-lsg


再びmasterブランチの更新履歴を確認しておきましょう。

        $ git log

> コミットログ"add hello.txt"を確認できればOKです。


# はじめてのフォーク

Gitにはフォーク（fork）という仕組みはありません。フォークはGitHubによって提供される仕組みです。

GitHubではフォークという仕組みを使って、他者のリポジトリの複製を簡単に作れるようになっています。細かいことを言うと、git cloneを使えばリポジトリの複製はできるのですが、この場合はローカルマシン上にリポジトリを複製してしまいます。それに対してフォークを使えば、GitHub上にリポジトリを作成することができます。

フォークして何が嬉しいのかというと、自分のGitHubアカウント上で他者のコード（あるいはドキュメントなども含む）を自由に改変することができます。また改変した内容をフォーク元の開発者に対して通知することができます。この仕組みをGitHubではプルリクエスト（Pull Request）と呼んでいます。プルリクエストはオープンソースの開発で頻繁に利用されています。

## フォークする

以下のURLにアクセスしてForkボタンをクリックします。

https://github.com/kl-labo/young

これで自分のGitHubアカウント上にリポジトリが複製されます。


## コードを改変する

いつもどおりローカルマシン上にクローンします。クローン元のリポジトリは先ほどフォークしたリポジトリを指定します。つまり自分のアカウント内のリポジトリです。

    $ git clone https://github.com/murayama333/young.git

適当にプロジェクトを更新してみましょう。まずブランチを作ります。

    $ cd young
    $ git checkout -b 001-murayama

> ここ大事です。必ずブランチをつくりましょう。

それから更新データ（ファイル）を作ります。

    $ echo murayama > murayama.txt
    $ git add .
    $ git commit -m "add murayama.txt"

GitHub上にPUSHします。origin masterじゃないので気をつけて。

    $ git push origin 001-murayama

OK、GitHubに行ってみましょう。

すると次のようなメッセージが。

<img src="https://dl.dropboxusercontent.com/u/141509/github1.png" height="600px">

プルリクエストしてみましょう。レビュー依頼のコメントを入力します。

<img src="https://dl.dropboxusercontent.com/u/141509/github2.png" height="600px">

以上でプルリクエストは完了です。フォーク元の開発者にプルリクエストが送られるので、内容がレビューされて、問題なければマージされます。

## 参考 プルリクエストの流れ

<img src="https://dl.dropboxusercontent.com/u/141509/github3.png" height="600px">
