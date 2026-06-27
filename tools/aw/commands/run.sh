#!/bin/bash

if [ -z "$ROOT" ]; then
    ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
fi

WS_NAME=$1
AGENT_NAME=$2

if [ -z "$WS_NAME" ] || [ -z "$AGENT_NAME" ]; then
    echo "❌ 错误: 参数不足。"
    echo "用法: aw run <工作空间> <Agent名称>"
    echo "示例: aw run TemuPilot discover"
    exit 1
fi

WS_DIR="$ROOT/workspaces/$WS_NAME"
PY_SCRIPT="$WS_DIR/scripts/${AGENT_NAME}_agent.py"

if [ ! -f "$PY_SCRIPT" ]; then
    echo "❌ 错误: 未找到该 Agent 的 Python 核心文件 -> $PY_SCRIPT"
    exit 1
fi

# 防御性校验：检查脚本大小，防止空文件静默退出
FILE_SIZE=$(wc -c < "$PY_SCRIPT" | tr -d ' ')
if [ "$FILE_SIZE" -le 10 ]; then
    echo "❌ 错误: $PY_SCRIPT 内容为空或不完整（当前大小: $FILE_SIZE 字节），请重新落盘该文件。"
    exit 1
fi

export AIWB_ROOT="$ROOT"
export AIWB_WORKSPACE_DIR="$WS_DIR"
export AIWB_CONTEXT_CURRENT="$WS_DIR/ai/context/CURRENT.md"
export AIWB_CONTEXT_SESSION="$WS_DIR/ai/context/SESSION.md"
export AIWB_CONTEXT_STACK="$WS_DIR/ai/context/STACK.md"

echo "🚀 [AIWorkbench Runtime] 正在拉起 [程序 + AI] 真实业务流水线..."
echo "------------------------------------------------------------------"

# 🚀 核心优化：动态探测真正的 Python 运行时，破除 macOS 虚壳限制
PYTHON_CMD=""
if command -v python3 &>/dev/null; then
    if python3 -c "import sys" &>/dev/null; then
        PYTHON_CMD="python3"
    fi
fi

if [ -z "$PYTHON_CMD" ] && command -v python &>/dev/null; then
    if python -c "import sys" &>/dev/null; then
        PYTHON_CMD="python"
    fi
fi

if [ -z "$PYTHON_CMD" ]; then
    echo "❌ 错误: 未能在系统中找到有效的 Python 3 环境（或当前 python3 是未初始化的 macOS 虚壳）。"
    echo "💡 建议: 请在终端尝试运行 'python3 --version' 检查，或执行 'brew install python' 安装标准环境。"
    exit 1
fi

echo "🐍 正在使用运行时 ($PYTHON_CMD) 驱动内核..."
echo "------------------------------------------------------------------"

# 执行并显式捕获退出状态
$PYTHON_CMD "$PY_SCRIPT"
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
    echo "------------------------------------------------------------------"
    echo "❌ Python 守护进程异常中止，退出码 (Exit Code): $EXIT_CODE"
    exit $EXIT_CODE
fi
