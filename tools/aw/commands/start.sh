#!/bin/bash
# ==============================================================================
# AIWorkbench Command - aw start (全栈运行时一键启动)
# ==============================================================================

if [ -z "$ROOT" ]; then
    ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
fi

WS_NAME=$1

if [ -z "$WS_NAME" ]; then
    echo "❌ 错误: 请指定要启动的工作空间。"
    echo "用法: aw start TemuPilot"
    exit 1
fi

# 统一编排：Step 1 - 环境诊断 (调用现有 doctor 逻辑)
echo "============ [STEP 1: 基础设施诊断] ============"
"$ROOT/tools/aw/aw" doctor

# 统一编排：Step 2 - 自动装载 AI 上下文
echo ""
echo "============ [STEP 2: 装载 AI 上下文环境] ============"
"$ROOT/tools/aw/aw" context "$WS_NAME"

