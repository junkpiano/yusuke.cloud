+++ 
draft = false
date = 2021-07-19T15:01:57+09:00
title = "SwiftDoc Action for Fastlane"
slug = ""
authors = ["Yusuke Ohashi"]
+++

I just want to announce I created a fastlane action for [SwiftDoc](https://swiftdoc.org), since I couldn't find it in the fastlane official docs.

SwiftDoc is yet another documentation generator, and it's dedicated for Swift project.
It has very clean UI and also generates beautiful dependency graph.
I introduced my private swift project.

Here is the script.

{{< gist junkpiano f37d27f10bde1653f4975cfc8dff6b34 >}}

Place this script into `fastlane/actions`, and run in `Fastfile`

e.g.
```
    swiftdoc(
      input: "Sources",
      module_name: "YourModuleName",
      output: "docs/",
      base_url: "/",
      format: "html"
    )
```

You can publish it into github pages, netlify, and so on.
