# 022_Spring
## この課題を選択した理由
- SpringMVCの復習
- Javaプロジェクト構築の復習

## 使用したフレームワーク・ツール等
- 言語
  - Java
  - jsp
- フレームワーク・API
  - Spring Framework 4
  - log4j
- ソース管理ツール
    - Git
- ビルドツール
   - Gradle2.6

## 課題に取り組んでみて
cloneすればすぐに動かすことができるSpringのプロジェクトを作成しました。<br/>
MVCとAOPを使用しています。

MVCでよくわからなかった点は、viewsフォルダ内の拡張子をjsp以外のものにするとコントローラークラスから遷移してくれなくなることです。<br/>
application-configのviewResolverにhtmlを指定してるのに遷移してくれない。

サービスクラスのメソッドが呼ばれるとAOP（ロガー）が動くようになってます。

他にも時間あればExceptionHandllerとか実装しようと思っていたけど、とりあえず１ヶ月に一つあげとこうかなと思ったのでここで一度PUSHします。
