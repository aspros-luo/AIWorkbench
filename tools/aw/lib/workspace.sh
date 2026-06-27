#!/bin/bash

workspace_exists() {
    [ -d "$WORKSPACE_DIR/$1" ]
}

workspace_path() {
    echo "$WORKSPACE_DIR/$1"
}
