#!/bin/bash

# ==============================================================================
# Run Engine
# ==============================================================================

source "$ROOT/tools/aw/lib/ai_runtime.sh"
source "$ROOT/tools/aw/lib/prompt_engine.sh"
source "$ROOT/tools/aw/lib/llm_adapter.sh"

run_workspace() {

    local workspace="$1"

    echo
    echo "===================================="
    echo " AIWorkbench Run"
    echo "===================================="

    echo
    echo "[1/3] Building Runtime..."
    build_runtime "$workspace"

    echo
    echo "[2/3] Building Prompt..."
    build_prompt "$workspace"

    echo
    echo "[3/3] Preparing LLM..."
    llm_generate "$workspace"

    echo
    echo "Run Pipeline completed."

}
