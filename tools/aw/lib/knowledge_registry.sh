#!/bin/bash

if [ -z "$ROOT" ]; then
    ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
fi

KNOWLEDGE_ROOT="$ROOT/shared/knowledge"
REGISTRY="$KNOWLEDGE_ROOT/registry.json"

build_registry() {

mkdir -p "$KNOWLEDGE_ROOT"

echo "[" > "$REGISTRY"

FIRST=1

find "$KNOWLEDGE_ROOT" \
    -mindepth 2 \
    -type f \
    -name "*.md" \
| while read -r file
do

    TITLE=$(grep "^title:" "$file" | cut -d':' -f2- | xargs)
    CATEGORY=$(grep "^category:" "$file" | cut -d':' -f2- | xargs)

    REL=$(python3 - <<PY
import os
print(os.path.relpath("$file", "$KNOWLEDGE_ROOT"))
PY
)

    if [ "$FIRST" -eq 0 ]; then
        echo "," >> "$REGISTRY"
    fi

    FIRST=0

cat >> "$REGISTRY" <<JSON
{
  "title":"$TITLE",
  "category":"$CATEGORY",
  "file":"$REL"
}
JSON

done

echo "]" >> "$REGISTRY"

echo "Registry rebuilt."

}

