""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下是vim基础配置
""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu						"显示行号
syntax on					"语法高亮
set autoindent				"自动缩进
set cindent					"使用C/C++的缩进
set tabstop=4				"设置tab长度
set shiftwidth=4			"缩进空格数4

highlight Visual term=bold cterm=bold ctermbg=Red ctermfg=yellow	"设置Visual模式下选中的颜色

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936	"设置中文字体
set termencoding=utf-8
set encoding=utf-8

set visualbell				"关闭windows terminal响铃
set t_vb=					"windows terminal配置"

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下是安装的vim插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'file:///home/fenghan/.vim/bundle/YouCompleteMe'		"代码补全
Plug 'ludovicchabant/vim-gutentags'							"自动生成tags,需要安装universal_ctags
Plug 'dense-analysis/ale'									"动态检查"
Plug 'skywind3000/asyncrun.vim'								"自动运行"
Plug 'preservim/nerdtree'									"目录树
Plug 'Yggdroot/LeaderF'										"模糊查找、函数列表
Plug 'jiangmiao/auto-pairs'									"自动补全、删除左右括号
Plug 'Shougo/echodoc.vim'									"输入时代码提示"
Plug 'vim-airline/vim-airline'								"vim状态栏"
			
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM配置
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'		"默认的补全搜索路径
let g:ycm_confirm_extra_conf=0						"关闭每次对.ycm_extra_conf.py的检查
let g:ycm_key_invoke_completion = '<c-z>' 			"自动补全唤醒
let g:ycm_min_num_identifier_candidate_chars = 10	"输入10个字符才唤醒符号补全
let g:ycm_complete_in_strings = 1					"关闭string补全
let g:ycm_complete_in_comments = 0					"关闭注释补全
let g:ycm_semantic_triggers =  {'c,cpp,python,java,go': ['re!\w{2}']}	"实时语义补全"
let g:ycm_show_diagnostics_ui = 0					"关闭自动检查"
set completeopt=menu,menuone						"关闭自动预览"

"Ale配置
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_linters_explicit = 1

let g:ale_sign_error = '✗'								"error显示的符号"
let g:ale_echo_msg_error_str = 'Error'					"error和warning显示"
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {								
			\   'c++': ['clang'],
			\   'c': ['clang'],
			\   'python': ['pylint'],
			\}



"vim-gutentags配置
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']	"根目录
let g:gutentags_ctags_tagfile = '.tags'				"生成的文件名"
let s:vim_tags = expand('~/.cache/tags')			"生成的文件放入.cache"
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)							"检测不到~/.cache.tags就创建"
    silent! call mkdir(s:vim_tags, 'p')
    endif

"AsynRun配置
let g:asyncrun_open = 6								"设置窗口高度"
nnoremap <silent> <F5> :AsyncRun make <cr>			"设置F5为编译"
nnoremap <F9> :call asyncrun#quickfix_toggle(6)<cr>	"设置F9唤醒窗口"
nnoremap <silent> <F6> :AsyncRun make load_nand <cr>"设置<F6>加载程序"


"NERDTree配置
map <C-n> :NERDTreeToggle<CR>						"打开目录

"LeaderF配置
let g:Lf_ShortcutF = '<C-P>'						"使用ctrl+p模糊搜索
map <C-M> :LeaderfFunction!<cr>						"使用查看函数列表"

"echodoc配置
set noshowmode										"要使用插件必须关闭模式提示"
set cmdheight=2										"开启提示"
let g:echodoc#enable_at_startup=1

