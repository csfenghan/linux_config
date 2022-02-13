# 其他配置

## 1. zsh配置

### 安装
    sudo apt install zsh
    chsh -s /bin/zsh

### 配置
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

## 2. wsl代理设置

在.bashrc或者.zshrc中添加如下代码

```
# 设置主机代理
export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
alias proxy='
    export https_proxy="socks5://${hostip}:7890";
    export http_proxy="socks5://${hostip}:7890";
    export all_proxy="socks5://${hostip}:7890";
    echo -e "Acquire::http::Proxy \"http://${hostip}:7890\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
    echo -e "Acquire::https::Proxy \"http://${hostip}:7890\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
'
alias unproxy='
    unset https_proxy;
    unset http_proxy;
    unset all_proxy;
    sudo sed -i -e '/Acquire::http::Proxy/d' /etc/apt/apt.conf.d/proxy.conf;
    sudo sed -i -e '/Acquire::https::Proxy/d' /etc/apt/apt.conf.d/proxy.conf;
'
```

## 3. trash-cli配置

### 安装
	sudo apt install trash-cli

在.bashrc或者.zshrc中添加以提醒不要使用rm命令

    alias sudo='sudo '
    alias rm='echo "Do not use the rm command,use the trash command instead"'

