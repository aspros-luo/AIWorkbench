#!/bin/bash

copy_dir() {
    cp -R "$1" "$2"
}

remove_dir() {
    rm -rf "$1"
}

make_dir() {
    mkdir -p "$1"
}

exists() {
    [ -e "$1" ]
}
