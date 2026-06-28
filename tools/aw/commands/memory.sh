#!/bin/bash

source "$ROOT/tools/aw/lib/common.sh"
source "$ROOT/tools/aw/lib/config.sh"
source "$ROOT/tools/aw/lib/memory.sh"

WS_NAME="$1"
ACTION="$2"

if [ -z "$WS_NAME" ]; then
    echo "Usage:"
    echo "  aw memory <workspace>"
    echo "  aw memory <workspace> decision <title> <reason> <impact>"
    exit 1
fi

MEMORY_DIR="$WORKSPACE_DIR/$WS_NAME/ai/memory"

[ ! -d "$MEMORY_DIR" ] && {
    echo "Memory not found."
    exit 1
}

if [ "$ACTION" = "decision" ]; then

    append_decision \
        "$WS_NAME" \
        "$3" \
        "$4" \
        "$5"

    echo
    echo "Decision added."
    exit 0
fi

echo
echo "===================================="
echo " AIWorkbench Memory"
echo "===================================="
echo

for file in \
PROJECT_MEMORY.md \
DECISIONS.md \
TODO_MEMORY.md \
SESSION_MEMORY.md
do

echo "------------------------------------"
echo "$file"
echo "------------------------------------"

cat "$MEMORY_DIR/$file"

echo

done
