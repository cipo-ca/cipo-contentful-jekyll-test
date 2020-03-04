#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e321eda46035f001456601c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e321eda46035f001456601c
curl -s -X POST https://api.stackbit.com/project/5e321eda46035f001456601c/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e321eda46035f001456601c/webhook/build/publish > /dev/null
