#!/bin/bash
# ==============================================================================
# AIWorkbench Command - aw memory (长期记忆运行时引擎 - GEMINI)
# ==============================================================================
set -e

if [ -z "$ROOT" ]; then
    ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
fi

WS_NAME=$1

if [ -z "$WS_NAME" ]; then
    echo "❌ 错误: 请指定工作空间名称。"
    echo "用法: aw memory TemuPilot"
    exit 1
fi

TARGET_DIR="$ROOT/workspaces/$WS_NAME/ai/memory"
MEMORY_FILE="$TARGET_DIR/HISTORY.md"

if [ ! -d "$ROOT/workspaces/$WS_NAME" ]; then
    echo "❌ 错误: 工作空间 [$WS_NAME] 不存在。"
    exit 1
fi

mkdir -p "$TARGET_DIR"

if [ ! -f "$MEMORY_FILE" ]; then
    cat << 'INNER_EOF' > "$MEMORY_FILE"
# 🧠 {{WORKSPACE_NAME}} - Long-term Memory (长期记忆)
# 注释：本文件由 AI 自动追加维护，记录项目核心技术决策与重大踩坑历史。

## 🪵 核心决策流水账
- **2026-06-27**: 项目正式接入 AIWorkbench 骨架，通关 Context 运行时。
INNER_EOF
    sed -i '' "s/{{WORKSPACE_NAME}}/$WS_NAME/g" "$MEMORY_FILE"
fi

echo "======================================================================"
echo "🧠 AIWorkbench Memory Runtime - 正在读取 [$WS_NAME] 长期记忆"
echo "======================================================================"
echo ""
cat "$MEMORY_FILE"
echo ""
echo "======================================================================"
