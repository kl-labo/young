# Ansibleの使い方 前編
ここではAnsibleのインストール方法や構成要素、inventoryファイルについて説明します。

## 前提
本稿では次の環境で動作検証を行っており、、この環境を前提に話を進めます。
* 管理端末
  + Mac OS X 10.10(Yosemite)
  + Ansible 1.9.4
* 管理対象ホスト
  + CentOS 7.0

また、事前準備として管理対象のホストに公開鍵認証でSSH接続できるようにしておきます（パスワード認証でも使用できますが、Macの場合はsshpassのインストールが必要です）。

また、管理対象ホストにはPython 2.6-2.7がインストールされている必要があります。

## インストール
管理する側の端末にAnsibleをインストールします。

MacではHomebrewでインストールできます。

```
$ brew install ansible
```

LinuxであればYumやAptでインストールできます。
詳細は
[公式サイト](http://docs.ansible.com/ansible/intro_installation.html "公式サイト")
を参照してください。

なお現時点（Ansible 1.9.4）で、Windowsへのインストールは公式にはサポートされていません。

## Ansibleの構成要素

### 設定ファイル
構成管理に必要な設定ファイルは、次の２つです。

+ inventory
+ playbook

inventoryファイルは管理対象のホストを記述するファイル、playbookは構成の内容を記述するファイルです。詳細については以降で説明していきます。

### モジュール
Ansibleでホストに対し実行する処理をモジュールと呼びます。ここでの「モジュール」という言葉は「コマンド」に近い意味になります。

モジュールは単独でも実行できますし、playbookでも処理の内容として指定します。
詳しくはplaybookの節で説明します。

## inventoryファイル
inventoryファイルはINI形式で対象のホストを記述します。

### 配置場所
inventoryファイルは、/etc/ansible/ 配下にhostsというファイル名で作成すると、Ansibleを実行する際に自動で読み込まれます。なおドキュメントに明記されていませんが、MacにHomebrewでインストールした場合は、/usr/local/etc/ansible/hostsがデフォルトのinventoryファイルになるようです。

また、inventoryファイルは任意の場所に任意のファイル名で配置することもできます。その場合はAnsible実行時にインベントリファイルを指定します。

### 基本的な書き方
まずは具体例を示します。

```
mail.example.com

[web]
192.168.33.10
192.168.33.11

[db]
db1.example.com
db2.example.com

```

上記のようにホスト名またはIPアドレスを指定します。

INIファイルのセクションにあたる [web] や [db] はグループを表します。グループは任意に指定できます。

### パラメータ
ホスト名の後に "パラメータ名=値" の形式で、パラメータを指定できます。次の例ではSSHのユーザーを指定しています。

```
[web]
web1.example.com ansible_ssh_user=vagrant
```

パラメータには次のようなものがあります。

<dl>
  <dt>ansible_ssh_port</dt>
  <dd>SSH接続に使用するポート</dd>

  <dt>ansible_ssh_private_key_file</dt>
  <dd>SSH接続に使用する秘密鍵</dd>

  <dt>ansible_shell_type</dt>
  <dd>管理対象ホストにおけるシェルの種類</dd>
</dl>

他のパラメータについては以下を参照してください。

[List of Behavioral Inventory Parameters](http://docs.ansible.com/ansible/intro_inventory.html#list-of-behavioral-inventory-parameters)

### グループの入れ子
グループを入れ子にする場合は、親グループ名に続けて :children を記述したセクションに、子グループ名を記述します。

```

[vagrant:children]
web
db

[web]
web1.example.com
web2.example.com

[db]
db1.example.com
db2.example.com

```

上記の例では、vagrantグループの子どもがwebグループとdbグループになります。


### グループに対するパラメータ
グループ単位でまとめてパラメータを指定することができます。
対象のグループ名に続けて :vars と記述したセクションに、別途グループに対するパラメータを指定します。

```

[web]
web1.example.com
web2.example.com

[web:vars]
ansible_ssh_user=vagrant

```
