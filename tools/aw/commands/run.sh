#!/bin/bash
# ==============================================================================
# AIWorkbench Command - aw run (任务调度枢纽)
# ==============================================================================

if [ -z "$ROOT" ]; then
    ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
fi

WS_NAME=$1
AGENT_NAME=$2

if [ -z "$WS_NAME" ] || [ -z "$AGENT_NAME" ]; then
    echo "❌ 错误: 参数不足。用法: aw run <工作空间> <Agent名称>"
    exit 1
fi

# 核心架构调整: 通过 dispatcher 中转
"$ROOT/ai/commands/agent_dispatch.sh" "$WS_NAME" "$AGENT_NAME"
