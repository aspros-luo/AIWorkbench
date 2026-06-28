#!/bin/bash

[ -z "$ROOT" ] && ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

build_registry() {

    local workspace="$1"

    [ -z "$workspace" ] && {
        echo "Usage: build_registry <workspace>"
        return 1
    }

    local KNOWLEDGE_ROOT="$ROOT/workspaces/$workspace/knowledge"
    local REGISTRY="$KNOWLEDGE_ROOT/registry.json"

    mkdir -p "$KNOWLEDGE_ROOT"

    echo "[" > "$REGISTRY"

    first=1

    find "$KNOWLEDGE_ROOT" \
        -type f \
        -name "*.md" \
    | while read file
    do

        title=$(grep "^title:" "$file" | cut -d':' -f2- | xargs)
        category=$(grep "^category:" "$file" | cut -d':' -f2- | xargs)

        rel=$(python3 - <<PY
import os
print(os.path.relpath("$file","$KNOWLEDGE_ROOT"))
PY
)

        [ "$first" = 0 ] && echo "," >> "$REGISTRY"

        first=0

cat >> "$REGISTRY" <<JSON
{
  "title":"$title",
  "category":"$category",
  "file":"$rel"
}
JSON

    done

    echo "]" >> "$REGISTRY"

    echo "Registry rebuilt."
}
