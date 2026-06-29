#!/bin/bash

memory_file(){

    local workspace="$1"
    local type="$2"

    case "$type" in

    project)
        echo "$WORKSPACE_DIR/$workspace/ai/memory/PROJECT_MEMORY.md"
        ;;

    decisions)
        echo "$WORKSPACE_DIR/$workspace/ai/memory/DECISIONS.md"
        ;;

    session)
        echo "$WORKSPACE_DIR/$workspace/ai/memory/SESSION_MEMORY.md"
        ;;

    todo)
        echo "$WORKSPACE_DIR/$workspace/ai/memory/TODO_MEMORY.md"
        ;;

    *)
        return 1
        ;;

    esac

}


show_memory(){

    local workspace="$1"
    local type="$2"

    FILE=$(memory_file "$workspace" "$type")


    if [ ! -f "$FILE" ]; then

        echo "[WARN] Memory missing:"
        echo "$FILE"

        return 1

    fi


    echo
    echo "------------------------------------"
    echo "$(basename "$FILE")"
    echo "------------------------------------"

    cat "$FILE"

}


append_decision(){

    local workspace="$1"
    local title="$2"
    local reason="$3"
    local impact="$4"

    local file="$WORKSPACE_DIR/$workspace/ai/memory/DECISIONS.md"


    cat >> "$file" <<EOT

---

日期：
$(date +"%Y-%m-%d")

决定：
$title

原因：
$reason

影响：
$impact

EOT

}


memory_append(){

    local workspace="$1"
    local type="$2"
    local content="$3"

    FILE=$(memory_file "$workspace" "$type")

    [ -z "$FILE" ] && {

        echo "Unknown memory type."

        return 1

    }

    echo "$content" >> "$FILE"

}

memory_read(){

    local workspace="$1"
    local type="$2"

    show_memory "$workspace" "$type"

}

