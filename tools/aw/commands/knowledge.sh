#!/bin/bash

source "$ROOT/tools/aw/lib/common.sh"
source "$ROOT/tools/aw/lib/knowledge_search.sh"

echo
echo "===================================="
echo " AIWorkbench Knowledge"
echo "===================================="
echo

ACTION="$1"

case "$ACTION" in

search)

WORKSPACE="$2"
KEYWORD="$3"

[ -z "$WORKSPACE" ] && {

echo "Usage:"
echo "  aw knowledge search <workspace> <keyword>"
exit 1

}

[ -z "$KEYWORD" ] && {

echo "Usage:"
echo "  aw knowledge search <workspace> <keyword>"
exit 1

}

echo "Search:"
echo "--------------------------------"

knowledge_search "$WORKSPACE" "$KEYWORD"

;;

"")

echo "Usage:"
echo "  aw knowledge search <workspace> <keyword>"

;;

*)

echo "Unknown subcommand: $ACTION"

;;

esac

