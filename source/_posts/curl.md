---
title: Curl
date: 2019-12-26 09:04:25
tags:
---

```
curl --help
curl --manual
```

http://www.ruanyifeng.com/blog/2019/09/curl-reference.html
http://www.ruanyifeng.com/blog/2011/09/curl.html

|场景|option|描述|示例|
|-|-|-|-|
|获取网页源码get||不带有任何参数时curl发出GET请求输出网页源码|`curl www.sina.com`|
|修改UA|-A|指定客户端的用户代理标头，curl的默认用户代理字符串是`curl/[version]`例`User-Agent: curl/7.54.0`|`curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' https://www.sina.com` 将User-Agent改成Chrome浏览器|
|||也可以通过-H参数直接指定标头，更改User-Agent|`curl -H 'User-Agent: php/1.0' https://www.sina.com`|
|||移除User-Agent标头|`curl -A '' https://www.sina.com`|
|设置cookie|-b|生成一个标头Cookie: foo=bar，向服务器发送一个名为foo、值为bar的 Cookie|`curl -b 'foo=bar' https://google.com`|
|||发送两个cookie|`curl -b 'foo1=bar' -b 'foo2=baz' https://google.com`|
|||读取本地文件cookies.txt，里面是服务器设置的 Cookie（参见-c参数），将其发送到服务器|`curl -b cookies.txt https://www.google.com`|
|获取cookie|-c|将服务器的HTTP回应所设置Cookie写入文本文件cookies.txt。|`curl -c cookies.txt https://www.google.com`|
|设置POST请求体|-d|使用-d参数以后，HTTP请求会自动加上标头Content-Type: application/x-www-form-urlencoded。并且会自动将请求转为POST方法，因此可以省略`-X POST`|`curl -d'login=emma＆password=123'-X POST https://google.com/login` 或 `curl -d 'login=emma' -d 'password=123' -X POST  https://google.com/login`|
|||读取本地文本文件的数据，向服务器发送|`curl -d '@data.txt' https://google.com/login`|
||`--data-urlencode`|等同于-d，发送 POST 请求的数据体，区别在于会自动将发送的数据进行 URL 编码，如右发送的数据`hello world`之间有一个空格，需要进行url编码|`curl --data-urlencode 'comment=hello world' https://google.com/login`|
|设置referer|-e|`将Referer标头设为https://google.com?q=example`|`curl -e 'https://google.com?q=example' https://www.example.com`|
|||-H参数可以通过直接添加标头Referer，达到同样效果|`curl -H 'Referer: https://google.com?q=example' https://www.example.com`|
|上传二进制文件|-F|给HTTP请求加上标头Content-Type: multipart/form-data，然后将文件photo.png作为file字段上传|`curl -F 'file=@photo.png' https://google.com/profile`|
|||指定 MIME 类型为image/png，否则 curl 会把 MIME 类型设为application/octet-stream|`curl -F 'file=@photo.png;type=image/png' https://google.com/profile`|
|||原始文件名为photo.png，但是服务器接收到的文件名为me.png|`curl -F 'file=@photo.png;filename=me.png' https://google.com/profile`|
|构造URL的查询字符串|-G|`发出一个GET请求，实际请求的 URL 为https://google.com/search?q=kitties&count=20。如果省略--G，会发出一个 POST 请求`|`curl -G -d 'q=kitties' -d 'count=20' https://google.com/search`|
|||`结合--data--urlencode参数编码`|`curl -G --data-urlencode 'comment=hello world' https://www.example.com`|
|添加HTTP请求的标头|-H|添加 HTTP 标头Accept-Language: en-US|`curl -H 'Accept-Language: en-US' https://google.com`|
|||添加两个 HTTP 标头|`curl -H 'Accept-Language: en-US' -H 'Secret-Message: xyzzy' https://google.com`|
|||添加 HTTP 请求的标头是Content-Type: application/json，然后用-d参数发送 JSON 数据|`curl -d '{"login": "emma", "pass": "123"}' -H 'Content-Type: application/json' https://google.com/login`|
|打印服务器回应的HTTP标头|-i|先输出服务器回应的标头，然后空一行，再输出网页的源码|`curl -i https://www.example.com`|
|发出HEAD请求并打印标头|-I|输出服务器对HEAD请求的回应。|`curl -I https://www.example.com`|
|||`--head参数等同于-I`|`curl --head https://www.example.com`|
|跳过SSL检测|-k|不会检查服务器的SSL证书是否正确|`curl -k https://www.example.com`|
|重定向|-L|让 HTTP 请求跟随服务器的重定向。curl 默认不跟随重定向|`curl -L -d 'tweet=hi' https://api.twitter.com/tweet`|
|模拟网速|`--limit-rate`|限制 HTTP 请求和回应的带宽，将带宽限制在每秒 200K 字节|`curl --limit-rate 200k https://google.com`|
|将服务器回应保存成文件|-o|`将www.example.com保存成example.html，等同于wget命令`|`curl -o example.html https://www.example.com`|
||-O|将URL的最后部分当作文件名，文件名为bar.html|`curl -O https://www.example.com/foo/bar.html`|
|不输出错误和进度信息|-s|不输出错误和进度信息|`curl -s https://www.example.com`|
|||让curl不产生任何输出|`curl -s -o /dev/null https://google.com`|
|只输出错误信息|-S|没有任何输出，除非发生错误|``|
|设置服务器认证的用户名和密码|-u|`设置用户名为bob，密码为12345，然后将其转为 HTTP 标头Authorization: Basic Ym9iOjEyMzQ1`|`curl -u 'bob:12345' https://google.com/login`|
|||能够识别 URL 里面的用户名和密码，将其转为上个例子里面的 HTTP 标头|`curl https://bob:12345@google.com/login`|
|||只设置了用户名，执行后，curl 会提示用户输入密码|`curl -u 'bob' https://google.com/login`|
|输出通信的整个过程|-v|输出通信的整个过程，便于调试|`curl -v https://www.example.com`|
|||`--trace参数也可以用于调试，还会输出原始的二进制数据`|`curl --trace - https://www.example.com`|
|指定 HTTP 请求的代理|-x|`指定 HTTP 请求通过myproxy.com:8080的 socks5 代理发出。如果没有指定代理协议，默认为 HTTP`|`curl -x socks5://james:cats@myproxy.com:8080 https://www.example.com`|
|||请求的代理使用 HTTP 协议|`curl -x james:cats@myproxy.com:8080 https://www.example.com`|
|参数指定 HTTP 请求的方法|-X|`对https://www.example.com发出 POST 请求`|`curl -X POST https://www.example.com`|

