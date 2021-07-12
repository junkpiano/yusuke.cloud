+++ 
draft = false
date = 2021-07-12T17:04:09+09:00
title = "Hugoの多言語化対応"
description = ""
slug = ""
authors = ["大橋 佑亮"]
tags = []
categories = []
externalLink = ""
series = []
isCJKLanguage = true
+++

こんにちは、インターネット。

Hugoの多言語化が完了したので、ついに日本語でもブログが書きやすくなりました。{{< emoji ":sunglasses:" >}}

Hugoはそもそも多言語化に対応しているので簡単ではあるのですが、設定をいくつか増やす必要があります。

まずはブログのコンテンツを言語ごとに分けなくてはいけません。
やり方は二つあります。

- ファイル名を分ける
- フォルダを分ける

ファイル名を分ける方法だと、ファイルが多くなりすぎて管理が難しくなるので、フォルダを分けることにしました。

- content/english
- content/japanese

文字通り、英語と日本語のコンテンツを管理しています。
このような設定をconfig.tomlに入れました。

```toml
[languages.ja]
languageName = ":jp:"
contentDir = "content/japanese"
footercontent = "楽しんでいってね。"
```

（蛇足ですが、japaneseをjaと略すのがあまり好きではありません）

英語にも同様にcontentDirを追加します。

あとは、言語ごとにメニューの設定などを追加していく必要があります。
詳しくは[こちらのソースコード](https://github.com/junkpiano/yusuke.cloud/blob/master/config.toml)を見てもらえればわかるかと思います。若干冗長ではあります。{{< emoji ":sweat_smile:" >}}

ところで、Aboutってあえて日本語にすると難しいですね。「ブログについて」とか「プロフィール」とか考えたけど、「これは何？」っていうインターネットミームが一番しっくり来ました。別にふざけてるわけじゃありません。