#!/bin/bash

append_decision() {

    local workspace="$1"
    local title="$2"
    local reason="$3"
    local impact="$4"

    local file="$WORKSPACE_DIR/$workspace/ai/memory/DECISIONS.md"

    cat >> "$file" <<EOT

---

日期：
$(date +"%Y-%m-%d")

决定：
$title

原因：
$reason

影响：
$impact

EOT

}
