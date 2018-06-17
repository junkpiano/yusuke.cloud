#!/bin/sh

set -e
bundle
bundle exec jekyll build

rsync -avuze "ssh -i ~/.ssh/linode" --delete --exclude '_site/README.md'  --exclude '_site/deploy.sh' _site yusuke-bot@${REMOTE_IP}:~/
ssh -ti ~/.ssh/linode yusuke-bot@${REMOTE_IP} "sudo rsync -avuz --delete _site/* /var/www/${REMOTE_URL}/ && rm -rf _site"
