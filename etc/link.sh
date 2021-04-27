#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# echo $SCRIPT_DIR

ln -sf $SCRIPT_DIR/markdownlintrc ~/.markdownlintrc
