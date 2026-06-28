#!/bin/bash

KNOWLEDGE_DIR="$ROOT/shared/knowledge"

knowledge_exists() {
    [ -d "$KNOWLEDGE_DIR" ]
}

list_categories() {

    find "$KNOWLEDGE_DIR" \
        -mindepth 1 \
        -maxdepth 1 \
        -type d \
        -exec basename {} \; \
        | sort

}

show_category() {

    local category="$1"

    local dir="$KNOWLEDGE_DIR/$category"

    if [ ! -d "$dir" ]; then
        echo "Category not found."
        exit 1
    fi

    echo
    echo "Category : $category"
    echo "--------------------------------"

    find "$dir" \
        -maxdepth 1 \
        -type f \
        | sed 's|.*/||' \
        | sort

}

