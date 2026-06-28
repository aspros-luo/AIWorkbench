#!/bin/bash
# 统一 Agent 调度器：根据 MODEL 类型动态加载执行策略
MODEL=${1:-gemini}
AGENT_NAME=$2

echo "🤖 正在初始化 Agent: [$AGENT_NAME] (模型: $MODEL)..."

# 逻辑分发：未来这里可以根据 MODEL 自动注入不同的 Prompt 模版与 API 接口
case $MODEL in
    gemini|chatgpt|codex)
        echo "✅ Agent 调度已准备就绪。"
        ;;
    *)
        echo "❌ 错误: 未知模型类型 -> $MODEL"
        exit 1
        ;;
esac
