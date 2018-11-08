---
layout: post
title: Network Abstraction Layer
date: 2018-11-10 15:45 +0900
---

I am experimenting network request in `Kiri` library.
`Kiri` is `Moya` inspired abstract networking layer. I was very impressed by `Moya` architecture, so to learn from it the most, I decided to trace the same architecture by writing by myself, instead of copy and paste. :D

We need to break down client library into three parts.

## Request

You have to construct networking request every time.
In `Kiri`, every API request must be configured conforming `RequestContainer` protocol.

## Networking

iOS has their own networking class, URLSession. But it makes no sense to wrap URLSession now. We have `Alamofire`.
Alamofire automatically validates request and response, and also returns JSON. However, I prefer keeping response `Data`, since network library should support multiple response formats.

## Response

I found there is a trade off. If you make response generic, your request will be fragmented to separate classes. On the other hand, if you make request generic, your response will be fragmented.

`Kiri` is the way smaller than Moya, but it is working fine in my personal project.

