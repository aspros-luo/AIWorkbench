#!/bin/bash

# ==============================================================================
# Template Engine V1
#
# 负责：
#   1. 复制 Workspace 模板
#   2. 渲染模板变量
#
# 后续可扩展：
#   {{AUTHOR}}
#   {{DATE}}
#   {{VERSION}}
# ==============================================================================

copy_workspace_template() {

    local workspace_name="$1"

    cp -R \
        "$TEMPLATE_DIR" \
        "$WORKSPACE_DIR/$workspace_name"

}

render_workspace() {

    local workspace_name="$1"

    local target="$WORKSPACE_DIR/$workspace_name"

    find "$target" \
        -type f \
        -name "*.md" \
    | while read -r file
    do

        sed -i '' \
            "s/{{WORKSPACE_NAME}}/$workspace_name/g" \
            "$file"

        sed -i '' \
            "s/{{PROJECT_NAME}}/$workspace_name/g" \
            "$file"

    done

}
