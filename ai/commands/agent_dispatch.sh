#!/bin/bash
# ==============================================================================
# AIWorkbench Dispatcher - Agent 统一调度器 (严谨版)
# ==============================================================================
set -e

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "❌ 错误: Dispatcher 需要两个参数 [Workspace] [AgentName]"
    exit 1
fi

WS_NAME=$1
AGENT_NAME=$2
WS_DIR="$ROOT/workspaces/$WS_NAME"
PY_SCRIPT="$WS_DIR/scripts/${AGENT_NAME}_agent.py"

if [ ! -d "$WS_DIR" ]; then
    echo "❌ 错误: 工作空间不存在 -> $WS_DIR"
    exit 1
fi

if [ ! -f "$PY_SCRIPT" ]; then
    echo "❌ 错误: Agent 脚本缺失 -> $PY_SCRIPT"
    exit 1
fi

export AIWB_ROOT="$ROOT"
export AIWB_WORKSPACE_DIR="$WS_DIR"
export AIWB_CONTEXT_CURRENT="$WS_DIR/ai/context/CURRENT.md"
export AIWB_CONTEXT_SESSION="$WS_DIR/ai/context/SESSION.md"
export AIWB_CONTEXT_STACK="$WS_DIR/ai/context/STACK.md"

echo "🤖 [Dispatcher] 成功调度 Agent: $AGENT_NAME (工作空间: $WS_NAME)"
python3 "$PY_SCRIPT"
