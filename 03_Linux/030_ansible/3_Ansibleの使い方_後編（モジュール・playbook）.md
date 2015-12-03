# Ansibleの使い方 後編
ここではモジュールやplaybookについて説明します。

## モジュール
[Ansibleの使い方-前編](./Ansibleの使い方-前編（インストール・構成要素・inventory）.md)で述べたように、モジュールとはホストに対し実行する処理のことです。

標準で使用できるモジュールのうち、代表的なものをいくつか挙げます。

| モジュール名     | 説明                                     |
|------------|----------------------------------------|
| file       | ファイルやシンボリックリンク、ディレクトリの作成・削除、パーミッションの設定 |
| copy       | ローカルからリモートへファイルをコピー                    |
| template   | ローカルのテンプレートファイルを使ってリモートにファイルを生成        |
| file       | ファイルやディレクトリの作成、パーミッション                 |
| command    | 任意のコマンドを実行                             |
| shell      | シェル上でコマンドを実行（パイプやリダイレクトが使用できる）         |
| script     | ローカルのシェルスクリプトをリモートで実行|
| service    | サービスの開始・停止                             |
| get_url    | 指定URLからダウンロード                          |
| yum        | Yumを使ってソフトウェアをインストール                   |
| apt        | Aptを使ってソフトウェアをインストール                   |
| lineinfile | 指定ファイルの行単位の書き換え                        |

モジュールにはオプションを指定することもできます。たとえばcopyモジュールには、コピー元を指定するsrcオプションやコピー先を指定するdestオプションがあります。

具体的な実行方法は、単独で実行する場合とplaybookを介して実行する場合で異なるので、それぞれ後述します。

## 単独で実行する
ansibleコマンドを使って、モジュールを単独で実行することができます。任意のコマンドを実行するcommandモジュールで、管理対象のホスト上でunameコマンドを実行してみましょう。

```

$ ansible all -m command -a "uname"
web1 | success | rc=0 >>
Linux

web2 | success | rc=0 >>
Linux

```

上記の例において、ansibleコマンドの引数の all はinventoryファイルに記述されたすべてのホストに対して実行することを示します(グループ名やホスト名を指定することもできます)。また、 -m オプションでcommandモジュールを指定しています。その後ろの -a オプションでモジュールの引数、ここではcommandモジュールに実行させるunameコマンドを指定しています。


## playbook
Ansibleで構成管理を行う場合、その中核となるのがサーバーの構成の内容を記述するplaybookです。

### YAML
playbookはYAML形式で記述します。

YAMLではシーケンス（配列）とマッピング（辞書）の組み合わせで、データ構造を表現します。

YAMLの記法について、playbookの記述に最低限必要な点に絞って説明します。

#### YAMLの記述の開始
ファイルの先頭に "---" を記述することで、YAMLファイルであることを示します。
```YAML

---

```

#### シーケンス
行頭に "- "をつけることでシーケンスの構造を表現します。"-"の後には半角スペースが必要です。

```YAML

- Java
- Web
- Linux

```

次の形式で1行で書くこともできます。

```YAML

[Java, Web, Linux]

```

#### マッピング
"キー: 値"の形式でマッピングの構造を表現します。":"の後には半角スペースが必要です。

```YAML

Google: Android
Apple: iOS
Microsoft: Windows

```

次の形式で1行で書けます。

```YAML

{Google: Android, Apple: iOS, Microsoft: Windows}

```

#### コメント
"#"以降がコメントになります。行の途中からコメントにすることも可能です。

```YAML

# コメント
- A
- B #コメント

```

#### 階層構造
半角スペースによるインデントで階層構造（ネスト）を表現します。スペースの代わりにタブ文字を使用することはできません。スペース2つでインデントすることが多いようです。

まずはシーケンスのネストです。

```YAML

- A
-
  - bb1
  - bb2

```

マッピングのネストです。

```YAML

A: aa
B:
  B1: bb1
  B2: bb2

```

シーケンスにマッピングをネスト、またはマッピングにシーケンスをネストすることもできます。

```YAML

# シーケンスにマッピングをネスト
- name:  Bob
  skill: Java
- name:  Mary
  skill: PHP

# マッピングにシーケンスをネスト
Java:
  - Spring
  - Play
PHP:
  - Laravel
  - CakePHP

```

### playbookの書き方

それではApacheのインストールを行う場合を例に、実際のplaybookの書き方を見ていきましょう。

playbookは任意のファイル名で作成することができます。
ここではweb.ymlという名前で、以下の様なplaybookを作りました。

