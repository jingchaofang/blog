---
title: shasum md5 校验文件
date: 2019-12-26 17:04:09
tags:
---

MACOS

[hblock](https://github.com/hectorm/hblock/blob/master/README.md)的安装会校验文件的合法性（没有被篡改）：

```shell
curl -o /tmp/hblock 'https://raw.githubusercontent.com/hectorm/hblock/v2.1.3/hblock' \
  && echo '5aa752ceee6f4d10bdeab372ca557aefc3c7f32e4e10cceb4dddb3a86f6db4d3  /tmp/hblock' | shasum -c \
  && sudo mv /tmp/hblock /usr/local/bin/hblock \
  && sudo chown root:root /usr/local/bin/hblock \
  && sudo chmod 755 /usr/local/bin/hblock
```

```
shasum -h
man shasum
```

生成shasum值

```
shasum -a 256 hblock
```

校验shasum值

```shell
echo '5aa752ceee6f4d10bdeab372ca557aefc3c7f32e4e10cceb4dddb3a86f6db4d3 hblock' | shasum -c
```

man md5 查看使用

```
md5 hblock
MD5 (hblock) = 96bacc8ea4dad66eab09caf81641cd5e
比对官方提供的md5串
```
