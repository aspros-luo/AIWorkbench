#!/bin/bash

# ==============================================================================
# AIWorkbench Bootstrap
#
# Framework 唯一初始化入口
#
# 职责：
#   1. 检查 ROOT 是否存在
#   2. 初始化基础环境变量
#   3. 加载 Runtime Library
#
# 不负责：
#   - 推导 ROOT
#   - 自动寻找项目目录
#
# ROOT 必须由 aw 入口程序负责初始化。
# ==============================================================================

if [ -z "$ROOT" ]; then
    echo "[ERROR] ROOT is not initialized."
    return 1
fi

export CONFIG_FILE="$ROOT/config/config.yaml"
export TEMPLATE_DIR="$ROOT/shared/templates/workspace"
export WORKSPACE_DIR="$ROOT/workspaces"

source "$ROOT/tools/aw/lib/common.sh"
source "$ROOT/tools/aw/lib/config.sh"
source "$ROOT/tools/aw/lib/workspace.sh"
