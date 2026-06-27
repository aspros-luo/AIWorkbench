#!/bin/bash
echo "📊 AIWorkbench Runtime 正常运行中。"
echo "当前激活的工作空间数量: $(ls "$ROOT/workspaces" 2>/dev/null | wc -l | tr -d ' ')"
