---
title: POST
date: 2019-12-26 09:34:03
tags:
---

## HTML表单编码

enctype属性指定浏览器如何编码数据并将其呈现给服务器。

表单的编码类型，用来控制表单中的数据的编码格式。 默认 enctype=“application/x-www-form-urlencoded”，数据以键值对的方式传送到服务器，这种方式适合于大多数场景。

表单（POST请求）支持下面三种编码：

|encytype||
|----|----|
|application/x-www-form-urlencoded|默认编码 key1=value1&key2=value2|
|multipart/form-data|此编码用于将文件上传到服务器|
|text/plain ，application/json|传递文本内容|


```html
<form action="" method="">
</form>

from.enctype
```


1.application/x-www-form-urlencoded
GET方式，会将表单中的数据（键值对）经过urlencode编码后追加到url中。
POST方式，会将表单中的数据经过urlencode编码后放在request body 中。

2.multipart/form-data
当需要在表单内上传文件时（二进制流数据）时，就需要使用 multipart/form-data。

multipart,顾名思义 多部分。使用该编码方式会将表单进行分割成每个控件（以----boundary为分隔符，将分割控件数据分隔开,在最后以—boundary—结尾）。每个部分必须加上Content-Disposition(form-data) ，对于上传文件还会设置Content-Type。

```
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
------WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="phone"
//空行
16666666666
------WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="mail"
//空行
test@163.com
------WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="portrait "; filename="portrait.png"
Content-Type:  image/png
//空行
------WebKitFormBoundary7MA4YWxkTrZu0gW--
```


可以指定的文本内容格式有多种，application/json是最常用的

text/plain： 纯文本
text/xml ：传递xml语法格式的字符串
text/html： 传递html字符串
application/json ： 传递序列化后的 JSON 字符串。
最常用的是application/json，比较适合Restful接口的调用。