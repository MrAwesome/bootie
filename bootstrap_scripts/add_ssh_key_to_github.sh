#!/bin/bash

set -euo pipefail

curl -u "${GITHUB_USERNAME}:${GITHUB_OAUTH_TOKEN}" --data '{"title":"'"$(hostname)"' from command line","key":"'"$(cat ~/.ssh/id_rsa.pub)"'"}' https://api.github.com/user/keys 
