+++ 
draft = false
date = 2021-06-18T17:04:24+09:00
title = "Make Comment Great Again"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

I haven't use comment feature on this weblog, but I really wanted to implement it.
I have tried [Disqus](https://disqus.com/). It was cool but it turned out that it didn't match my needs.

## Thought of Disqus

Disqus has rich UI and features to discuss blog posts, but it allows

- anonymous comments
- Ads inclusion

For anonymous comments, my blog thanksfully has almost no comments from readers. However, recently a lot of celebrities receive relentless shitty comments, and ended up suffering from mental disorder. No one tells that this won't happen on this tiny personal blog.

Ads inclusion means disqus is tracking user information. I don't want to make my readers concerned about security matters.

## Moving onto utterances

Then I decided to use [utterances](https://utteranc.es).
utterances is made on top of github issue API, since comments are stored in individual github issues.

Utterances is listing their main features following

    Open source. 🙌
    No tracking, no ads, always free. 📡🚫
    No lock-in. All data stored in GitHub issues. 🔓
    Styled with Primer, the css toolkit that powers GitHub. 💅
    Dark theme. 🌘
    Lightweight. Vanilla TypeScript. No font downloads, JavaScript frameworks or polyfills for evergreen browsers. 🐦🌲

it sounds nice, right?

You are required to be authenticated with Github[^1], but it's because guest commenting isn't allowed in github issue.

I am hosting my weblog on my private [cloud](https://www.linode.com/?r=5f4b41dbdb0e009af64882ea35ee82ecf0ef0290) whereas code is stored in [github](https://github.com/junkpiano/yusuke.cloud). Managing comments on issue makes more sense for me.

## Implement utteraces

Here I will describe how I implemented for hugo blog.
That said, in my case, it needs no more that a few lines.

I just added these lines to your `config.toml`.

```toml
[params.utterances]
    repo = "junkpiano/yusuke.cloud"
    issueTerm = "pathname"
```

Note that it depends on your blog [theme](https://themes.gohugo.io/). Different themes have different configs. You want to refer to README of your theme.

After you complete filling up config file, you try running your blog

```bash
hugo serve -D # -D option includes draft posts. Remove it if you don't need it.
```

Then, you will see comment form at the bottom of your blog posts.

## Wrap up

Now that I can receive your comments, Say hello to me below!

[^1]: If you are ignorant of [Github](https://github.com/), Github is the platform for developers to store programming source code and share it with other developers. Also please check this github guide out. [Mastering issues](https://guides.github.com/features/issues/).


