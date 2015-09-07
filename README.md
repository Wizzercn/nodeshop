# nodeshop
nodejs shop

1.CentOS6.5 安装 nodejs 并配置到环境
-----------------------------------
>>gedit /etc/profile
export NODE_HOME=/soft/node-v0.12.7-linux-x64
export PATH=$NODE_HOME/bin:$PATH
>>source /etc/profile
>>node -v

2.安装必备模块 node-gyp (CentOS6.5 自带Python2.6.6)
-----------------------------------
>>npm install node-gyp -g

3.安装WebStorm
-----------------------------------

4.安装Git 并生成ssh密钥,github帐号设置中添加密钥
-----------------------------------
>>yum install git
>>cd ~/.ssh
>>ssh-keygen -t rsa -C "wizzer@qq.com"
>>cat ~/.ssh/id_rsa.pub
>>git clone git@github.com:Wizzercn/nodeshop.git
