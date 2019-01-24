---
title: rz sz
date: 2019-01-21 18:57:46
tags:
---

rz(receive Zmodem)
sz(send Zmodem)

远程文件传输的工具有很多，例如rz、sz、scp、sftp、ftp等。公司的测试环境服务器需要通过跳板机（relay）访问，使用rz、sz传输更为方便。

Mac中的命令终端不支持使用rz和sz命令进行文件上传和下载，也不支持安装lrzsz进行功能扩展。

可以安装另一种终端iTerm2，然后对iTerm2进行扩展安装lrzsz，这样Mac就可以使用rz和sz命令进行文件传输了。

## 下载安装iterm2
```
https://www.iterm2.com/
```

## 使用brew安装lrzsz

```
brew install lrzsz
```

## 下载并安装automatic zmoderm for iTerm2

lrszs命令安装成功之后就是要创建两个脚本到/usr/local/bin目录，脚本地址：https://github.com/mmastrac/iterm2-zmodem

cd /usr/local/bin
```
wget https://raw.githubusercontent.com/mmastrac/iterm2-zmodem/master/iterm2-recv-zmodem.sh
wget https://raw.githubusercontent.com/mmastrac/iterm2-zmodem/master/iterm2-send-zmodem.sh
```
wget是大多是*nix系统中标准的命令行下载工具。不过Mac中并不自带wget，取而代之的是命令行下载工具curl。也可以homebrew安装wget。
```
curl -O https://raw.githubusercontent.com/mmastrac/iterm2-zmodem/master/iterm2-recv-zmodem.sh
curl -O https://raw.githubusercontent.com/mmastrac/iterm2-zmodem/master/iterm2-send-zmodem.sh
```
sudo chmod 777 /usr/local/bin/iterm2-*

## 修改iterm2的配置添加iTerm2 trigger

打开iterm2 -> 同时按 command和,键 -> Profiles -> Default -> Advanced -> Triggers的Edit按钮

配置如下：
```
Regular expression: \*\*B0100
Action: Run Silent Coprocess
Parameters: /usr/local/bin/iterm2-send-zmodem.sh
Instant: checked

Regular expression: \*\*B00000000000000
Action: Run Silent Coprocess
Parameters: /usr/local/bin/iterm2-recv-zmodem.sh
Instant: checked
```

## 使用rz,sz命令

进入到一个目录下sz文件名称，可以下载一个文件，最后选择下载到的目录

进入到一个目录下rz可以上传一个文件，最后选择上传的文件

## 相关检索

[Linux下几种文件传输命令 sz rz sftp scp](https://blog.csdn.net/lisheng19870305/article/details/51890029)

[Mac OS X 中一些常用的命令行技巧](https://blog.csdn.net/robertsong2004/article/details/53957767)

## TODO

写个小脚本自动完成
