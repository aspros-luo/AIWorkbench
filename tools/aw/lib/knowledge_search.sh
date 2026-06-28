#!/bin/bash

knowledge_search(){

WORKSPACE="$1"
KEYWORD="$2"

find "$ROOT/workspaces/$WORKSPACE/knowledge" \
-type f \
-name "*.md" |
while read file
do

grep -qi "$KEYWORD" "$file" || continue

python3 - <<PY
import os
print(os.path.relpath("$file","$ROOT/workspaces/$WORKSPACE/knowledge"))
PY

done

}
