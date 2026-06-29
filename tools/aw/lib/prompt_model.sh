#!/bin/bash

# ==============================================================================
# Prompt Model
#
# 从 Runtime Snapshot 读取数据。
#
# 输入：
#   .runtime/
#
# 输出：
#   Prompt Model
# ==============================================================================

prompt_runtime_dir() {

    local workspace="$1"

    echo "$WORKSPACE_DIR/$workspace/.runtime"

}

prompt_model_exists() {

    local workspace="$1"

    [ -d "$(prompt_runtime_dir "$workspace")" ]

}

