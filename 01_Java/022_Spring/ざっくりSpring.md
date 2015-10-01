# Springとは

## ざっくり概要
**Spring Framework** は、Javaプラットフォーム向けのオープンソースアプリケーションフレームワークである。<br/>
一貫したモデルを提供し、そのモデルをJavaプラットフォーム上で作成される様々なアプリケーションに適用することができる。

## ざっくりもじゅーる
Spring Framework は、様々なサービスを提供する幾つかのモジュールから構成されている。<br/>
今回のプロジェクト構築で使用したモジュールは以下の２つ。

- AOPモジュール<br/>
アスペクト指向プログラミングフレームワーク。<br/>
AspectJ のアスペクトをコンテナ内で構成できる。

- MVCモジュール<br/>
Model-View-Controller フレームワーク。<br/>
注目すべきインターセプターとして以下のものが例にあげられる。
  - HandlerMapping
  - ViewResolver
  - HandlerInterceptor

## ざっくりSpringが選ばれる理由
一つ例として挙げられる点が
#### 他のオープンソースソフトウェアとの連携に優れている

という点である。<br/>
SpringはHibernate・ Struts・Velocity・FreeMarkerなどの外部のオープンソースソフトウェアとの連携に非常に優れている。<br/>
例えばアプリケーションの出力先として、 HTML(JSP・Velocity・FreeMarker)XML（XLST）・Excel・PDFなどを選ぶことができる。<br/>

また、データベースのアクセスライブラリとしては、HibernateやJDO、Oracle TopLinkなどを選択することができる。

Springをフレームワークとして採用しておけば、将来新しい技術やライブラリが登場してもアプリケーションの本体部分を変更することなく、 出力部分のライブラリだけを差し替えることにより簡単に対応できるということが期待できる。
