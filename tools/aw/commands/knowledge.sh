#!/bin/bash

# ==============================================================================
# AIWorkbench Knowledge Command
# ==============================================================================

source "$ROOT/tools/aw/lib/bootstrap.sh"
source "$ROOT/tools/aw/lib/knowledge_search.sh"

echo
echo "===================================="
echo " AIWorkbench Knowledge"
echo "===================================="
echo

ACTION="$1"

case "$ACTION" in

search)

    KEYWORD="$2"

    if [ -z "$KEYWORD" ]; then
        echo "Usage:"
        echo "  aw knowledge search <keyword>"
        exit 1
    fi

    echo "Search:"
    echo "--------------------------------"

    search_knowledge "$KEYWORD"

    ;;

"")

    echo "Usage:"
    echo "  aw knowledge search <keyword>"

    ;;

*)

    echo "Unknown subcommand: $ACTION"

    ;;

esac
