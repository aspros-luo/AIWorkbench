#!/bin/bash

source "$ROOT/tools/aw/lib/common.sh"

config_exists() {
    [ -f "$CONFIG_FILE" ]
}

config_get() {
    local key="$1"

    grep "^${key}:" "$CONFIG_FILE" \
        | head -1 \
        | cut -d':' -f2- \
        | xargs
}
