FROM ubuntu:20.04

MAINTAINER piece

# 系統更新
RUN apt -y update
RUN apt -y upgrade

# 安裝 ping netstat dig nslookup 工具
RUN apt -y install net-tools iputils-ping dnsutils htop

# 安裝開發工具
RUN apt -y install zsh vim git curl telnet ack wget php

# 安裝 nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# 安裝 ohmyzsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安裝 zsh autosuggestion
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 安裝 ohmyzsh 樣式
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN sed -i 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc

WORKDIR /root

CMD ["tail", "-f", "/dev/null"]