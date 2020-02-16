---
title: Node n Install Update Uninstall
date: 2019-01-24 18:18:45
tags:
---

## 本地使用n模块管理node多版本

[n模块安装node多版本](https://github.com/tj/n)

[有人建议](https://github.com/tj/n/issues/540)```n uninstall```做n卸载

n模块README介绍了[n-install](https://github.com/mklement0/n-install)脚本工具安装n，可以集成管理(安装、更新、卸载)n模块应用，推荐采用此工具

```
curl -L https://git.io/n-install | bash 一条命令安装n
n-update 命令更新n
n-uninstall 命令卸载n
```

n模块安装node遇到curl问题，暂未探究，改用nvm

```
curl: (35) LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to nodejs.org:443
```

## nvm

https://github.com/nvm-sh/nvm

一条命令语句安装
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```

如果遇到nvm命令找不到，README有详细解决说明

```
nvm --help
nvm insatll --lts 稳定版本
nvm install 6.14.4
nvm use --lts
nvm use 6.14.4
To set a default Node version to be used in any new shell, use the alias 'default':
nvm alias default 6.14.4
```

可以配置.nvmrc在不同项目自动使用不同的node版本

## 清理本地的旧安装

手动卸载npm指导
https://docs.npmjs.com/misc/removing-npm

sudo npm uninstall npm -g

rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/npm*

手动卸载node指导
https://stackabuse.com/how-to-uninstall-node-js-from-mac-osx/


find / -name node
find /usr/local/lib/dtrace/ -name node.d


sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/lib/node
sudo rm -rf /usr/local/include/node
sudo rm -rf /usr/local/bin/node
sudo rm -rf /usr/local/bin/npm
sudo rm -rf /usr/local/bin/npx
sudo rm -rf ~/n
sudo rm -rf /usr/local/n
sudo rm -rf ~/.npmrc
sudo rm -rf ~/.node-gyp
sudo rm -rf ~/.npm
sudo rm -rf ~/.node_repl_history

sudo rm -rf /usr/local/share/man/man1/node*
sudo rm -rf /usr/local/share/man/man1/npm*

sudo rm -rf /usr/local/lib/dtrace/node.d

sudo rm -rf /usr/local/share/doc/node

sudo rm -rf /usr/local/share/systemtap/tapset/node.stp

## 全局安装的模块



