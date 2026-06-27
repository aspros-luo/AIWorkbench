#!/bin/bash
set -e
NAME=$1

if [ -z "$NAME" ]; then
    echo "用法: aw init WorkspaceName"
    exit 1
fi

TARGET="$ROOT/workspaces/$NAME"
if [ -d "$TARGET" ]; then
    echo "⚠️  工作空间 [$NAME] 已经存在。"
    exit 1
fi

TEMPLATE="$ROOT/shared/templates/workspace"
cp -R "$TEMPLATE" "$TARGET"

find "$TARGET" -type f -name "*.md" | while read -r file; do
    sed -i '' "s/{{WORKSPACE_NAME}}/$NAME/g" "$file"
done

echo ""
echo "🎉 工作空间创建成功！"
echo "$TARGET"