```YAML

---

- hosts: web            # inventoryファイルに記述したwebグループのホストが対象
  remote_user: vagrant  # 実行ユーザー
  sudo: yes             # sudoで実行する
  vars:                 # 変数を宣言する
    httpd_port: 80/tcp

  tasks:                # ホストに対して実行する処理(=モジュール)を列挙する
    - name: ApacheをYumでインストールする # タスク名
      yum: name=httpd state=present       # 実行するモジュール

    - name: Apacheのサービスを開始する
      service: name=httpd state=started enabled=yes

    - name: Apacheのポートをファイアウォールで許可
      firewalld: permanent=True port={{ httpd_port }} state=enabled
      notify: ファイアウォールを再起動    # ハンドラを実行するトリガー

  handlers:                               # notifyによって起動されるハンドラ
    - name: ファイアウォールを再起動
      service: name=firewalld state=restarted

```

#### 対象ホストに関する設定
まず対象ホストや実行ユーザー、sudoで実行するかどうかといった、対象ホストに関する設定をしています。

hosts に指定する値はinventoryファイルに記述しているグループ名やホスト名です。

```YAML

- hosts: web
  remote_user: vagrant
  sudo: yes

```

#### 変数の使用
vars のセクションでは任意の変数を宣言します。ここでは httpd_port という変数を宣言しています。

変数を使用するときは {{ 変数名 }} という形式で使用します。

```YAML

vars:
  httpd_port: 80/tcp

    # 変数を使用している箇所
      firewalld: permanent=True port={{ httpd_port }} state=enabled

```

#### タスク
tasks のセクションでホストに対し実行する処理をシーケンスで列挙していきます。
それぞれのタスクは、マッピングによってタスク名や実行するモジュールを記述します。

タスクの name キーでタスクの名前を定義します。日本語で記述することも可能です。日本語で記述すると、
playbookはサーバの構成を確認する際に読みやすいドキュメントとなるでしょう。

実行するモジュールはマッピングのキーとして記述します。値にはモジュールのオプションを指定します。
以下の場合は、yumモジュールでhttpd(Apache)をインストールしています。

```YAML

  tasks:
    - name: ApacheをYumでインストールする
      yum: name=httpd state=present

```

#### ハンドラ
あるタスクでホストの状態が変わった場合のみ処理を実行したいときは、ハンドラを使用します。

ハンドラは handlers セクションに記述します。
記述方法は通常のタスクと同じです。

タスクに notify が記述されている場合、タスクによってホストの状態が変わると、 notify に指定されているハンドラが実行されます。

下記の場合は、ファイアウォールの設定が変更された場合のみファイアウォールを再起動しています。

```YAML

  tasks:
    - name: Apacheのポートをファイアウォールで許可
      firewalld: permanent=True port={{ httpd_port }} state=enabled
      notify: ファイアウォールを再起動

  handlers:
    - name: ファイアウォールを再起動
      service: name=firewalld state=restarted

```


### playbookの内容を実行する
playbookに記述した内容をホストに反映するには、ansible-playbook コマンドを実行します。

```bash

$ ansible-playbook web.yml

PLAY [web] ********************************************************************

GATHERING FACTS ***************************************************************
ok: [web1]
ok: [web2]

TASK: [ApacheをYumでインストールする] *******************************
changed: [web1]
changed: [web2]

TASK: [Apacheのサービスを開始する] **********************************
changed: [web2]
changed: [web1]

TASK: [Apacheのポートをファイアウォールで許可] ****************
changed: [web1]
changed: [web2]

NOTIFIED: [ファイアウォールを再起動] ******************************
changed: [web1]
changed: [web2]

PLAY RECAP ********************************************************************
web1                       : ok=5    changed=4    unreachable=0    failed=0   
web2                       : ok=5    changed=4    unreachable=0    failed=0

```

出力結果から、playbookに記述したタスクが実行され、ホストの状態が変更されていることがわかります。


### 冪等性
playbookの実行によって、対象ホストにはApacheがインストールされました。
ではここでもう一度playbookを実行するとどうなるのでしょう?

結果は次のようになります。

```bash

$ ansible-playbook web.yml

PLAY [web] ********************************************************************

GATHERING FACTS ***************************************************************
ok: [web2]
ok: [web1]

TASK: [ApacheをYumでインストールする] *******************************
ok: [web1]
ok: [web2]

TASK: [Apacheのサービスを開始する] **********************************
ok: [web2]
ok: [web1]

TASK: [Apacheのポートをファイアウォールで許可] ****************
ok: [web1]
ok: [web2]

PLAY RECAP ********************************************************************
web1                       : ok=4    changed=0    unreachable=0    failed=0   
web2                       : ok=4    changed=0    unreachable=0    failed=0

```

各タスクで ok と出力されて成功しているようですが、一度目に実行したときのようなchangedの出力がありません。
すでにApacheはインストールされサービスも開始されているので、実際には何も行わなかったのです。
これは再度playbookを実行しても、ホストの状態は変わっていないと言い換えることができます。

このように、何度実行しても同じ結果（状態）に収束することを、冪等（べきとう）性と言います。
この冪等性があるため、playbookは常にサーバの構成そのものを表すのです。
