---
title: "NWPathMonitor"
date: 2021-06-14T16:16:05+09:00
categories:
    - iOS
draft: false
---

## Introduction

NWPathMonitor is a class in Network framework, which observes network status and monitor network interface.
It's available in iOS 12 or later.

```swift
import Network
```

You must retain NWPathMonitor instances to get callbacks.

```swift
class NetworkMonitorViewController: ViewController {
    let monitor = NWPathMonitor()
}
```

`requiredInterface` lets you observe the specific network interface.

```swift
let wifiMonitor = NWPathMonitor(requiredInterfaceType: .wifi)
```

Here is the list of interfaces that NWPathMonitor supports.

https://developer.apple.com/documentation/network/nwinterface/interfacetype

## Detect network changes

```swift
monitor.pathUpdateHandler = { path in
    if path.status == .satisfied {
        // Connected
    }
}
```

## Start observation

Create a background queue, then pass it to `start()`.

```swift
let queue = DispatchQueue.global(qos: .background)
monitor.start(queue: queue)
```

That's it. Simple right?

## What is NWPath btw?

[NWPath](https://developer.apple.com/documentation/network/nwpath) contains information such as available interfaces, iPv6 or iPv4.

You can retrieve it from `currentPath`.
```swift
monitor.currentPath
```

## Wrap up

I introduced NWPathMonitor to explain how it enable you to write such a plain code to detect network changes.

NWPathMonitor is
- Available in iOS 12.
- Simple to use
- Good enough for [Reachability](https://developer.apple.com/library/archive/samplecode/Reachability/Introduction/Intro.html) Replacement
