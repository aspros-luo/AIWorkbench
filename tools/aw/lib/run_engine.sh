#!/bin/bash

source "$ROOT/tools/aw/lib/ai_runtime.sh"
source "$ROOT/tools/aw/lib/prompt_engine.sh"
source "$ROOT/tools/aw/lib/prompt_request.sh"
source "$ROOT/tools/aw/lib/llm_adapter.sh"

run_workspace() {

    local workspace="$1"
    local cli_request="$2"

    echo
    echo "===================================="
    echo " AIWorkbench Run"
    echo "===================================="

    echo
    echo "[1/4] Building Runtime..."
    build_runtime "$workspace"

    echo
    echo "[2/4] Building Prompt..."
    build_prompt "$workspace"

    local request

    request="$(collect_request "$cli_request")"

    echo
    echo "[3/4] Preparing Request..."

    echo
    echo "$request"

    echo
    echo "[4/4] Preparing LLM..."

    llm_generate "$workspace" "$request"

    echo
    echo "Run Pipeline completed."

}
