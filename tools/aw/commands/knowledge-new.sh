#!/bin/bash

source "$ROOT/tools/aw/lib/common.sh"

CATEGORY="$1"
NAME="$2"

TEMPLATE="$ROOT/shared/templates/knowledge/KNOWLEDGE_TEMPLATE.md"
TARGET_DIR="$ROOT/shared/knowledge/$CATEGORY"
TARGET_FILE="$TARGET_DIR/$NAME.md"

if [ -z "$CATEGORY" ] || [ -z "$NAME" ]; then
    echo "Usage:"
    echo "aw knowledge new <category> <name>"
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Category not found: $CATEGORY"
    exit 1
fi

if [ -f "$TARGET_FILE" ]; then
    echo "Knowledge already exists."
    exit 1
fi

cp "$TEMPLATE" "$TARGET_FILE"

TODAY=$(date +%F)

sed -i '' "s/^title:.*/title: $NAME/" "$TARGET_FILE"
sed -i '' "s/^category:.*/category: $CATEGORY/" "$TARGET_FILE"
sed -i '' "s/^updated:.*/updated: $TODAY/" "$TARGET_FILE"

echo
echo "Knowledge created:"
echo "$TARGET_FILE"

