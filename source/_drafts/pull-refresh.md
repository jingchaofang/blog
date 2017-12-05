---
title: pull-refresh
tags:
---

http://www.alloyteam.com/2017/04/secrets-of-mobile-web-scroll-bars-and-drop-refresh/

AlloyPullRefresh

在移动端，使用滚动来处理业务逻辑的情况有很多，例如列表的滚动加载数据，下拉刷新等等都需要利用滚动的相关知识，但是滚动事件在不同的移动端机型却又有不同的表现，下面就来一一总结一下。

滚动事件：即onscroll事件，形成原因通俗解释是当子元素的高度超过父元素的高度时且父元素的高度时定值window除外，就会形成滚动条，滚动分为两种：局部滚动和body滚动。

onscroll方法： 一般情况下当我们需要监听一个滚动事件时通常会用到onscroll方法来监听滚动事件的触发。
如果在浏览器上调试这个方法在浏览器上很好用，但是如果跑在手机端就没有想象中的效果了。

body滚动：在移动端如果使用body滚动，意思就是页面的高度由内容自动撑大，body自然形成滚动条，这时我们监听window.onscroll，发现onscroll并没有实时触发，只在手指触摸的屏幕上一直滑动时和滚动停止的那一刻才触发,采用了wk内核的webview除外。

局部滚动：在移动端如果使用局部滚动，意思就是我们的滚动在一个固定宽高的div内触发，将该div设置成overflow:scroll/auto;来形成div内部的滚动。

不同机型onscroll事件触发情况:

||body滚动|局部滚动|
|-----|-----|-----|
|ios uiwebview|不能实时触发|不能实时触发|
|android|实时触发|实时触发|
|ios wkwebview 内核|实时触发|实时触发|
