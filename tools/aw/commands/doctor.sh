#!/bin/bash
VERSION=$(cat "$ROOT/VERSION")
echo "========================================="
echo " 🛠️  AIWorkbench v$VERSION - 运行状况诊断"
echo "========================================="
echo ""
[ -d "$ROOT/ai" ] && echo "  ✅ ai" || echo "  ❌ ai 缺失"
[ -d "$ROOT/shared" ] && echo "  ✅ shared" || echo "  ❌ shared 缺失"
[ -d "$ROOT/workspaces" ] && echo "  ✅ workspaces" || echo "  ❌ workspaces 缺失"
[ -d "$ROOT/tools" ] && echo "  ✅ tools" || echo "  ❌ tools 缺失"
echo ""
echo "基础设施检查完毕。"
