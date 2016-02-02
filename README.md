# nodeshop
    nodejs shop

1.CentOS6.5 安装 nodejs5.5 并配置到环境
-----------------------------------

    >>gedit /etc/profile
    export NODE_HOME=/soft/node-v5.5.0-linux-x64
    export PATH=$NODE_HOME/bin:$PATH
    >>source /etc/profile
    >>node -v


2.npm 设置为国内源
-----------------------------------
    >>npm config set registry https://registry.npm.taobao.org

3.安装必备模块 node-gyp
-----------------------------------
    >>yum install gcc-c++ make
    >>npm install node-gyp -g

4.安装WebStorm 并安装JDK7/JDK8
-----------------------------------
    >>rpm -ivh jdk-7u79-linux-x64.rpm
    >>gedit /etc/profile
    JAVA_HOME=/usr/java/jdk1.7.0_79
    CLASSPATH=.:$JAVA_HOME/lib.tools.jar
    PATH=$JAVA_HOME/bin:$PATH
    export JAVA_HOME CLASSPATH PATH
    >>source /etc/profile

5.安装Git 并生成ssh密钥,github帐号设置中添加id_rsa.pub密钥
-----------------------------------
    >>yum install git
    >>cd ~/.ssh
    >>ssh-keygen -t rsa -C "wizzer@qq.com"
    >>cat ~/.ssh/id_rsa.pub
    >>git clone git@github.com:Wizzercn/nodeshop.git

    >>git pull
    >>git commit -am 'note'
    >>git push


6.事务支持
------------------------------------
http://blog.evizija.si/sails-js-waterline-mysql-transactions/
