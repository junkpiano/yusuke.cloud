---
layout: post
title: Network Abstraction Layer
date: 2018-11-10 15:45 +0900
---

I am experimenting a new way for network request in `Kiri` library.
`Kiri` is `Moya` inspired abstract networking layer. I was very impressed by `Moya` architecture, so to learn from it the most, I decided to trace the same architecture by writing by myself, instead of copy and paste. :D

We need to break down client library into three parts.

## Request

Normally, you have to construct networking request every time.
Instead, in Kiri, your network configuration is compiled in one place, like class, enum.
And the class, enum must conform to `RequestContainer` protocol.

Sample code looks like this.

```
enum TestAPIRequest {
  case getitems
  case postitem
  case updateitem
  case deleteitem
}

enum TestAPIRequest: RequestContainer {
  var baseURL: URL {
    return URL(string: "https://www.example.com/api/v1")!
  }
  
  var path: String {
    switch self {
      case .getitems:
      return "/getitems"
      .....
    }
  }
  
  ....
}
```

It is better in terms of designing an API Client.
Before you start to create client module, you can take a glance at whole structure.
And you don't need to pass common parts like `baseURL`, and you can avoid duplicate code in your app.

But if your api has different endpoints per API, or stuff like that, things are not that easy. In such case you might want to create seprate classses per API. It also makes sense. If you encounter such API (unfortunately), you had better take a look at APIKit instead. It's supposed to have separate classses per API, and for response, it's more generic approach than Kiri or Moya.

## Networking

iOS has their own networking class, URLSession. But it makes no sense to wrap URLSession now. **We have `Alamofire`.**
Alamofire automatically validates request and response, and also returns JSON. However, I prefer keeping response `Data`, since network library should support multiple response formats.

Kiri makes use of Alamofire for network request, and delegate building a request to it.

In the most cases, Alamofire works very well, but in case you need more premitive networking to build parameters by yourself, and so on, it might not be good for you.

## Response

I found there is a trade off. If you make response generic, your request will be fragmented to separate classes. On the other hand, if you make request generic, your response will be fragmented.

I read code of both `Moya` and `APIKit`. In my opinion, these are the most sophisticated architecture in swift networking, whereas they have pros and cons.

I don't find the best solution for networking yet, but for now, choosing wisely according to your app requirements would be the best answer. 

## References

- https://github.com/junkpiano/Kiri
- https://github.com/Moya/Moya
- https://github.com/ishkawa/APIKit

*`Kiri` is the way smaller than Moya, but it is working fine in my personal project. Why not you try it!?*
