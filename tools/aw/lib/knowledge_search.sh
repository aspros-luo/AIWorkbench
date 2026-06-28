#!/bin/bash

search_knowledge() {

    local keyword="$1"

    find "$ROOT/shared/knowledge" \
        -type f \
        -name "*.md" | while read -r file
    do

        title=$(grep "^title:" "$file" | cut -d':' -f2- | xargs)
        category=$(grep "^category:" "$file" | cut -d':' -f2- | xargs)
        filename=$(basename "$file")

        if echo "$title $category $filename" | grep -iq "$keyword"; then
            realpath --relative-to="$ROOT/shared/knowledge" "$file" 2>/dev/null \
            || python3 - <<PY
import os
print(os.path.relpath("$file", "$ROOT/shared/knowledge"))
PY
        fi

    done

}
