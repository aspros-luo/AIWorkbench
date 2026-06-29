#!/bin/bash

# ==============================================================================
# Prompt Renderer
#
# 将 Prompt Package 渲染为 Prompt Snapshot。
# Renderer 不读取 Runtime。
# ==============================================================================

render_prompt() {

    local workspace="$1"

    local prompt="$WORKSPACE_DIR/$workspace/.prompt"

    mkdir -p "$prompt"

    printf "%s\n" "$SYSTEM_CONTENT" > "$prompt/system.md"

    printf "%s\n" "$USER_CONTENT" > "$prompt/user.md"

}
