# １章 Rubyの概要

この章ではRubyの概要を説明します。

## 1-1 Rubyとは

Rubyはシンプルな文法をもつ、オブジェクト指向をベースとしたオープンソースのプログラミング言語です。
特にテキスト処理能力などに優れています。
日本人のまつもとゆきひろ氏によって開発されました。

公式ドキュメント  
https://www.ruby-lang.org/ja/documentation/

コアリファレンス（英語）  
http://ruby-doc.org/core-2.2.0/

## 1-2 全てがオブジェクト  

Rubyの最もわかりやすい特徴として「全てがオブジェクト」という点が挙げられます。Javaのint型やboolean型のようなプリミティブ型はRubyには存在しません。1もtrueもnilもすべてオブジェクトです。そのため、数値やtrueのような値でもメソッドを呼び出すことが可能となります。実際に試してみましょう。

```ruby
p 'hello'.class        #String
p String.ancestors     #[String, Comparable, Object, Kernel, BasicObject]
p 10.class             #Fixnum
p Fixnum.ancestors     #[Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject]
p true.class           #TrueClass
p TrueClass.ancestors  #[TrueClass, Object, Kernel, BasicObject]
p nil.class            #NilClass
p NilClass.ancestors   #[NilClass, Object, Kernel, BasicObject]
```

>.classはクラス名を取得し、.ancestorsは継承しているクラスをすべて取得します。  
nilは存在しないという意味で、Javaにおけるnullにあたります。  

すべてのクラスがObjectを継承していることがわかります。  

## 1-3 いろいろなRuby実装

Rubyには複数の実装が存在します。そのため本家のRubyはMRI（Matz Ruby Inplements)と呼ばれています。  


|名前|概要|URL|
|--|--|--|
| JRuby | Javaで実装されたRubyでJavaのライブラリが使用可能。 | [http://jruby.org/](http://jruby.org/) |
| MacRuby | Mac上のCocoaフレームワークを利用できる。 | [http://www.macruby.org/](http://www.macruby.org/) |
| mruby | 軽量版Ruby。 | [https://github.com/mruby/mruby](https://github.com/mruby/mruby) |
