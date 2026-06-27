#!/bin/bash

copy_workspace_template() {

    local workspace_name="$1"

    cp -R \
        "$TEMPLATE_DIR" \
        "$WORKSPACE_DIR/$workspace_name"

}
