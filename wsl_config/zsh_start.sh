
# 设置主机代理
export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
alias proxy='
    export https_proxy="socks5://${hostip}:7890";
    export http_proxy="socks5://${hostip}:7890";
    export all_proxy="socks5://${hostip}:7890";
    echo -e "Acquire::http::Proxy \"http://${hostip}:7890\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
    echo -e "Acquire::https::Proxy \"http://${hostip}:7890\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
'

VIRTUAL_ENV_DISABLE_PROMPT="true"

alias unproxy='
    unset https_proxy;
    unset http_proxy;
    unset all_proxy;
    sudo sed -i -e '/Acquire::http::Proxy/d' /etc/apt/apt.conf.d/proxy.conf;
    sudo sed -i -e '/Acquire::https::Proxy/d' /etc/apt/apt.conf.d/proxy.conf;
'
alias sudo='sudo '
alias rm='echo "Do not use the rm command,use the trash command instead"'
alias w2l='python.exe ~/scripts/w2l.py '

export PATH=$PATH:/home/fenghan/scripts
