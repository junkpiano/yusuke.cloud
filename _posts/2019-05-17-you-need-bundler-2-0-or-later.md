---
layout: post
title: You need bundler 2.0 or later
date: 2019-05-17 12:58 +0900
---

I faced a deploy issue of this blog.

I am using Travis CI and Dokku to automate deployment. Both platforms are using the latest bundler(for now it's 2.0.1).
I've been using bundler `1.17.3`, since I don't need to upgrade it.

Since ruby `2.5.0`, bundler `> 2.0` is preferrable unless you have specific reasons, like you are working on Rails `> 4.2`. I recommend you to upgrade your infrastructures if you are managing them. Bundler checkes strictly the locked version, and if you are an older version of bundler, **it will fail to build**.

The current stable version of Ruby is `2.6.3` and it makes sense for you to use 2.5.0 or later. Along with that, check your bundler version, and if you are using `1.x`,

run this,

```
gem update --system
gem install bundler --no-document
gem cleanup # to uninstall older versions of Rubygems.
```

And the problem will be solved.