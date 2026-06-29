#!/bin/bash

# ==============================================================================
# AIWorkbench Memory Command
# ==============================================================================

source "$ROOT/tools/aw/lib/bootstrap.sh"
source "$ROOT/tools/aw/lib/memory.sh"

WS_NAME="$1"
ACTION="$2"

if [ -z "$WS_NAME" ]; then
    echo
    echo "Usage:"
    echo
    echo "  aw memory <workspace> show"
    echo "  aw memory <workspace> show project"
    echo "  aw memory <workspace> show decisions"
    echo "  aw memory <workspace> show session"
    echo "  aw memory <workspace> show todo"
    echo
    exit 1
fi

case "$ACTION" in

show|"")

    TYPE="$3"

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

decision)

    append_decision \
        "$WS_NAME" \
        "$3" \
        "$4" \
        "$5"

    echo
    echo "Decision added."

    ;;

*)

    echo
    echo "Unknown action."

    ;;
esac
