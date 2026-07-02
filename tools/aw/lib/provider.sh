#!/bin/bash

provider_generate() {

    local workspace="$1"
    local request="$2"

    local provider

    provider=$(
        grep '^provider:' \
        "$WORKSPACE_DIR/$workspace/run.yaml" \
        | awk '{print $2}'
    )

    case "$provider" in

        ollama)

            ollama_generate "$workspace" "$request"

            ;;

        *)

            echo

            echo "Unknown provider: $provider"

            return 1

            ;;

    esac

}
