# 我的vim配置

## 环境

1. Ubuntu20.04
2. \>=vim8

## 安装

    sudo apt install python3-pylint-common clang-format  universal-ctags ack gdb
    git clone https://github.com/csfenghan/linux_config.git
    cd vim_config && cp .vimrc ~ && cp -r .vim ~
    进入vim运行PlugInstall安装插件（最好使用代理）

### 安装YCM（方案一）
删除.vimrc中Plug 'ycm-core/YouCompleteMe'的注释,然后进入vim使用代理运行PlugInstall命令

    sudo apt install clang cmake vim python3 python3-dev 
    cd ~/.vim/plugged/YouCompleteMe
    python3 install.py --clang-completer     

安装后把 .ycm_extra_conf.py复制到工程目录下就可以补全C/C++、Python了

### 安装YCM（方案二）
直接使用命令行安装即可

    sudo apt install vim-addon-manager vim-youcompleteme 
    vim-addons install youcompleteme

安装后把 .ycm_extra_conf.py复制到工程目录下就可以补全了
ps：这种方法安装的python补全无法检索python3安装的第三方库，有缺陷

