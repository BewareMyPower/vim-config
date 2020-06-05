#!/bin/bash
set -o errexit
cd `dirname $0`

VIM_SNIPPETS_DIR=$HOME/.vim/plugged/vim-snippets
cp ./snippets/cpp.snippets $VIM_SNIPPETS_DIR/snippets/ -f
cp ./UltiSnips/cpp.snippets $VIM_SNIPPETS_DIR/UltiSnips/ -f
