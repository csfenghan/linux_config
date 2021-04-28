# vim基本配置和插件安装方法

# 依赖

1. [vim8以上版本](https://github.com/vim/vim)	//ubuntu20以前版本只能通过源码编译安装

2. [universal-ctags](https://github.com/universal-ctags/ctags)	//ubuntu20之前的版本只能通过下载源码编译的方式安装

3. clang-format

4. python3-pylint-common

# 安装
    git clone git@github.com:csfenghan/vim_config.git
    cd vim_config && cp .vimrc ~ && cp -r .vim ~
然后进入vim，使用PlugInstall安装插件
最后，运行 ./install_ycm.sh 来安装ycm
