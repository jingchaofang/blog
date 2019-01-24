---
title: QPS
date: 2019-01-23 14:32:02
tags:
---

## 单机

tc-bac-orp-nodejs-20549.tc

### 通过log查看qps

ssh fangjingchao_vd@relay01.baidu.com
ssh tc-bac-orp-nodejs-20549.tc
cdapp video-webapp

/home/matrix/containers/2356858.tc_video-webapp_2409/home/work/orp/log/access

[yog2的access日志访问日志格式说明](https://github.com/fex-team/yog-log/blob/master/doc/odp-log.md)

按分，先sort可以合并不连续重复
```
grep access.log.2019012315 -e / |cut -d' ' -f5|cut -d':' -f3|sort|uniq -c
```

按分，先sort可以合并不连续重复
```
grep access.log.2019012315 -e /liebian |cut -d' ' -f5|cut -d':' -f3|sort|uniq -c
```

按秒，顺序排，最后一个就是每秒的最大访问量
```
grep access.log.2019012315 -e / |cut -d' ' -f5|cut -d':' -f4|uniq -c|sort -nk 1
```

按秒，逆序排第一个
```
grep access.log.2019012315 -e / |cut -d' ' -f5|cut -d':' -f4|uniq -c|sort -rnk 1|head -1
``

按秒，访问量前10
```
grep access.log.2019012315 -e / |cut -d' ' -f5|cut -d':' -f4|uniq -c|sort -rnk 1|head -10
```

查看日志量字节最大的，可以认为是access中访问量最高的一个时间段
```
ll -S
```
可以看到最大的是
```
-rw-r--r--  1 work work 23202801 Jan 22 21:59 access.log.2019012221
-rw-r--r--  1 work work 22406046 Jan 22 20:59 access.log.2019012220
-rw-r--r--  1 work work 22111681 Jan 16 21:59 access.log.2019011621
```
依次查看QPS
```
grep access.log.2019012221 -e / |cut -d' ' -f5|cut -d':' -f4|uniq -c|sort -rnk 1|head -10
```
21 52
21 21
21 00
21 00
20 38
20 12
19 52
19 38
19 36
19 35
```
grep access.log.2019012220 -e / |cut -d' ' -f5|cut -d':' -f4|uniq -c|sort -rnk 1|head -10
```
25 27
23 53
22 14
22 01
21 41
21 26
21 21
21 11
21 01
20 57
```
grep access.log.2019011621 -e / |cut -d' ' -f5|cut -d':' -f4|uniq -c|sort -rnk 1|head -10
```
26 46
23 10
22 08
21 29
21 15
20 57
20 52
20 31
20 28
20 25

## 查看日志行数
```
wc -l access.log.2019012022
```
```
vi access.log.2019012022
shift + g
上下键
```




### 通过qps计算机器扩容



## 相关术语百度河图解释

[matrix](http://hetu.baidu.com/platform/detail/590)

## 用到的命令
man grep
man cut
man uniq
man sort
man wc

uniq 去掉连续的重复行
uniq检查重复行的时候，只会检查相邻的行，加上sort命令把各行先排个序，把相同的行放到一起，然后再用uniq就好了


## recommend
Linux：cut命令详解
https://www.cnblogs.com/Spiro-K/p/6361646.html

Linux常用基本命令:uniq-去重复
https://www.cnblogs.com/ghostwu/p/9064689.html

sort | uniq -c | sort -rnk 1 在数据统计中的重要用途------按频率排序
https://blog.csdn.net/stpeace/article/details/53240201

统计文件中出现次数最多的前10个单词
https://www.cnblogs.com/flish/p/5806417.html

通过线上log看qps
http://www.360doc.com/content/18/1007/20/45689189_792765865.shtml
根据日志看QPS
https://www.cnblogs.com/lnas01/p/5978439.html

根据访问日志计算服务器的qps
https://blog.csdn.net/washCutBlow/article/details/70740367

线上环境如何查看实时，历史QPS。
https://www.jianshu.com/p/dd0e1224d92c

https://blog.csdn.net/varyall/article/details/79545123

https://blog.csdn.net/if9600/article/details/70162646

https://blog.csdn.net/liuzhoulong/article/details/8995450

https://www.magentonotes.com/what-is-qps.html

你想建设一个能承受500万PV/每天的网站吗？如果计算呢？
https://blog.csdn.net/elf8848/article/details/83874484