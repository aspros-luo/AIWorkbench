#!/bin/bash

set -e

source "$ROOT/tools/aw/lib/bootstrap.sh"
source "$ROOT/tools/aw/lib/template.sh"

NAME="$1"

if [ -z "$NAME" ]; then
    echo "Usage:"
    echo
    echo "  aw init <workspace>"
    exit 1
fi

TARGET="$WORKSPACE_DIR/$NAME"

if [ -d "$TARGET" ]; then
    echo
    echo "Workspace [$NAME] already exists."
    exit 1
fi

copy_workspace_template "$NAME"

render_workspace "$NAME"

echo
echo "🎉 Workspace created."
echo
echo "$TARGET"
