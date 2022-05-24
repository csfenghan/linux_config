
"""""""""""""""""""""""""""""""""""""""
"  vim插件
"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}         "coc插件（补全、跳转、语法检查）
    Plug 'Yggdroot/LeaderF'                                 "文件、函数管理
    Plug 'voldikss/vim-floaterm'                            "内置终端
    Plug 'vim-airline/vim-airline'                          "vim状态栏
    Plug 'altercation/vim-colors-solarized'                 "vim主题
    Plug 'ap/vim-buftabline'                                "buffer状态栏
    Plug 'preservim/nerdtree'                               "目录树
    Plug 'puremourning/vimspector'
    Plug 'csfenghan/custom-vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""
"  基础配置
"""""""""""""""""""""""""""""""""""""""
set jumpoptions+=stack
set nu	
syntax on
set tabstop=4
set shiftwidth=4
set expandtab                                               "空格代替tab
set softtabstop=4                                           "使用空格代替tab时，backspace可以回退tab
set backspace=2                                             "可以删除任意字符
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gbk,gbk2312
set fileencoding=utf-8

"set background=dark
set background=light
colorscheme solarized
