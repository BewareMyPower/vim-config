# .bashrc

# User specific aliases and functions

# Fix CentOS-7 bash complete problem
shopt -u progcomp

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias clc='clear'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export SOFTWARE=$HOME/software
export PATH=$SOFTWARE/bin:$PATH

export PATH=$SOFTWARE/cmake-3.17.2/bin:$PATH

export GCC_DIR=$SOFTWARE/gcc-10.1.0
export PATH=$GCC_DIR/bin:$PATH
export LD_LIBRARY_PATH=$GCC_DIR/lib64:$LD_LIBRARY_PATH

export Z3_DIR=$SOFTWARE/z3
export PATH=$Z3_DIR/bin:$PATH
export LD_LIBRARY_PATH=$Z3_DIR/lib:$LD_LIBRARY_PATH

export CLANG_DIR=$SOFTWARE/clang-10.1
export PATH=$CLANG_DIR/bin:$PATH
export LD_LIBRARY_PATH=$CLANG_DIR/lib:$LD_LIBRARY_PATH

export PYTHON3_DIR=$SOFTWARE/Python-3.8.3
export PATH=$PYTHON3_DIR/bin:$PATH
export LD_LIBRARY_PATH=$PYTHON3_DIR/lib:$LD_LIBRARY_PATH

export PATH=$SOFTWARE/vim-8.2/bin:$PATH

export PATH=$SOFTWARE/cppcheck-1.88:$PATH
