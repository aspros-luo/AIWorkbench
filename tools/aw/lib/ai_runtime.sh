#!/bin/bash

# ==============================================================================
# AI Runtime Builder
#
# 负责收集 Workspace 信息，构建 AI Runtime。
# Runtime 会生成到：
#
#   workspaces/<workspace>/.runtime/
#
# 当前版本：
#   Runtime Object V1
# ==============================================================================

build_runtime() {

    local workspace="$1"
    local root="$WORKSPACE_DIR/$workspace"
    local runtime="$root/.runtime"

    mkdir -p "$runtime"

    ############################################
    # Workspace
    ############################################

    cat > "$runtime/workspace.md" <<EOT
# Workspace

$workspace
EOT

    ############################################
    # Project
    ############################################

    if [ -f "$root/PROJECT.md" ]; then
        cp "$root/PROJECT.md" \
           "$runtime/project.md"
    fi

    ############################################
    # Memory
    ############################################

    {
        echo "# Memory"
        echo

        if [ -d "$root/ai/memory" ]; then

            for file in "$root"/ai/memory/*.md
            do

                [ -f "$file" ] || continue

                echo "## $(basename "$file")"
                echo

                cat "$file"

                echo
                echo

            done

        fi

    } > "$runtime/memory.md"

    ############################################
    # Knowledge
    ############################################

    {
        echo "# Knowledge"
        echo

        if [ -d "$root/knowledge" ]; then

            find "$root/knowledge" \
                -name "*.md" \
                | while read file
            do

                echo "## $(basename "$file")"
                echo

                cat "$file"

                echo
                echo

            done

        fi

    } > "$runtime/knowledge.md"

    ############################################
    # Preview
    ############################################

    echo
    echo "===================================="
    echo " AI Runtime"
    echo "===================================="
    echo

    echo "Workspace:"
    echo "------------------------------------"
    cat "$runtime/workspace.md"

    echo
    echo "Runtime Directory:"
    echo "------------------------------------"

    ls "$runtime"

    echo
    echo "Runtime build completed."

}
