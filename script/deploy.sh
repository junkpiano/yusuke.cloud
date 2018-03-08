#!/bin/bash

set -e

rsync -r --delete-after --quiet $TRAVIS_BUILD_DIR/_site yusuke-bot@$1:~/
ssh -t yusuke-bot@$1 "sudo rsync -avuz --delete _site/ /var/www/$2/ && rm -rf _site"
