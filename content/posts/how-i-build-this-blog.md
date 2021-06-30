+++ 
draft = false
date = 2021-06-30T15:49:42+09:00
title = "How I build this blog"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

This is a snapshot as of 2021/6. I will write about this blog.
This digram shows my blog architecture.

![diagram](https://cdn.yusuke.cloud/assets/image/blog_network_diagram.png)

## Core

- [**Linode**](https://www.linode.com/?r=5f4b41dbdb0e009af64882ea35ee82ecf0ef0290)
- [**Dokku**](https://dokku.com/)

I am running this blog on linode VPS. This blog is in a docker container and I am using dokku to manage containers(apps). Dokku is script based Paas and an OSS. Heroku buildpacks are compatible with Dokku since it's a heroku alternative. Thanksfully, you can run any applications on Dokku just by pushing your code.

*Cost: $10/month*

## CI/CD

- [**Github Actions**](https://github.com/features/actions)

As soon as I finish writing, I will push my posts to github.
Github Actions takes care of deployment. Before Github Actions, I used Werker before oracle acquired and Travis CI, and for sure Circle Ci for a short period.

*Cost: Free*

## Assets Management

- [**S3**](https://aws.amazon.com/s3/)
- [**CloudFront**](https://aws.amazon.com/cloudfront/)

I store images in AWS S3(Simple Storage Server) and serve them via AWS CloudFront.
I am wondering I write about this in a separate article. If you are familiar with AWS, you will grab everything in a second, however, if you don't have any experience with it like I didn’t before, you won't understand what is happening in a short description.

*Cost: $0.01/month(It depends on how popular this website is)*

## DNS

- [Cloudflare](https://www.cloudflare.com/)
- [Namecheap](https://www.namecheap.com/)

I use cloudflare as DNS server and hold my domains in Namecheap.

*Cost: Free(except domains)*

## Monitoring

- **Google Analytics**

Not to mention, I am counting you bb.

*Cost: Free*

## Communication

- [**Fastmail**](https://ref.fm/u14633841)
- [**Twitter**](https://twitter.com/junkpiano)

I used to build several email server, but it turned out that email server is fragile if it's built poorly.
I use Fastmail as Gmail alternative. Fastmail is a paid service, so it doesn't have ads. I am a Fastmail customer as well as a Gmail product.

That said, You can send me email but twitter DM is preferrable. [@junkpiano](https://twitter.com/junkpiano)

*Cost: $35/year*

## Future

I am building my CMS(Contents Management System). The first goal is organizing assets such as images, PDFs. Text editing is huge, I don't want to implement it by my own right now. I will continue to write posts in VSCode.

My blog is a static website, but it might get dynamic website in the future. I can't tell. If I don't give up, something will happen here.

*Cost: N/A*

## Wrapup

I described how I build my weblog with a few amount of expenses. I encourage you to build your own blog if you don't own. It's a good portfolio for you.