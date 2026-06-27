#!/bin/bash

# ==========================================
# AIWorkbench Common Library
# ==========================================

[ -z "$ROOT" ] && {
    echo "[ERROR] ROOT is not initialized."
    exit 1
}

[ -z "$CONFIG_FILE" ] && {
    CONFIG_FILE="$ROOT/config/config.yaml"
}

TEMPLATE_DIR="$ROOT/shared/templates/workspace"
WORKSPACE_DIR="$ROOT/workspaces"

info() {
    echo "[INFO ] $1"
}

pass() {
    echo "[PASS ] $1"
}

fail() {
    echo "[FAIL ] $1"
}

die() {
    echo "[ERROR] $1"
    exit 1
}

exists_dir() {
    [ -d "$1" ]
}

exists_file() {
    [ -f "$1" ]
}
