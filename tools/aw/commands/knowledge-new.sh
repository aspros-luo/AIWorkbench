#!/bin/bash

source "$ROOT/tools/aw/lib/common.sh"

WORKSPACE=$1
CATEGORY=$2
NAME=$3

[ -z "$WORKSPACE" ] && die "Usage: aw knowledge-new <workspace> <category> <name>"
[ -z "$CATEGORY" ] && die "Missing category."
[ -z "$NAME" ] && die "Missing name."

TARGET_DIR="$ROOT/workspaces/$WORKSPACE/knowledge/$CATEGORY"

mkdir -p "$TARGET_DIR"

cp \
"$ROOT/shared/templates/knowledge/KNOWLEDGE_TEMPLATE.md" \
"$TARGET_DIR/$NAME.md"

echo

echo "Created:"

echo "$TARGET_DIR/$NAME.md"
