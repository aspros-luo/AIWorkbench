#!/bin/bash

source "$ROOT/tools/aw/lib/bootstrap.sh"
source "$ROOT/tools/aw/lib/run_engine.sh"

WS="$1"

if [ -z "$WS" ]; then
    echo
    echo "Usage:"
    echo
    echo "  aw run <workspace>"
    echo
    exit 1
fi

run_workspace "$WS"
