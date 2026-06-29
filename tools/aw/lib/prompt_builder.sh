#!/bin/bash

# ==============================================================================
# Prompt Builder
#
# 根据 Runtime Snapshot 生成 Prompt Package。
#
# 输入：
#   .runtime/
#
# 输出：
#   Prompt Package
# ==============================================================================

source "$ROOT/tools/aw/lib/prompt_model.sh"

prompt_build() {

    local workspace="$1"

    local runtime

    runtime=$(prompt_runtime_dir "$workspace")

    echo "SYSTEM_FILE=$runtime/project.md"
    echo "MEMORY_FILE=$runtime/memory.md"
    echo "KNOWLEDGE_FILE=$runtime/knowledge.md"

}
