# vim配置

    git clone https://github.com/csfenghan/linux_config.git
    cp -r linux_config/vim_config/nvim ~/.config


## 配置COC

### 1. 安装Nodejs

coc对node的版本有所要求，安装时请注意

### 2.配置COC扩展并安装对应的LSP

一键配置

`CocInstall coc-clangd coc-pyright coc-json coc-cmake coc-git coc-pairs `

## 问题

1. 显示neovim不支持python3

   `pip3 install --user --upgrade pynvim`

