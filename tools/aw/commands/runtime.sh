#!/bin/bash

source "$ROOT/tools/aw/lib/bootstrap.sh"
source "$ROOT/tools/aw/lib/ai_runtime.sh"

WS="$1"

if [ -z "$WS" ]; then
    echo
    echo "Usage:"
    echo
    echo "  aw runtime <workspace>"
    echo
    exit 1
fi

build_runtime "$WS"
