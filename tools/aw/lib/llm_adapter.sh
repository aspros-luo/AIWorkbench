#!/bin/bash

source "$ROOT/tools/aw/lib/ollama_client.sh"

llm_generate() {

    local workspace="$1"

    echo
    echo "===================================="
    echo " LLM Adapter"
    echo "===================================="

    echo
    echo "Provider:"
    echo "------------------------------------"

    echo "Ollama"

    echo
    echo "Generating..."
    echo

    ollama_generate "$workspace"

}
