+++ 
draft = false
date = 2020-07-21T12:00:00+09:00
title = "自動投稿のテスト代わり"
slug = "" 
isCJKLanguage = true
+++

こんにちは。

Github Actionsを利用した自動投稿を設定したので、適当に書いてgit pushするだけになりました。
後は、コンパイルからデプロイまで全て自動でやってくれます。markdownを書くだけで良いのでエディターをローカルで立ち上げる必要もありません。

一つだけ、意味わからなかったのが、dokkuのgithub actionがaction中にコミットした分の反映をしてくれないので、2度git checkoutをしているところです([参考](https://github.com/junkpiano/yusuke.cloud/blob/master/.github/workflows/deploy.yml))。
かなり奇妙で気持ち悪いのですが、一応ワークアラウンドということでやっています。

多分、gitのdepthオプションについての理解が足らんのだと思われる。基本的な知識が抜けててお恥ずかしいです。{{< emoji ":sweat_smile:" >}}
