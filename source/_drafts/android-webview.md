---
title: Android Webview 前端扫盲
tags:
---

掌阅安卓插件书城采用Hyprid App模式生产

## 简介

在Android 4.4以下(不包含4.4)系统WebView底层实现是采用[WebKit](http://www.webkit.org/)内核，而在Android 4.4及其以上Google 采用了[chromium](http://www.chromium.org/)作为系统WebView的底层内核支持。内核的不同主要体现在后者提供更广的HTML5,CSS3,Javascript支持，能更好的支持H5的特性。

### 作用

* 显示和渲染Web页面
* 直接使用html文件（网络上或本地assets中）作布局
* 可和JavaScript交互调用

WebView控件功能强大，除了具有一般View的属性和设置外，还可以对url请求、页面加载、渲染、页面交互进行强大的处理。


## 3.使用介绍

一般来说Webview可单独使用，可联合其子类一起使用，所以接下来，我会介绍：

* Webview自身的常见方法
* Webview的最常用的子类：WebSettings类、WebViewClient类、WebChromeClient类
* Android和Js的交互

### 3.1Webview常用方法

#### 3.1.1 加载url

加载方式根据资源分为三种

```android

//方式1. 加载一个网页：
webView.loadUrl("http://www.google.com/");

//方式2：加载apk包中的html页面
webView.loadUrl("file:///android_asset/test.html");

//方式3：加载手机本地的html页面
webView.loadUrl("content://com.android.htmlfileprovider/sdcard/test.html");

//方式4： 加载 HTML 页面的一小段内容
WebView.loadData(String data, String mimeType, String encoding)
// 参数说明：
// 参数1：需要截取展示的内容
// 内容里不能出现 ’#’, ‘%’, ‘\’ , ‘?’ 这四个字符，若出现了需用 %23, %25, %27, %3f 对应来替代，否则会出现异常
// 参数2：展示内容的类型
// 参数3：字节码
```


## 参考

[[1] https://developer.android.com/reference/android/webkit/WebView.html](https://developer.android.com/reference/android/webkit/WebView.html)

[[2] https://developer.android.com/guide/webapps/index.html](https://developer.android.com/guide/webapps/index.html)

[[3] Android开发：最全面、最易懂的Webview使用详解](http://www.jianshu.com/p/3c94ae673e2a)

[[4] Android WebView 详解](http://www.jianshu.com/p/a6f7b391a0b8)

[[5] https://source.android.com/](https://source.android.com/)