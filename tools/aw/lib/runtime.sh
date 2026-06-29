#!/bin/bash

runtime_init() {

    if [ -z "$ROOT" ]; then

        SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

        ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

    fi

    export ROOT

    export CONFIG_FILE="$ROOT/config/config.yaml"

    export TEMPLATE_DIR="$ROOT/shared/templates/workspace"

    export WORKSPACE_DIR="$ROOT/workspaces"

}

runtime_init
