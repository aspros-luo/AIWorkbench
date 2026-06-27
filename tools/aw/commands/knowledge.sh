#!/bin/bash
# ==============================================================================
# AIWorkbench Command - aw knowledge (全局知识库检索引擎 - GEMINI)
# ==============================================================================
set -e

if [ -z "$ROOT" ]; then
    ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
fi

KNOW_DIR="$ROOT/ai/knowledge"
mkdir -p "$KNOW_DIR"

if [ ! -f "$KNOW_DIR/INDEX.md" ]; then
    cat << 'INNER_EOF' > "$KNOW_DIR/INDEX.md"
# 📖 AIWorkbench Global Knowledge Index (全局知识库索引)
# 注释：存放跨项目的通用架构设计规范与平台公共技术知识。

- [platform] AIWorkbench 平台操作守则
INNER_EOF
fi

echo "======================================================================"
echo "📖 AIWorkbench Knowledge Base - 全局知识库架构中心"
echo "======================================================================"
echo ""
cat "$KNOW_DIR/INDEX.md"
echo ""
echo "======================================================================"
