+++ 
draft = false
date = 2020-04-12T20:09:21+09:00
title = "[JP] Java 101"
slug = "java-101" 
isCJKLanguage = true
tags = ["cjk"]
+++

今更Javaについて書くのもどうかと思うけれど、あらためて知識をまとめておきたいと思ったので、
[IntelliJ Idea](https://www.jetbrains.com/idea/)でJavaを始めるに当たって、知っておいたほうがよさそうなことを書いていきます。
個人的なまとめノートです。

## Javaをインストールする際に気を付けること

現在、OracleJDKを使う場合、無償利用は**個人利用、開発用途のみ**となっています。
勉強用にJavaを使うには一向に気にする必要はないのですが、プロダクションでJavaを使おうと思っている人は有償になるので、注意が必要です。

様々なバイナリーが提供されており、かつ様々なベンダーが有償サポートを提供しており、Java界隈、お金の匂いがすごい。笑
ちょっと調べてみた限り、どれがベストかはよくわからなかったのですが、お金を気にせず使うという点では、**AdoptOpenJDK(HotSpot)** のLTSを選んでおけば、大丈夫そうです。
よほどのエンタープライズ環境でもない限り、または自力で問題解決できるのであれば、ずっと無償で使っていくことができます。

サポート期間（バグ修正など）がどこまで続くかは以下で確認してください。

https://adoptopenjdk.net/support.html

とはいえ、Swiftのように、オープンソースとはいえ、Appleにロックインしている言語で、face to faceでの対応を年一のWWDCでしか提供せず、しかも抽選かつ高額であるのに比べれば、有償サポートというのもユースケースによってはアリなのでしょう。Swiftはforumもありますが、ベストエフォートで回答がもらえるとは限らず、個別のケースに対応してもらうことはほぼ不可能です。(筆者はSwiftを普段メインで使っています)

## Javaを何に使うのか

まずは、アルゴリズムの勉強や、競プロなどに使おうと思っています。
また様々なライブラリ、アーキテクチャがJavaから生まれ、またFunctional Programmingといった従来のJavaにはなかったプログラミングパラダイムも取り入れられて、総合的にCSを勉強する題材としてはJavaはベストな選択肢かなと思います。
Go、Rustなどのように尖ってはいませんので、いまいちパッとしないイメージがありましたが、一周回って便利な言語です。

> ——最後に、きしださんの思う「Javaが持つ良さ」について教えてください。
>
> きしだ　Javaは全部ができる言語だということですね。デスクトップアプリも、サーバーサイドも、スマホアプリも、業務系のアプリもサービス系のアプリもできる。機械学習は、まだそんなに向いていないですけど、き> っと将来的にはもっと楽にできるようになる。Javaを習得することで、さまざまな領域に手を出せるのが利点だと思ってます。
>
> それから先ほども話に出たように、Javaは新しい要素技術にフィットしていこうとする努力を続けていますから、その流れに追従していくと自分自身が新しい技術を勉強するモチベーションになります。言語だけではく、ライブラリやフレームワーク、実行系も全部まとめてJavaなんです。守備範囲の広さが、Javaの一番いいところですよね。

(from: https://employment.en-japan.com/engineerhub/entry/2019/10/29/103000)

## main functionを作成する

Javaの特徴（？）にHello Worldまでが長いというのがあります。
Javaアプリケーションを動かすときはまず、`main` functionが必要です。
いつもコピペするのは面倒なので、main...と打ち始めることで自動的に関数を作成すると便利です。

https://www.jetbrains.com/help/idea/creating-and-running-your-first-java-application.html


## ビルドツールについて知る

以下のものが有名である。

- [ant](https://ant.apache.org/) + [ivy](https://ant.apache.org/ivy/)
- [maven](https://maven.apache.org/)
- [gradle](https://gradle.org/)

今からJavaで新しいプロジェクトを作成する際はほとんどが、gradleたまにmavenって感じだと思います。
gradle、mavenは普段から使っているので慣れていますが、antはほとんど使ったことがないです。今後も使うことはないでしょうが、少しまとめておきます。

### ant

今挙げた中では、もっとも古いビルドツールである。
[NetBeans](http://hg.netbeans.org/main/file/)ではいまだに使われていました（驚）。

Javaで書かれ、汎用ビルドツールとして作られたそうで、C言語のコンパイル等にも使用できるそうですが、実際に使われていることは見たことがありません。笑
独自の拡張(antlibs)を作り固有のタスクを追加していくことができるそうです。

タスクの定義には、`Makefile`の代わりに、`build.xml`というファイルを使用します。

ant自体にはモジュールの依存管理機能は含まれておりません。クラスパスにjarファイルを置くことで依存を追加できますが、自動的に管理するにはivyを導入します。

### ivy

依存管理ツール。mavenよりシンプルなxmlで依存管理を記述できる。antを補完する形で使うのが一般的のようです。

以下のような`ivy.xml`を作成します。

```
<ivy-module version="2.0">
    <info organisation="org.apache" module="hello-ivy"/>
    <dependencies>
        <dependency org="commons-lang" name="commons-lang" rev="2.0"/>
        <dependency org="commons-cli" name="commons-cli" rev="1.0"/>
    </dependencies>
</ivy-module>
```

build.xmlに以下を追記します。

```
<project xmlns:ivy="antlib:org.apache.ivy.ant" name="hello-ivy" default="run">

    ...

    <!-- =================================
          target: resolve
         ================================= -->
    <target name="resolve" description="--> retrieve dependencies with Ivy">
        <ivy:retrieve/>
    </target>
</project>
```

`ant`でビルドする際に、自動的に依存関係が解決されます。

開発当初は画期的だったことでしょう。。

## IntelliJに慣れよう

これはもう毎日開くしかないのですが、昨今（2020年4月現在、コロナウイルスという新型ウイルスが世界的に大流行しております）の在宅勤務の流れに乗って、わたくしも日々自宅で悶々と過ごしておりまして、余った時間でIntelliJを開いて何かしらのコードを書くようにしています。
個人的にJavaをテキストエディタで書くのはしんどいです（不可能ではないですが）。IntelliJのhot keyをマスターした方が、生産性ははるかに高いと思います。
とは言え、IDEと同等に近い機能は、LSPを実装した各種テキストエディタの拡張機能によって実現されていますので、以前よりやりやすくはなりました。

何はなくとも、黙ってコードを書くというのが一番大事な気がします。
とりあえず、[Effective Java](https://amzn.to/2RwEuol)を手元に置いて、頑張ります。