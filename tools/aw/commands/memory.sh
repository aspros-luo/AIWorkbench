#!/bin/bash

source "$ROOT/tools/aw/lib/common.sh"
source "$ROOT/tools/aw/lib/config.sh"
source "$ROOT/tools/aw/lib/memory.sh"

WS_NAME="$1"
ACTION="$2"
TYPE="$3"

if [ -z "$WS_NAME" ]; then
    echo "Usage:"
    echo "  aw memory <workspace> show <project|decisions|session|todo>"
    exit 1
fi

MEMORY_DIR="$WORKSPACE_DIR/$WS_NAME/ai/memory"

[ ! -d "$MEMORY_DIR" ] && {
    echo "Memory not found."
    exit 1
}

case "$ACTION" in

show)

    if [ -z "$TYPE" ]; then

        echo
        echo "Available Memory:"
        echo
        echo "  project"
        echo "  decisions"
        echo "  session"
        echo "  todo"
        echo

        exit 0

    fi

    memory_read "$WS_NAME" "$TYPE"

    ;;

*)

    echo
    echo "Usage:"
    echo
    echo "  aw memory <workspace> show"
    echo "  aw memory <workspace> show project"
    echo "  aw memory <workspace> show decisions"
    echo "  aw memory <workspace> show session"
    echo "  aw memory <workspace> show todo"
    ;;

esac
