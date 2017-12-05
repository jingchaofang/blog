---
title: 移动端布局适配方案
date: 2017-12-06 00:40:58
tags:
---

移动端屏幕适配方案包括布局适配和图片适配，这里对布局适配做主要介绍，rem系方案做重点介绍。

## 基础

[Device metrics 设备度量信息列表](https://design.google.com/devices/)

### 分辨率

* 分辨率又称为显示分辨率、屏幕分辨率
* 确定手机屏幕上显示多少信息的设置，以水平和垂直像素来衡量
* iphone6：750*1334px
* iphone5s：640*1136px

### 屏幕尺寸

* 屏幕大小的物理尺寸，以屏幕对角线长度衡量
* 单位：英寸  1英寸 = 2.54厘米
* iphone6：4.7英寸
* iphone5s：4英寸

### 屏幕／像素密度

* PPI（Pixels Per Inch）表示的是每英寸所拥有的像素（Pixel）数目
* PPI值越高，画面的细节就越丰富
* iphone6 750*1334px 4.7英寸
* PPI = 750和1334的平方和求根再除以英寸值

### 逻辑像素（pt、dp）和物理像素（px）

* 逻辑像素是开发过程中表示界面尺寸的一种方式，物理像素是设备屏幕实际具有的像素数
* 物理像素是硬件所支持的，逻辑像素是软件可以达到的

#### iphone界面尺寸与适配，逻辑像素单位为pt

|机型|屏幕比例|逻辑像素单位|尺寸|分辨率|屏幕密度|
|---|-------|----------|---|-----|-------|
|iphone1代/3G/S|non-retina 1x multiplier|1pt=1px|3.5英寸|480*320|163ppi|
|iphone4/S|retina 2x multiplier|1pt = 2px|3.5英寸|960*640|326ppi|
|iphone5/C/S|retina 2x multiplier|1pt=2px|4英寸|1136*640|326ppi|
|iphone6/S|retina 2x multiplier|1pt=2px|4.7英寸|1334*750|326ppi|
|iphone6Plus/S|retina 3x multiplier|1pt=3px|5.5英寸|2206*1242|401ppi|

#### android界面尺寸与适配，逻辑像素单位为dp

* dp、sp和dpi
* dp：android开发中用于描述模块间布局大小的单位
* sp：和dp一样，只是用于描述字体大小的单位
* 1dp = 1sp
* dpi：测量空间点密度的单位，单位英寸上点的个数

|屏幕密度|比例|常见分辨率|逻辑像素单位|
|-------|---|--------|----------|
|mdpi ~160dpi|1|320*480|1dp=1px|
|hdpi ~240dpi|1.5|480*800|1dp=1.5px|
|xhdpi ~320dpi|2|720*1080|1dp=2px|
|xxhdpi ~480dpi|3|1080*1920|1dp=3px|
|xxxhdpi ~640dpi|4|2560*1440|1dp=4px|

#### 物理／设备像素

物理像素又被称为设备像素，他是显示设备中一个最微小的物理部件。每个像素可以根据操作系统设置自己的颜色和亮度。正是这些设备像素的微小距离欺骗了我们肉眼看到的图像效果。

#### CSS像素／设备独立像素

设备独立像素(density-independent pixel)也称为密度无关像素，可以认为是计算机坐标系统中的一个点，这个点代表一个可以由程序使用的虚拟像素(比如说CSS像素)，然后由相关系统转换为物理像素。

CSS像素也被称为设备独立像素(device-independent-pixel)，简称DIPs，单位是dp。
设备独立像素也称为密度无关像素。

#### 设备像素比(device-pixel-ratio)

简称为dpr，其定义了物理像素和设备独立像素的对应关系。它的值可以按下面的公式计算得到：

```
设备像素比 ＝ 物理像素 / 设备独立像素。
```

在JavaScript中，可以通过window.devicePixelRatio获取到当前设备的dpr。而在CSS中，可以通过-webkit-device-pixel-ratio，-webkit-min-device-pixel-ratio和 -webkit-max-device-pixel-ratio进行媒体查询，对不同dpr的设备，做一些样式适配(这里只针对webkit内核的浏览器和webview)。

### 视窗

[Viewport](https://github.com/turingca/wiki/blob/gh-pages/frontend/html/viewports.md)

## px
实现：固定页面宽度
特点：固定页面宽度，超出部分留白。

## %+px
实现：流式布局，弹性布局
特点：宽度百分比，高度px定死，文字流式，控件弹性，图片等比缩放。

## @media
实现：响应式布局
特点：工作量大，维护性难。

## viewport

实现：设置viewport缩放
特点：缩放导致有些页面元素变糊

## rem

实现：rem等比例适配
特点：等比例缩放页面
介绍：rem（font-size-of-the-root-element）是指相对于根元素的字体大小的单位。简单的说它就是一个相对单位。看到rem大家一定会想起em单位，em（font-size-of-the-element）是指相对于父元素的字体大小的单位。rem计算的规则是依赖根元素，em是依赖父元素计算。

相关：http://m.dx.com/

根据字体大小的单位类型可以分为两种分案：

1. 字体大小采用rem：所有单位都是rem，无脑切像素，工具自动转化。
2. 字体大小采用px：只有字体采用px，适配字体根据dpr调整viewport，工具自动转化。


### 辅助工具

[Can I use](http://caniuse.com/#search=rem)

[SublimeText转化插件](https://github.com/flashlizi/cssrem)

[Npm转化模块](https://www.npmjs.com/package/px2rem)

### 应用实例

#### 滴滴打车红包

```js
var docuH = document.documentElement.clientHeight,//文档高
    docuW = document.documentElement.clientWidth,//文档宽
    html = document.getElementsByTagName('html')[0];//获取第一个html标签
var num = docuW / 320;
html.style.fontSize = 12 * num + "px";
var currentFontSize = 12 * num + "px";
```
经过分析推测：
图片适配采用的750宽；CSS适配采用的是页面缩放到640宽，然后按1rem为24px的标准，或者是缩放到320，然后按1rem为12px的标准。
要求设计师设计时考虑最小字体大小为12px

#### 百度外卖红包

```js
var width = document.documentElement.clientWidth;
document.querySelector('html').style.fontSize = 20 * (width / 750) + 'px';
```
经过分析推测：20*(750/750)=20
图片适配采用的750宽；CSS适配采用的是页面缩放到750宽，然后按1rem为20px的标准，或者是缩放到375，然后按1rem为10px的标准。
要求设计师设计时考虑最小字体大小为12px

#### 美团外卖红包

```js
(function (){
    function o(){
        document.documentElement.style.fontSize = (document.documentElement.clientWidth > 414 ? 414 : document.documentElement.clientWidth) / 12 + "px"
    }
    var e = null;
    window.addEventListener("resize", function () {
        clearTimeout(e), e = setTimeout(o, 300)
    }, !1),//冒泡
    o()
})(window);
```

经过分析可能推测：414/12=34.5
图片适配采用的640宽；CSS适配采用的是页面缩放到414宽，然后按1rem为34.5px的标准
要求设计师设计时考虑最小字体大小为12px

#### 饿了么外卖红包

采用了淘宝flexible适配方案

#### 蓝犀牛

```js
    var win = document.getElementsByTagName('html')[0];
    var w = document.documentElement.clientWidth;
    win.style.fontSize = w * 0.0625 + 'px';//相当于除以16
    window.onresize = function() {
        w = document.documentElement.clientWidth;
        win.style.fontSize = w * 0.0625 + 'px';
    }
```
640/16=40
图片适配采用的640宽；CSS适配采用的是页面保持640宽，然后按1rem为40px的标准
要求设计师设计时考虑最小字体大小为12px

#### qq阅读

```js
document.addEventListener('DOMContentLoaded', function () {
        var $html = document.querySelector('html');
        var $body = document.querySelector('body');
        var $screen = document.createElement('div');
        $screen.style.cssText += 'position:fixed; width:100%; height:100%; display:none;';
        $body.insertBefore($screen, $body.firstChild);
        function setRem() {
            $screen.style.display = 'block';
            var w = Number(document.defaultView.getComputedStyle($screen).width.replace(/px/, ''));
            var h = Number(document.defaultView.getComputedStyle($screen).height.replace(/px/, ''));
            $screen.style.display = 'none';
            $html.style.fontSize = 100 * w / 750 + 'px';
            //document.getElementsByClassName('container')[0].style.height = h+'px';
            console.debug('rem: Rem reset. Size of the viewport is ' + w + '*' + h + '.');
        }
        setRem();
        window.addEventListener('resize', setRem);
    });
```

#### 掌阅ireader


```css
html {
    -webkit-text-size-adjust: 100%;
}
/*用样式约束下，防止页面大幅度闪动*/
@media screen and (max-width:320px) {
    html {
        font-size: 17.778px;
    }
}
@media screen and (min-width:321px) and (max-width:360px) {
    html {
        font-size: 20px;
    }
}
@media screen and (min-width:361px) and (max-width:375px) {
    html {
        font-size: 20.8333px;
    }
}
@media screen and (min-width:376px) and (max-width:414px) {
    html {
        font-size: 23px;
    }
}
@media screen and (min-width:720px) {
    html {
        font-size: 40px;
    }
}
```


```js
// rem基准计算和限宽
(function(){
    function refreshRem() {
        if (document.documentElement.clientWidth >= 720) {
            document.documentElement.style.fontSize = 30 + 'px';
        } else {
            document.documentElement.style.fontSize = document.documentElement.clientWidth) / 18 + "px"
        }
    }
    var tid = null;
    window.addEventListener("resize", function() {
        clearTimeout(tid);
        tid = setTimeout(refreshRem, 0);
    }, false);
    refreshRem();
    // hack系统改变字体大小后的根字体大小
    document.addEventListener("DOMContentLoaded", function() {
        // 计算规则设置的根字体大小
        var setFs = parseFloat(document.documentElement.style.fontSize);
        // 实际渲染后的根字体大小，受手机系统改变字体大小影响
        var actFs = parseFloat(window.getComputedStyle(document.documentElement, null).fontSize);
        if(actFs/setFs !== 1) {
            var scaleFs = setFs/(actFs/setFs);
            document.documentElement.style.fontSize = scaleFs+"px";
        }
    }, false);
})(window);
```

## rem+px+viewport

### 淘宝flexible适配方案

[lib-flexible](https://github.com/amfe/lib-flexible)

[使用Flexible实现手淘H5页面的终端适配](https://github.com/amfe/article/issues/17)

## zoom

[http://caniuse.com/#search=zoom](http://caniuse.com/#search=zoom)

```js
function _pages(){
    var _dw = document.documentElement.clientWidth,_sc = _dw/640;
    document.body.style.zoom = _sc;
}
window.onresize = function(){
_pages();
}
window.onload = function(){
_pages();
}
```

## pageResponse

[pageResponse](https://github.com/peunzhang/pageResponse)

## 参考

[[1]从网易与淘宝的font-size思考前端设计稿与工作流](http://www.cnblogs.com/lyzg/p/4877277.html)

[[2]rem布局初步实践](https://segmentfault.com/a/1190000006839117)

[[3]移动web适配利器-rem](http://www.alloyteam.com/2016/03/mobile-web-adaptation-tool-rem/)



