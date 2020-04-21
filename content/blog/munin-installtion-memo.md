+++ 
draft = false
date = 2020-04-21T16:02:57+09:00
title = "Munin Installation Memo"
slug = "munin-installation-memo" 
+++

Have you ever listened to [Munin](http://munin-monitoring.org/)?
Munin is a server resource monitoring tool, which provides graphical interfaces for a bunch of data

Munin is quite simple and easy to set up.

Here, I will write down my configuration when I set up munin lately.
I suppose that you are using [Ubuntu 18.04 LTS](https://releases.ubuntu.com/18.04.4/).

```
$ sudo apt update
$ sudo apt install munin munin-node nginx
```

### Nginx Configuration

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location /munin {
            alias /var/www/html/munin;
        }

        location ^~ /munin-cgi/munin-cgi-graph/ {
            access_log off;
            fastcgi_split_path_info ^(/munin-cgi/munin-cgi-graph)(.*);
            fastcgi_param PATH_INFO $fastcgi_path_info;
            fastcgi_pass unix:/var/run/munin/fastcgi-graph.sock;
            include fastcgi_params;
        }

}
```

Restart nginx.

```
$ sudo service nginx restart
```


## Munin Configuration

munin.conf

```
dbdir   /var/lib/munin
htmldir /var/www/html/munin
logdir /var/log/munin
rundir  /var/run/munin

[servername1.domain]
    address 127.0.0.1
    use_node_name yes

[servername2.domain]
    address [ip address]
    use_node_name yes
```

## Run munin as FCGI

```
$ sudo chown -R munin:www-data /var/run/munin
$ sudo spawn-fcgi -s /var/run/munin/fastcgi-html.sock -U www-data -u www-data -g www-data /usr/lib/munin/cgi/munin-cgi-html
$ sudo spawn-fcgi -s /var/run/munin/fastcgi-graph.sock -U www-data -u www-data -g www-data /usr/lib/munin/cgi/munin-cgi-graph
```

This is the most complicated part.

By default `/var/run/munin` is owned by munin. However, in runtime, nginx user(www-data) will access this socket.
`/var/run/munin` must be accessible for both munin and www-data.

First of all, you must change owner of this directory.
The owner of /var/run/munin is munin, and users belonging to www-data can also read and write data there.
munin runs cron jobs to refresh backend data, and I observed it checks this directory on each cron job.
The socket file is read-only, but other files might be overwritten by munin cron. That's why I made munin as owner user.

Next, FCGI process must be owned by www-data(nginx user). On the contrary to Apache, Nginx cannot run CGI directly, instead, it loads CGI daemon.
In terms of server load average, FCGI is more efficient than CGI, while it keeps running on memory. To run CGI, whenever user access to web server, web server launches application process. It is quite heavy and inefficient for web server resources.

Currently, no web application frameworks adopt CGI.

## Restart Munin

```
$ sudo service munin-node restart
```

## Install Munin nodes

On all nodes, 

```
$ sudo apt update
$ sudo apt install munin-node
```

### munin-node.conf

Add this line.

```
allow ^12\.34\.56\.78$ # master server ip address
```

Restart a node.

```
$ sudo service munin-node restart
```

## Monitor on the browser

Congratulations. You are all set. Now is the time to go to http://{your address}/munin.
You will see beautiful graphs. All data are refreshed every 5 mins.

Have a nice monitoring life!
