#!/bin/bash

source "$ROOT/tools/aw/lib/common.sh"
source "$ROOT/tools/aw/lib/knowledge.sh"

if [ "$1" = "new" ]; then
    shift
    exec "$ROOT/tools/aw/commands/knowledge-new.sh" "$@"
fi

CATEGORY="$1"

echo
echo "===================================="
echo " AIWorkbench Knowledge"
echo "===================================="
echo

knowledge_exists || {
    echo "Knowledge directory missing."
    exit 1
}

if [ -z "$CATEGORY" ]; then
    echo "Categories"
    echo "----------"
    list_categories
    exit 0
fi

show_category "$CATEGORY"

