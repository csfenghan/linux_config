# vim基本配置和插件安装方法

# 依赖

1. [vim8以上版本](https://github.com/vim/vim)   //ubuntu20以前版本只能通过源码编译 安装

2. [universal-ctags](https://github.com/universal-ctags/ctags)  //ubuntu20之前的版 本只能通过下载源码编译的方式安装

# 安装
    git clone git@github.com:csfenghan/vim_config.git
    cd vim_config && cp .vimrc ~ && cp -r .vim ~
    进入vim运行PlugInstall安装插件
    运行./install_ycm.sh安装ycm补全

