## Gradleとは

GradleはGroovyによって記述されたビルドシステムです。  
GroovyはJava VM上で動作する動的なスクリプト言語で、
他のスクリプト言語と比較するとJavaとの親和性が高いことが特徴です。

## 今までのビルドツールとの違い

現在私がプロジェクトで利用しているビルドツールはMavenです。  
Antはbuild.xml、Mavenはpom.xmlでプロジェクトの依存関係を記述しますが、Gradleはbuild.gradleファイルにプロジェクトの依存関係を記述します。AntやMavenはXML形式で記述するのに対して、GradleはGroovyスクリプトを記述します。  
Groovy enVironment Manager(以下、GVM)を使えば、Gradle自体のインストールをコマンド一つでできたり設定が必要ないというのも、大きな違いだといえます。

## 実際にGradleを使うには

まずGradleのインストールが必要になりますが、インストール方法は以下の2パターンがあります。

1. Gradle公式サイトからダウンロードし、環境変数を通す
1. GVMをインストール後、コマンドでGradleをインストール

以下それぞれ詳細に記載していきます。

### Gradleのインストール ~方法1~

[Gradle公式サイト](http://www.gradle.org/ "Gradle公式サイト")からダウンロード。
AntやMavenと同じように任意の場所にダウンロードしたフォルダを配置し、
以下の環境パスを設定します。

|   環境変数   | パス                    |
|:------------:|:----------------------:|
| GRADLE_HOME  |    D:/gradle-2.7 ※1    |
|     path     | GRADLE_HOME/bin ※2     |

※1 Dドライブ直下に配置した場合

※2 環境変数pathに追記

### Gradleのインストール ~方法2~

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

## build.gradleの書き方について

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

```

### apply plugin

プラグインを適用するための記述です。

### repositories

ライブラリのダウンロードをするためのリポジトリを設定する記述です。  
基本的にはURLの指定が必要になりますが、一部のリポジトリのみ、例外的に
簡単に記述できるようになっています。

|      リポジトリ名       |       指定方法        |
|:--------------------:|:---------------------:|
| Maven Cenralリポジトリ  |    mavenCentral()    |
| JCenter Mavenリポジトリ |    jcenter()         |

### dependencies

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

## ビルドの実行

ここまでできれば、あとは簡単。
以下のコマンドを実行すれば、ビルドを実行してくれます。

```
gradle build
```

## 既存のビルドツールからの移行

さて、ある程度書き方はわかりましたが、最初からgradleを導入するのと
既存で別のビルドツールを利用していて移行するのでは、また勝手が違ってきます。
みんなで足並みをそろえて、さあ移行しようというのは中々難しいです。
そんな悩みをgradleでは解決する方法があるのです！  
以下に、Antからの移行、Mavenからの移行についてまとめます。

### Antからの移行方法

以下のようなbuild.xmlが書かれたsampleというプロジェクトがあるとします。

```
<project name="sample" default="jar" basedir=".">
  <!-- 必要なクラスパスを通す -->
  <path id="build.lib">
     <fileset dir="src/main/webapp/WEB-INF/lib" includes="*.jar" />
  </path>

  <!-- コンパイル設定 -->
  <target name="compile">
    <mkdir dir="target/classes"/>
    <javac classpathref="build.lib" srcdir="src/main/java" destdir="target/classes"
            encoding="utf-8"
            source="1.6"
            target="1.6"
            fork="true"  
            memorymaximumsize="256m"
            includeAntRuntime="false"
            debug="true"
            debuglevel="lines,vars,source"/>
  </target>

  <!-- ビルド成果物を毎回削除して再生成 -->
  <target name="clean">
     <delete dir="target" />
     <mkdir dir="target" />
  </target>
</project>
```

ではAntで行っていたビルドをGradleに実行させるにはどうしたらいいのか。  
build.gradleに以下のように記述するだけです。

```
ant.importBuild 'build.xml'
```

そのうえで以下のコマンドを実行すれば、Antタスクをgradleで扱えるようになります。

```
gradle clean compile
```

build.xmlは残ってしまうため完全な移行とは言えないですが、build.gradleでラップしているため、
あまりAntのことを意識しないで使用できるようになります。

### Mavenからの移行方法

私の場合、現場ではMavenを利用しています。ただ**既存のMaven PluginはGradleと互換性がない**ため、既存の資産は使うことができません。
Mavenからの移行は少々手間がかかります。

## gradle wrapper

Gradleにはgradle wrapperという仕組みが用意されていて、 こちらの仕組みを利用するとGradleを1人インストールすれば、他の人はgradle wrapperによって出来上がる成果物でGradleが使えるという優れモノです。
この仕組みを利用するには、build.gradleにwrapperというタスクを追加します。

```
task wrapper(type: Wrapper) {
    gradleVersion = '2.7'
}
```

その後で、以下のコマンドを実行します。

```
gradle wrapper
```

そうするとgradlew、gradlew.batとgradle用のフォルダが出来上がります。
他のひとはWindows環境の場合には上記のバッチファイル、MacやLinuxの環境ではgradlewを実行するだけで、gradleコマンドを実行する必要はありません。
Maven Pluginとの互換性がないのは痛手ですが、1人が設定すれば同じように使えるのは、
コストを払っても移行する価値があります。

## Gradleを調べてみて

build.gradleはpom.xmlに比べて見やすいし、書きやすそうだなと思う反面、
あくまでビルドツールのための記述なので、pom.xmlを書いた経験が少ない人には少しハードルが高いなと感じました。ただ、1人がgradle環境を構築すれば横展開できることはかなりのメリットだと思います。
せっかく勉強したので、空きの時間にでも現場のpom.xmlをbuild.gradleに書き換えてみるなどして、知識を増やしていこうと思います。
