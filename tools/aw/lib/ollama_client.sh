#!/bin/bash

# ==============================================================================
# Ollama Client
# ==============================================================================

ollama_generate() {

    local workspace="$1"

    local prompt_dir="$WORKSPACE_DIR/$workspace/.prompt"

    local prompt

    prompt="$(cat "$prompt_dir/system.md")

$(cat "$prompt_dir/user.md")"

    curl -s http://localhost:11434/api/generate \
    -d "{
        \"model\":\"qwen3-coder:latest\",
        \"prompt\":$(printf '%s' "$prompt" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))'),
        \"stream\":false
    }"

}
