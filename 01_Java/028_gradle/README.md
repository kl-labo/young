# Gradleとは

GradleはGroovyによって記述されたビルドシステムです。  
GroovyはJava VM上で動作する動的なスクリプト言語で、
他のスクリプト言語と比較するとJavaとの親和性が高いことが特徴です。

# 今までのビルドツールとの違い

現在私がプロジェクトで利用しているビルドツールはMavenです。  
Antはbuild.xml、Mavenはpom.xmlでプロジェクトの依存関係を記述しますが、Gradleはbuild.gradleファイルにプロジェクトの依存関係を記述します。AntやMavenはXML形式で記述するのに対して、GradleはGroovyスクリプトを記述します。  
Groovy enVironment Manager(以下、GVM)を使えば、Gradle自体のインストールをコマンド一つでできたり設定が必要ないというのも、大きな違いだといえます。

# 実際にGradleを使うには

まずGradleのインストールが必要になりますが、インストール方法は以下の2パターンがあります。

1. Gradle公式サイトからダウンロードし、環境変数を通す
1. GVMをインストール後、コマンドでGradleをインストール

以下それぞれ詳細に記載していきます。

## Gradleのインストール ~方法1~

[Gradle公式サイト](http://www.gradle.org/ "Gradle公式サイト")からダウンロード。
AntやMavenと同じように任意の場所にダウンロードしたフォルダを配置し、
以下の環境パスを設定します。

|   環境変数   | パス                    |
|:------------:|:----------------------:|
| GRADLE_HOME  |    D:/gradle-2.7 ※1    |
|     path     | GRADLE_HOME/bin ※2     |

※1 Dドライブ直下に配置した場合

※2 環境変数pathに追記

## Gradleのインストール ~方法2~

Mac OSの方やLinux OSの方はこちらのほうが楽に設定できます。 Windowsの方はLinuxコマンドの実行環境を構築しないと、こちらの方法は利用できません。  
gvmをインストール方法ですが、以下のコマンドを実行を実行してください。

```
curl -s get.gvmtool.net | bash
```

gvmのインストールが完了したら、以下のコマンドを実行。

```
gvm install gradle 2.7
```

これでgradleのインストールが完了します。

# build.gradleの書き方について

私は現場で、Java言語でeclipseを利用して開発をしています。
そのため、例として上記2つの条件を盛り込んだbuild.gradleをもとに
書き方についてまとめます。  
以下がサンプルのbuild.gradleになります。


```
apply plugin: 'java'
apply plugin: 'eclipse'

repositories {
    jcenter()
}

dependencies {
    compile 'org.slf4j:slf4j-api:1.7.7'
    testCompile 'junit:junit:4.12'
}

task wrapper(type: Wrapper) {
    gradleVersion = '2.7'
}
```

## apply plugin

プラグインを適用するための記述です。

## repositories

ライブラリのダウンロードをするためのリポジトリを設定する記述です。  
基本的にはURLの指定が必要になりますが、一部のリポジトリのみ、例外的に
簡単に記述できるようになっています。

|      リポジトリ名       |       指定方法        |
|:--------------------:|:---------------------:|
| Maven Cenralリポジトリ  |    mavenCentral()    |
| JCenter Mavenリポジトリ |    jcenter()         |

## dependencies

ここで指定したバージョンのライブラリを、自動でダウンロードしてくれます。
compileとtestCompileの違いは以下のようになっています。

|  指定方法    |       指定するべきもの                 |
|:-----------:|:------------------------------------:|
| compile     |コードのコンパイルおよび実行に必要なライブラリ|
| testCompile |テストコードの実行に必要なライブラリ         |

また、ライブラリを指定するための書き方については下記サイトにも載っているので、<br>
必要なライブラリさえわかれば、調べることも可能です。

[JCenter Maven]( https://bintray.com/bintray/jcenter "JCenter Maven")  
[Maven Central](  http://search.maven.org/ "Maven Central")

# ビルドの実行

ここまでできれば、あとは簡単。
以下のコマンドを実行すれば、ビルドを実行してくれます。

```
gradle build
```

# 既存のビルドツールからの移行

さて、ある程度書き方はわかりましたが、最初からgradleを導入するのと
既存で別のビルドツールを利用していて移行するのでは、また勝手が違ってきます。
みんなで足並みをそろえて、さあ移行しようというのは中々難しいです。
そんな悩みをgradleでは解決する方法があるのです！  
私の場合、現場ではMavenを利用しています。実は**既存のMaven PluginはGradleと互換性がない**ため、既存の資産は使うことができません。ですが1人が設定すれば、あとはみんな使えるっていうのはかなり便利です。  
調べてみると、やり方もすごく簡単でした。
build.gradleにwrapperというタスクを追加し、以下のコマンドを実行。(記述の詳細は別ファイル参照)

```
gradle wrapper
```

そうするとgradlew、gradlew.batというファイルとgradle用のフォルダが出来上がります。
他のひとはWindows環境の場合には上記のバッチファイル、MacやLinuxの環境ではgradlewを実行するだけで、gradleコマンドを実行する必要はありません。
これだけでもかなり移行のハードルが下がりますし、個人的にはすぐやってみたいですね。

# Gradleを調べてみて

build.gradleはpom.xmlに比べて見やすいし、書きやすそうだなと思う反面、
あくまでビルドツールのための記述なので、pom.xmlを書いた経験が少ない人には少しハードルが高いなと感じました。ただ、1人がgradle環境を構築すれば横展開できることはかなりのメリットだと思います。
せっかく勉強したので、空きの時間にでも現場のpom.xmlをbuild.gradleに書き換えてみるなどして、知識を増やしていこうと思います。
