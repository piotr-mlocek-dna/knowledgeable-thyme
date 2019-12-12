#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df208088c646b0014c608e6/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df208088c646b0014c608e6
curl -s -X POST https://api.stackbit.com/project/5df208088c646b0014c608e6/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5df208088c646b0014c608e6/webhook/build/publish > /dev/null
