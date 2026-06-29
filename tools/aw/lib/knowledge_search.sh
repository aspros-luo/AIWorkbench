#!/bin/bash

# ==============================================================================
# Knowledge Search Library
# ==============================================================================

search_knowledge() {

    local keyword="$1"

    find "$WORKSPACE_DIR" \
        -path "*/knowledge/*.md" \
        -type f |
    while read -r file
    do

        grep -qi "$keyword" "$file" || continue

        python3 - <<PY
import os
root = os.path.dirname(os.path.dirname("$file"))
print(os.path.relpath("$file", root))
PY

    done

}
