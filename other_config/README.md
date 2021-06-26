# 其他配置

## 1.zsh配置

### 安装
    sudo apt install zsh
	chsh -s /bin/zsh

### 配置
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

## 2. tmux配置

### 安装
    sudo apt install tmux
	cp ~/vim_config/other_config/.tmux.conf ~/

## 3.trash-cli配置

### 安装
	sudo apt install trash-cli
在.bashrc或者.zshrc中添加以提醒不要使用rm命令

	alias rm='echo " This is not the command you are looking for.If you really want use rm simply prepend a slash"; false'


