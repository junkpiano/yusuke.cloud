#!/bin/bash

set -e

if [[ "$TRAVIS_BRANCH" = "master" ]]; then
  openssl aes-256-cbc -K $encrypted_bd89d04f99c0_key -iv $encrypted_bd89d04f99c0_iv -in deploy-key.enc -out deploy-key -d
  eval "$(ssh-agent -s)"
  chmod 600 deploy-key
  ssh-add deploy-key
  git remote add deploy dokku@yusuke.cloud:avocado
  git push deploy master
fi
