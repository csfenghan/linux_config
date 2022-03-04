"需要安装universal_ctags,build-essential cmake vim-nox python3-dev,vim要高于8.0，g++要高于8.0，主要需要注意的是YCM的安装
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下是安装的vim插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"Plug 'ycm-core/YouCompleteMe'				"代码补全
Plug 'ludovicchabant/vim-gutentags'			"自动生成tags,需要安装universal_ctags
"Plug 'dense-analysis/ale'				"动态检查"
Plug 'preservim/nerdtree'				"目录树
Plug 'Yggdroot/LeaderF'					"模糊查找、函数列表
Plug 'jiangmiao/auto-pairs'				"自动补全、删除左右括号
Plug 'Raimondi/delimitMate'             "自动补全括号"
"Plug 'Chiel92/vim-autoformat'				"格式化代码
Plug 'Shougo/echodoc.vim'				"输入时代码提示"
Plug 'vim-airline/vim-airline'				"vim状态栏"
"Plug 'puremourning/vimspector'				"调试"
Plug 'iamcco/mathjax-support-for-mkdp'			"Markdown配置"
Plug 'iamcco/markdown-preview.vim'
Plug 'voldikss/vim-floaterm'				"终端显示"
Plug 'mileszs/ack.vim'					"vim全局搜索"
Plug 'mattn/emmet-vim'                                  "html插件"
Plug 'altercation/vim-colors-solarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}     "coc跳转"
Plug 'airblade/vim-gitgutter'           "git插件"

			
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM配置
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0				"关闭每次对.ycm_extra_conf.py的检查
let g:ycm_key_invoke_completion = '<c-z>' 		"自动补全唤醒
let g:ycm_min_num_identifier_candidate_chars = 10	"输入10个字符才唤醒符号补全
let g:ycm_complete_in_strings = 1			"关闭string补全
let g:ycm_complete_in_comments = 0			"关闭注释补全
let g:ycm_semantic_triggers =  {'cuda,c,cpp,python,javascript,go': ['re!\w{2}']}	"实时语义补全"
let g:ycm_show_diagnostics_ui = 0					"关闭自动检查"
set completeopt=menu,menuone						"关闭自动预览"
let g:ycm_add_preview_to_completeopt = 0

"Ale配置
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_linters_explicit = 1

let g:ale_sign_error = '✗'				"error显示的符号"
let g:ale_sign_warning='-'
let g:ale_echo_msg_error_str = 'Error'			"error和warning显示"
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {								
			\   'cpp': ['g++','cppcheck'],
			\   'c': ['gcc','cppcheck'],
			\   'python': ['pylint'],
            \   'cuda': ['nvcc'],
			\}

let g:ale_c_cc_options = '-Wall -std=gnu11'
let g:ale_cpp_cc_options = '-Wall -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_python_pylint_options= '--errors-only --extension-pkg-whitelist=PyQt5,cv2,torch'
let g:ale_cuda_nvcc_options = '-std=c++11'

nmap sp <Plug>(ale_previous_wrap)			"sp跳到前一个错误
nmap sn <Plug>(ale_next_wrap)				"sn跳到下一个错误

"vim-gutentags配置
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']	"根目录
let g:gutentags_ctags_tagfile = '.tags'				"生成的文件名"
let s:vim_tags = expand('~/.cache/tags')			"生成的文件放入.cache"
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)				"检测不到~/.cache.tags就创建"
    silent! call mkdir(s:vim_tags, 'p')
    endif

"NERDTree配置
map <C-n> :NERDTreeToggle<CR>				"打开目录

"auto-pairs
let g:AutoPairsMultilineClose = 0   "启用跳出多行括号对，默认为1，为0则只能跳出同一行的括号。
let g:AutoPairsMapCR = 1            "把ENTER键映射为换行并缩进，默认为1。

"LeaderF配置
let g:Lf_ShortcutF = '<C-P>'				"使用ctrl+p模糊搜索
map <C-M> :LeaderfFunction!<cr>				"使用查看函数列表"
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }


"auto format配置
let g:autoformat_verbosemode=1 				"开启详细模式便于查错
autocmd BufWrite *.c,*.cpp,*.py 			"设置发生保存事件时执行格式化

noremap <F1> :Autoformat<CR>				"设置F1为格式化
let g:autoformat_verbosemode=1

let g:formatdef_clangformat_my= '"clang-format -style=\"{BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 100}\""' 
let g:formatters_c = ['clangformat_my']
let g:formatters_cpp = ['clangformat_my']

"echodoc配置
set noshowmode						"要使用插件必须关闭模式提示"
set cmdheight=2						"开启提示"
let g:echodoc#enable_at_startup=1

"vimspector配置
"nmap <F2> <Plug>VimspectorStepOver	
"nmap <F3> <Plug>VimspectorStepInto
"nmap <F4> <Plug>VimspectorStepOut

"nmap <F5> <Plug>VimspectorContinue
"nmap <C-F5> <Plug>VimspectorRestart
"nmap <F6> <Plug>VimspectorPause
"nmap <C-F6> <Plug>VimspectorStop
"nmap <F7> :call vimspector#Reset()<cr>

"nmap <F8> <Plug>VimspectorToggleBreakpoint
"nmap <C-F8> <Plug>VimspectorToggleConditionalBreakpoint	
"nmap <F9> <Plug>VimspectorRunToCursor	

"floaterm配置
let g:floaterm_keymap_toggle = '<F8>'
let g:floaterm_keymap_kill= '<C-D>'

"ack.vim配置
let g:ackhighlight = 1
map <F4> :Ack 

" coc配置
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
 
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
 
" don't give |ins-completion-menu| messages.
set shortmess+=c
 
" always show signcolumns
set signcolumn=yes
 
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gc <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
 
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
 
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
 
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
 
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
 
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
 
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
 
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
 
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
 
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" git插件
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下是vim基础配置
""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu						"显示行号
syntax on					"语法高亮
syntax reset
set autoindent					"自动缩进
set cindent					"使用C/C++的缩进
set backspace=2					"可以删除任何字符
set tabstop=4					"设置tab长度
set shiftwidth=4				"缩进空格数4
set expandtab					"用空格代替tab
set t_Co=256					"解决tmux下颜色过深
set softtabstop=4               "使set expandtab情况下，backspace可以回退tab"

" 默认彩色屏幕配置,如果要使用水墨屏还需要做修改

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936	"设置中文字体
set termencoding=utf-8
set encoding=utf-8

set visualbell						"关闭windows terminal响铃
set t_vb=						"windows terminal配置"

" gvim和vim配色配置
if has('gui_running')
    set guioptions-=T  " no toolbar
    set guioptions-=m  " no menu
    set background=dark
    colorscheme solarized
    "set lines=60 columns=108 linespace=0
    if has('gui_win32')
        set guifont=DejaVu_Sans_Mono:h10:cANSI
    else
        set guifont=Monospace\ Regular\ 24
    endif
else
    colorscheme zellner
    highlight Visual term=bold cterm=bold ctermbg=grey ctermfg=yellow	"设置Visual模式下选中的颜色
    highlight PMenu ctermfg=black ctermbg=gray guifg=black guibg=black
    highlight PMenuSel ctermfg=blue ctermbg=darkgrey guifg=darkgrey guibg=black
endif

"优先读取本地的vim配置
if filereadable("./.workspace.vim")
    source ./.workspace.vim
endif


