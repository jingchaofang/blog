---
title: ifconfig
date: 2019-12-27 16:50:25
tags:
---

MAC 下ifconfig看IP

ifconfig在linux下经常是用来查看对应的端口的IP是多少。但是..MAC下会显示特别多的硬件设备让人搞不清楚到底IP是哪里来的。

可以通过这个命令去看硬件和其对应的缩写
```
networksetup -listallhardwareports
```
电脑链接的是wifi，所以简写是en0

mac命令查看纯ip
```
ifconfig | grep 'inet[[:blank:]]' | grep -v '127.0.0.1' | grep 'broadcast' | sed 's/inet[[:blank:]]//' | sed 's/[[:blank:]]netmask.*//'
```