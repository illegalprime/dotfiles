#!/usr/bin/env bash
set -euo pipefail

desktop() {
    cd "$(dirname ${BASH_SOURCE[0]})"
    berks vendor
    sudo chef-client -z -j config.json -c client.rb
}

desktop
