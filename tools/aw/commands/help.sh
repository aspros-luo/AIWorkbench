#!/bin/bash

ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
COMMAND_DIR="$ROOT/tools/aw/commands"

echo
echo "===================================="
echo " AIWorkbench Help"
echo "===================================="
echo

echo "Available Commands:"
echo "-------------------"

for file in "$COMMAND_DIR"/*.sh; do
    name=$(basename "$file" .sh)
    echo "  - $name"
done

echo
echo "Usage:"
echo "  aw <command>"
echo
