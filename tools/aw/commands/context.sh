#!/bin/bash

source "$ROOT/tools/aw/lib/common.sh"

WORKSPACE="${1:-TemuPilot}"
BASE="$WORKSPACE_DIR/$WORKSPACE/ai/context"

echo
echo "===================================="
echo " AIWorkbench Context"
echo "===================================="
echo

for file in CURRENT SESSION STACK
do
    if [ -f "$BASE/$file.md" ]; then
        echo "[$file]"
        echo
        cat "$BASE/$file.md"
        echo
        echo "------------------------------------"
        echo
    else
        echo "[WARN] Missing: $BASE/$file.md"
        echo
    fi
done
