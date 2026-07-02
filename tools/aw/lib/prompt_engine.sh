#!/bin/bash

prompt_runtime_dir() {

    local workspace="$1"

    echo "$WORKSPACE_DIR/$workspace/.runtime"

}

prompt_output_dir() {

    local workspace="$1"

    echo "$WORKSPACE_DIR/$workspace/.prompt"

}

build_prompt() {

    local workspace="$1"

    local runtime
    runtime="$(prompt_runtime_dir "$workspace")"

    local output
    output="$(prompt_output_dir "$workspace")"

    mkdir -p "$output"

    cat > "$output/system.md" <<EOT
# AIWorkbench System Prompt

Workspace

$(cat "$runtime/workspace.md")

---

Project

$(cat "$runtime/project.md")

---

Memory

$(cat "$runtime/memory.md")

---

Knowledge

$(cat "$runtime/knowledge.md")
EOT

    echo
    echo "===================================="
    echo " AI Prompt"
    echo "===================================="

    echo
    echo "Prompt Directory:"
    echo "------------------------------------"

    ls "$output"

    echo
    echo "Prompt build completed."

}
