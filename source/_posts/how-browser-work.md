---
title: How browser work
date: 2019-06-17 15:40:50
tags:
---


## reference

### 以下都是对浏览器运行原理的介绍

http://taligarsiel.com/Projects/howbrowserswork1.htm（英原）

https://www.cnblogs.com/wjlog/p/5744753.html（比较好的中译）

https://github.com/ScrappyZhang/How-browsers-work（中译）


## 相关问题

### 为什么排版引擎解析CSS选择器时一定要从右往左解析？

https://blog.csdn.net/u010403387/article/details/46970167

### why-do-browsers-match-css-selectors-from-right-to-left?

https://stackoverflow.com/questions/5797014/why-do-browsers-match-css-selectors-from-right-to-left/5813672#5813672


### 1

https://developers.google.com/speed/docs/insights/PrioritizeVisibleContent?csw=1


### css performance
https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Writing_efficient_CSS
链接失效，内容过时

https://blog.jjonline.cn/userInterFace/158.html(中译)

从百度快照摘取到以下信息：

Note: This document was originally written in 2000. Much has changed when it comes to writing CSS that is fast. This guide is not an accurate representation of the bottlenecks in the browser's rendering pipeline. For selectors in particular, read [CSS Selector Performance has changed! (For the better)](https://calendar.perfplanet.com/2011/css-selector-performance-has-changed-for-the-better/)for a more recent take. For improving CSS speed, investigate improving costs of Reflow (layout) and Paint.

CSS选择器性能已更改优化，为了提高CSS速度，请研究改进Reflow（布局）和Paint的成本。

https://calendar.perfplanet.com/2011/css-selector-performance-has-changed-for-the-better/

从上链接摘取信息如下（看原文浏览器做了哪些选择器优化）：

Antti contributes code to WebKit core and recently spent some time optimizing CSS selector matching. In fact, after finishing his work, he said:

> “My view is that authors should not need to worry about optimizing selectors (and from what I see, they generally don’t), that should be the job of the engine.”

http://johnotander.com/css/2015/06/10/css-performance/

### 

https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Performance_best_practices_for_Firefox_fe_engineers


### best practices

https://developer.mozilla.org/en-US/docs/tag/Best%20practices


### 专门收集web性能相关的文章和新闻的站点，性能日历

News and views from the web performance blogosphere

http://www.perfplanet.com/

https://calendar.perfplanet.com/2018/

