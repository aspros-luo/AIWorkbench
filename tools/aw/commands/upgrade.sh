#!/bin/bash
# ==============================================================================
# AIWorkbench Command - aw upgrade (增量无损升级引擎)
# ==============================================================================

if [ -z "$ROOT" ]; then
    ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
fi

WS_NAME=$1
TEMPLATE_DIR="$ROOT/shared/templates/workspace"
TARGET_DIR="$ROOT/workspaces/$WS_NAME"

if [ -z "$WS_NAME" ]; then
    echo "❌ 错误: 请指定要升级的工作空间名称。"
    echo "用法: aw upgrade TemuPilot"
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ 错误: 未找到该工作空间 -> $TARGET_DIR"
    exit 1
fi

echo "🔄 开始对工作空间 [$WS_NAME] 进行标准模板增量比对..."
echo "--------------------------------------------------"

# 使用 cd 切换到模板目录，确保 find 出来的相对路径完全一致
cd "$TEMPLATE_DIR" || exit 1

# 核心算法：遍历模板下的所有文件，发现目标空间缺失的，进行智能补齐
find . -type f | while read -r rel_path; do
    dest_file="$TARGET_DIR/$rel_path"
    dest_dir=$(dirname "$dest_file")
    
    # 如果目标文件不存在，说明属于新版模板断层，触发增量补齐
    if [ ! -f "$dest_file" ]; then
        echo "  ➕ 发现缺失文件，正在补齐: $rel_path"
        mkdir -p "$dest_dir"
        cp "$rel_path" "$dest_file"
        
        # 针对新增的 md 文件动态替换占位符
        if [[ "$dest_file" == *.md ]]; then
            sed -i '' "s/{{WORKSPACE_NAME}}/$WS_NAME/g" "$dest_file"
        fi
    fi
done

echo "--------------------------------------------------"
echo "🎉 工作空间 [$WS_NAME] 增量升级完成！存量数据毫发无损。"
