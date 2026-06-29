#!/bin/bash

source "$ROOT/tools/aw/lib/prompt_builder.sh"
source "$ROOT/tools/aw/lib/prompt_renderer.sh"

build_prompt() {

    local workspace="$1"

    prompt_build "$workspace"

    render_prompt "$workspace"

}
