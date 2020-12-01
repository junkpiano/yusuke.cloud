---
title: "LSP for Swift"
date: 2020-04-07T18:01:03+09:00
draft: false
categories: ["ios"]
---

## What is Language Server Protocol(LSP)?

* Language Server Protocol defines **standardized protocol** with which both a text editor or IDE(client) and a language(server) communicate.
* The protocol is based on **JSONRPC**.
* A client(text editor) can implement
  * Go to definition
  * Error and warnings
  * Auto completion
  * ...

![diagram](https://microsoft.github.io/language-server-protocol/overviews/lsp/img/language-server-sequence.png)

https://microsoft.github.io/language-server-protocol/overviews/lsp/overview/


- Solves *m-times-n* complexity problems

![width:600px](https://code.visualstudio.com/assets/api/language-extensions/language-server-extension-guide/lsp-languages-editors.png) 


## What is Sourcekit-LSP?

![width:800px](/assets/image/source_kit_lsp_github.png)

- Apple's LSP implementation on top of `sourcekitd` and `clangd`
- `sourcekitd` is a framework that provide IDE features
- `clangd` for c-family languages (C/C++/ObjC) language server
- supports **only Swift Package Manager project**

As of Xcode 11.4, SourceKit-LSP is a built-in tool.

    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp

> Xcode and the corresponding Command Line Tools package include the SourceKit-LSP language server for Swift and C-based languages. The language server is in early development, and this is a great time to experiment with it. SourceKit-LSP can be used with third-party tools that support the Language Server Protocol (LSP), and it supports Swift Packages built from the command-line. For information about using SourceKit-LSP see Getting Started with SourceKit-LSP. (48004600)

https://developer.apple.com/documentation/xcode_release_notes/xcode_11_4_release_notes

## VSCode Integration

https://github.com/apple/sourcekit-lsp/tree/master/Editors/vscode

```
$ cd Editors/vscode
$ npm run createDevPackage
$ code --install-extension out/sourcekit-lsp-vscode-dev.vsix
```
- VSCode extension isn't published on marketplace yet.
- You must build on your own.
- try alternatives but they need more complex integration

## Recap

LSP transforms text editor into IDE

Try writing Swift on

- **VSCode(recommended)**
- Sublime Text
- Vim
- Emacs
- ...
