# 我的vim配置

## 安装

    sudo apt install python3-pylint-common clang-format  universal-ctags ack gdb
    git clone https://github.com/csfenghan/linux_config.git
    cd vim_config && cp .vimrc ~ && cp -r .vim ~
    进入vim运行PlugInstall安装插件（最好使用代理）

### 方案一：使用COC实现跳转、补全和语法检查

+ 安装nodejs

  coc对node的版本有所要求，安装时请注意

+ 安装对应语言的COC扩展和代码补全后端（LSP）

  进入vim，运行`:CocInstall coc-clangd`安装对应的C/C++插件，然后安装`clangd`命令（或者进入vim后会自动安装）

  运行`:CocInstall coc-jedi`安装python插件

  安装完成后其实就可以补全和动态检查了，不需要YCM也可以
  
+ 其他插件

  1. `coc-cmake`
  2. `coc-json`
  3. `coc-git`

  

### 方案二：安装YCM

删除.vimrc中Plug 'ycm-core/YouCompleteMe'的注释,然后进入vim使用代理运行PlugInstall命令

    sudo apt install clang cmake vim python3 python3-dev 
    cd ~/.vim/plugged/YouCompleteMe
    python3 install.py --clang-completer     

安装后把 .ycm_extra_conf.py复制到工程目录下就可以补全C/C++、Python了

