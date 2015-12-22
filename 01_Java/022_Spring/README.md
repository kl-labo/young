# 022_Spring

## 作成したもの

SpringBootおさらいアプリケーション

## プロジェクトのcloneからcheckoutまで

```
git clone https://github.com/shioriwest/young.git
git branch -t 022_Spring origin/022_Spring
git checkout 022_Spring
```

## プロジェクト起動方法

1. コマンドラインで01_Java->022_Spring->springsampleフォルダに移動
2. gradle cleanEclipse eclipse を実行
※環境変数にGradleを通しておいてください。
3. Eclipseでspringsampleフォルダをインポート
Import->Existing Projects into Workspace
4. サーバーに乗せて起動
※サーバーに乗せて起動した時にうまく起動できないことがあります…
　その時は再度ビルドした後プロジェクトをリフレッシュ、サーバーを再起動してください。
5.  http://localhost:8080/springsample/ にアクセス

> Tomcat v8.0.15ではなぜか動きませんでした。v8.0.28だと動作しました。 - murayama。

## この課題を選択した理由

- SpringMVCの復習
- Javaプロジェクト構築の復習

## 使用したフレームワーク・ツール等

- 言語
  - Java
  - JSP
- フレームワーク・API
  - Spring Framework 4
  - Log4j
- ソース管理ツール
    - Git
- ビルドツール
   - Gradle2.6

## 使用したSpringモジュール

- MVC
- AOP

## 作成したドキュメント

- [Springとは](./Springとは.md)
- [まとめ](./まとめ.md)
