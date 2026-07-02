#!/bin/bash

source "$ROOT/tools/aw/lib/bootstrap.sh"

source "$ROOT/tools/aw/lib/ai_runtime.sh"
source "$ROOT/tools/aw/lib/prompt_model.sh"

source "$ROOT/tools/aw/lib/ollama_client.sh"
source "$ROOT/tools/aw/lib/provider.sh"

WS="$1"
shift

REQUEST="$*"

[ -z "$WS" ] && {
    echo "Usage:"
    echo "  aw run <workspace> [request]"
    exit 1
}

[ -z "$REQUEST" ] && REQUEST="ok"

echo
echo "===================================="
echo " AIWorkbench Run"
echo "===================================="

echo
echo "[1/4] Building Runtime..."
build_runtime "$WS"

echo
echo "[2/4] Building Prompt..."
build_prompt "$WS"

echo
echo "[3/4] Preparing Request..."
echo
echo "$REQUEST"

echo
echo "[4/4] Preparing LLM..."
provider_generate "$WS" "$REQUEST"

echo
echo
echo "Run Pipeline completed."
