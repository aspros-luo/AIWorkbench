#!/bin/bash

# ==============================================================================
# Prompt Renderer
#
# 将 Prompt Package 渲染为 Prompt Snapshot。
# ==============================================================================

render_prompt() {

    local workspace="$1"

    local runtime="$WORKSPACE_DIR/$workspace/.runtime"
    local prompt="$WORKSPACE_DIR/$workspace/.prompt"

    mkdir -p "$prompt"

    cat > "$prompt/system.md" <<EOT
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

    cat > "$prompt/user.md" <<EOT
# User Request

(Waiting for request)
EOT

}
