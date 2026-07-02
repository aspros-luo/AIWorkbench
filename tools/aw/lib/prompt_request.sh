#!/bin/bash

# ==============================================================================
# Prompt Request
#
# 负责收集用户请求。
#
# 优先级：
# 1. CLI 参数
# 2. 交互输入
# ==============================================================================

collect_request() {

    local request="$1"

    if [ -n "$request" ]; then
        echo "$request"
        return
    fi

    echo
    echo "Please enter your request:"
    echo

    printf "> "

    read -r request

    echo "$request"

}
