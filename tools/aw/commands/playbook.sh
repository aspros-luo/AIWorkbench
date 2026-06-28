#!/bin/bash
# aw playbook [模版名]
TEMPLATE_NAME=$1
TARGET="/Users/aspros/Documents/AIWorkbench/ai/playbooks/base/${TEMPLATE_NAME}.md"

if [ -f "$TARGET" ]; then
    cat "$TARGET"
else
    echo "❌ 错误: 未找到模版 -> $TARGET"
fi
