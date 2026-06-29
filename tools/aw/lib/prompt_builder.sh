#!/bin/bash

# ==============================================================================
# Prompt Builder
#
# 根据 Runtime Snapshot 构建 Prompt Package。
# Builder 不负责写文件。
# ==============================================================================

source "$ROOT/tools/aw/lib/prompt_model.sh"

prompt_build() {

    local workspace="$1"
    local runtime

    runtime=$(prompt_runtime_dir "$workspace")

    SYSTEM_CONTENT=$(cat <<EOT
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
)

    USER_CONTENT=$(cat <<EOT
# User Request

(Waiting for request)
EOT
)

}
