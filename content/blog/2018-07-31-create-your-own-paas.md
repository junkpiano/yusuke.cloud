---
date: "2018-07-31T00:00:00Z"
draft: true 
title: Create your own Paas
---

## Dokku

### provision VPS instance

I am using [Linode](https://www.linode.com/?r=5f4b41dbdb0e009af64882ea35ee82ecf0ef0290).
You don't need large instances just to run Dokku. A small instance should be enough.

As of today, **Ubuntu 16.04 x64 or 14.04 x64 is recommended**. CentOS is still experimental and some features doesn't work on CentOS.

After you buy a server, don't forget to secure your instance in sufficient manners.

### install

    wget https://raw.githubusercontent.com/dokku/dokku/v0.12.12/bootstrap.sh;
    sudo DOKKU_TAG=v0.12.12 bash bootstrap.sh

Once installation is done, you can open browser to see setup page. Open your browser and to to your ip address or, if you have any, domain name, and you can set ssh key to login as user `dokku`, and configure virtual host.

### configuration

## Let's Encrypt

[Let's Encrypt](https://letsencrypt.org/) is a free certificate authority.
Thanks to let's encrypt, You can easily secure your connections.
