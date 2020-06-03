set encoding=utf-8
syntax enable
set number
let mapleader=";"

call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'dense-analysis/ale'
call plug#end()

"" YCM配置
" 全局YCM配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0  " 不提示是否载入本地ycm_extra_conf文件
let g:ycm_min_num_of_chars_for_completion = 2  " 输入第2个字符就罗列匹配项

" Ctrl+J跳转至定义、声明或文件
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|

" 语法关键字、注释、字符串补全
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" 从注释、字符串、tag文件中收集用于补全信息
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" Ctrl+X 主动触发补全，默认快捷键是 Ctrl+Space，可能与输入法冲突
let g:ycm_key_invoke_completion = '<c-x>'

" 禁止快捷键触发补全
""noremap <c-m> <NOP>
""
""" 输入2个字符就触发补全（可能拖慢速度，暂时禁用）
""let g:ycm_semantic_triggers = {
""            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
""            \ 'cs,lua,javascript': ['re!\w{2}'],
""            \ }

let g:ycm_show_diagnostics_ui = 0  " 禁用YCM自带语法检查(使用ale)

" 防止YCM和Ultisnips的TAB键冲突，禁止YCM的TAB
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"" nerdtree
nmap <Leader><Leader> :NERDTreeToggle<CR>
let NERDTreeWinSize=32          " 设置NERDTree子窗口宽度
let NERDTreeWinPos="right"      " 设置NERDTree子窗口位置
let NERDTreeShowHidden=1        " 显示隐藏文件
let NERDTreeMinimalUI=1         " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1  " 删除文件时自动删除文件对应 buffer

"" ale
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \ 'cpp': ['cppcheck', 'gcc'],
            \ }
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''


"" --------------------------------------------------
"" 下列配置均为插件无关的代码，放到最末尾
"" --------------------------------------------------
" 设置背景是黑色
set background=dark
set confirm
filetype indent on
" 禁止铃声
""set visualbell
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自适应不同语言的智能缩进
filetype indent on
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 将制表符扩展为空格
set expandtab
" 让 vim 把连续数量的空格视为一个制表符
"set softtabstop=4
" 显示行号
set number
"搜索忽略大小写
"set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 启用折叠
set foldenable
" 基于语法的代码折叠
set foldmethod=syntax
" 最高折叠层数
set foldlevel=3
set nofoldenable
" 识别各种编码
set fileencodings=utf-8,gbk,big5
" 禁止生成临时文件
set nobackup
set noswapfile

" 括号补全
inoremap ( ()<ESC>i
inoremap [ []<LEFT>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<ESC>O

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
                            
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>

" 代码模板
autocmd BufNewFile *.cc,*.cpp,*.c,*.sh exec ":call SetTitle()"
function SetTitle()
    if &filetype == 'cpp'
        call setline(1, "#include <iostream>")
        call setline(2, "using namespace std;")
        call setline(3, "")
        call setline(4, "int main(int argc, char* argv[]) {")
        call setline(5, "    return 0;")
        call setline(6, "}")
    elseif &filetype == 'c'
        call setline(1, "#include <stdio.h>")
        call setline(2, "#include <stdlib.h>")
        call setline(3, "")
        call setline(4, "int main(int argc, char* argv[]) {")
        call setline(5, "  return 0;")
        call setline(6, "}")
    elseif &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call setline(2, "set -o errexit")
        call setline(3, "cd `dirname $0`")
    endif
    " 新建文件后自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunction

autocmd BufNewFile *.h exec ":call SetTitleForH()"
function SetTitleForH()
    " 比如 xxx_yyy.h，对应的 if-guard 宏是 XXX_YYY_H，如果要加上项目名特定前缀，
    " 比如项目 xyz 的每个头文件宏都是以 XYZ_ 作为开头，修改下面的 prefix 变量
    let prefix = ""
    let name = toupper(prefix.expand("%"))
    let name = join(split(name, '\.'), '_')
    let name = join(split(name, '-'), '_')
    call setline(1, join(['#ifndef', name]))
    call setline(2, join(['#define', name]))
    call setline(3, join(['#endif  //', name]))
    exec ":2"
endfunction