curl是一种命令行工具，作用是发出网络请求，然后得到和提取数据，显示在"标准输出"（stdout）上面。支持多种协议。

直接在curl命令后加上网址，就可以看到网页源码
```
curl www.sina.com

<html>
<head><title>301 Moved Permanently</title></head>
<body bgcolor="white">
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx</center>
</body>
</html>
```

如果要把这个网页保存下来，可以使用`-o`参数，这就相当于使用wget命令了。
```
curl -o [文件名] www.sina.com
```


有的网址是自动跳转的。使用`-L`参数，curl就会跳转到新的网址。
```
curl -L www.sina.com
```

`-i`参数可以显示http response的头信息，连同网页代码一起。

```
curl -i www.sina.com
```

`-I`参数则是只显示http response的头信息。

```
curl -I www.sina.com
```

`-v`参数可以显示一次http通信的整个过程，包括端口连接和http request头信息。

```
curl -v www.sina.com
```

下面的命令可以查看更详细的通信过程

```
curl --trace output.txt www.sina.com
```
或者
```
curl --trace-ascii output.txt www.sina.com
```


发送表单信息有GET和POST两种方法。GET方法相对简单，只要把数据附在网址后面就行。

```
curl example.com/form.cgi?data=xxx
```

POST方法必须把数据和网址分开，curl就要用到--data参数。

```
curl -X POST --data "data=xxx" example.com/form.cgi
```

如果你的数据没有经过表单编码，还可以让curl为你编码，参数是`--data-urlencode`。

```
curl -X POST--data-urlencode "date=April 1" example.com/form.cgi
```

curl默认的HTTP动词是GET，使用`-X`参数可以支持其他动词。
```
curl -X POST www.example.com
curl -X DELETE www.example.com
```

文件上传

```
<form method="POST" enctype='multipart/form-data' action="upload.cgi">
　　<input type=file name=upload>
　　<input type=submit name=press value="OK">
</form>
```

```
curl --form upload=@localfilename --form press=OK [URL]
```

有时你需要在http request头信息中，提供一个referer字段，表示你是从哪里跳转过来的。

```
curl --referer http://www.example.com http://www.example.com
```


这个字段是用来表示客户端的设备信息。服务器有时会根据这个字段，针对不同设备，返回不同格式的网页，比如手机版和桌面版。

iPhone4的User Agent是
```
Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7
```

```
curl --user-agent "[User Agent]" [URL]
```

使用`--cookie`参数，可以让curl发送cookie。

```
curl --cookie "name=xxx" www.example.com
```
至于具体的cookie的值，可以从http response头信息的`Set-Cookie`字段中得到。

`-c cookie-file`可以保存服务器返回的cookie到文件，`-b cookie-file`可以使用这个文件作为cookie信息，进行后续的请求。

```
curl -c cookies http://example.com
curl -b cookies http://example.com
```

有时需要在http request之中，自行增加一个头信息。`--header`参数就可以起到这个作用。

```
curl --header "Content-Type:application/json" http://example.com
```

有些网域需要HTTP认证，这时curl需要用到`--user`参数。
```
curl --user name:password example.com
```