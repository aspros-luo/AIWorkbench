#!/bin/bash

ollama_generate() {

    local workspace="$1"
    local request="$2"

    local prompt_dir="$WORKSPACE_DIR/$workspace/.prompt"
    local runtime_dir="$WORKSPACE_DIR/$workspace/.runtime"

    local system

    system="$(cat "$prompt_dir/system.md")"

    local prompt

    prompt="$system

====================================
User Request
====================================

$request"

    mkdir -p "$runtime_dir"

    cat > "$runtime_dir/prompt.preview.md" <<EOT
$prompt
EOT

    curl -s http://localhost:11434/api/generate \
    -d "{
        \"model\":\"qwen3-coder:latest\",
        \"prompt\":$(printf '%s' "$prompt" | python3 -c 'import json,sys;print(json.dumps(sys.stdin.read()))'),
        \"stream\":false
    }"

}
