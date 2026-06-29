#!/bin/bash

source "$ROOT/tools/aw/lib/bootstrap.sh"
source "$ROOT/tools/aw/lib/prompt_engine.sh"

WS="$1"

if [ -z "$WS" ]; then
    echo
    echo "Usage:"
    echo
    echo "  aw prompt <workspace>"
    echo
    exit 1
fi

build_prompt "$WS"

echo
echo "===================================="
echo " AI Prompt"
echo "===================================="
echo
echo "Prompt Directory:"
echo "------------------------------------"

ls "$WORKSPACE_DIR/$WS/.prompt"

echo
echo "Prompt build completed."
