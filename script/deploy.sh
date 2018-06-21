#!/bin/bash

set -e

rsync -avuze "ssh -i ~/.ssh/linode" --delete _site yusuke-bot@$1:~/
ssh -ti ~/.ssh/linode yusuke-bot@$1 "sudo rsync -avuz --delete _site/ /var/www/$2/ && rm -rf _site"
