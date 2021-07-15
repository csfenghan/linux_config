# vim基本配置和插件安装方法

[其他插件安装方法及配置](./other_config/README.md)

## 依赖

1. [vim8以上版本](https://github.com/vim/vim)   //ubuntu20以前版本只能通过源码编译安装

2. [universal-ctags](https://github.com/universal-ctags/ctags)  //ubuntu20之前的版本只能通过下载源码编译的方式安装


## 安装
    git clone git@github.com:csfenghan/vim_config.git

    cd vim_config && cp .vimrc ~ && cp -r .vim ~

    sudo apt install clang cmake vim python3 python3-dev python3-pylint-common clang-format  universal-ctags ack

    进入vim运行PlugInstall安装插件

### 安装YCM（方案一）
删除.vimrc中Plug 'ycm-core/YouCompleteMe'的注释,然后

    cd ~/.vim/plugged
    git clone git@github.com:ycm-core/YouCompleteMe.git && cd YouCompleteMe
    git submodule update --init --recursive  #最好用代理
    python3 install.py --clang-completer     #这一步不要用代理，会报错

安装后把 .ycm_extra_conf.py复制到工程目录下就可以补全C/C++、Python还有JavaScript了

### 安装YCM（方案二）
直接使用命令行安装即可

    sudo apt install vim-addon-manager vim-youcompleteme 
    vim-addons install youcompleteme

安装后把 .ycm_extra_conf.py复制到工程目录下就可以补全了
ps：这种方法安装的python补全无法检索python3安装的第三方库，有缺陷

## 使用

example

    mkdir example && cd example
    cp ~/vim_config/plug_config/.workspace.vim .
    cp ~/vim_config/plug_config/.ycm_extra_conf.py .

使用时在.ycm_extra_conf.py文件添加所包含的头文件路径以及编译时要使用的选项，就可以实现c/cpp文件的自动补全，在.workspace.vim添加对应的编译器的编译选项，就可以对文件进行实时语法检查

## 其他
### neovim配置
neovim可以直接使用vim的配置，建立软连接即可

    ln -s ~/.vim .config/nvim
    ln -s ~/.vimrc .config/nvim/init.vim
    python3 -m pip install --user --upgrade pynvim	# 开启python3支持

