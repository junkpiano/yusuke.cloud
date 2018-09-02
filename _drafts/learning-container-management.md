---
layout: post
title: Learning container management
---

Now I am working as iOS Developer. I don't need to manage container cluster. Even I don't have any production applications except this website.

## Why you need cluster managerment

## Kubernetes Architecture

First of all, you can read [Google Borg paper]().

## Kubernetes in Action

Management cost and learning curve is incredibly high. I really recommend you to hire spcialists for kubernetes if you need persons. In even better (and cheaper) solution, you can buy Google Platform(GCP, GKE). It provides you dashboard and useful tool that wraps kubernetes command line tool sets, and customer support.

## Alternatives

### Docker Swarm mode

Docker supports cluster natively in swarm mode from `1.13`.
Docker swarm is quite easy to set up.

On master node,

    docker swarm init --advertise-addr your-ip-address

You can get token to join master.

On worker node

    docker swarm join docker swarm join --token <Token You got above> master-ip:2377

It's done.

## References

* [Kubernetes](https://kubernetes.io)
