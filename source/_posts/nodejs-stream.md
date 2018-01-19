---
title: Node Stream
date: 2018-01-18 15:51:46
tags:
---

流（stream）在 Node.js 中是处理流数据的抽象接口（abstract interface）。stream 模块提供了基础的 API 。使用这些 API 可以很容易地来构建实现流接口的对象。

Node.js提供了多种流对象。 例如，HTTP请求和`process.stdout`就都是流的实例。

流可以是可读的、可写的，或是可读写的。所有的流都是 EventEmitter 的实例。

stream模块可以通过以下方式引入：

```js
const stream = require('stream');
```

尽管所有的 Node.js 用户都应该理解流的工作方式，这点很重要，但是stream模块本身只对于那些需要创建新的流的实例的开发者最有用处。对于主要是消费流的开发者来说，他们很少（如果有的话）需要直接使用stream 模块。

## 流的类型

Node.js 中有四种基本的流类型：
- Readable - 可读的流 (例如 `fs.createReadStream()`).
- Writable - 可写的流 (例如 `fs.createWriteStream()`).
- Duplex - 可读写的流 (例如 `net.Socket`).
- Transform - 在读写过程中可以修改和变换数据的Duplex流 (例如 `zlib.createDeflate()`).

### 对象模式

所有使用 Node.js API 创建的流对象都只能操作 strings 和 Buffer（或 Uint8Array） 对象。但是，通过一些第三方流的实现，你依然能够处理其它类型的 JavaScript 值 (除了 null，它在流处理中有特殊意义)。 这些流被认为是工作在 “对象模式”（object mode）。

在创建流的实例时，可以通过 objectMode 选项使流的实例切换到对象模式。试图将已经存在的流切换到对象模式是不安全的。

### 缓冲

Writable和Readable流都会将数据存储到内部的缓冲器（buffer）中。这些缓冲器可以通过相应的 `writable._writableState.getBuffer()` 或 `readable._readableState.buffer` 来获取。

缓冲器的大小取决于传递给流构造函数的 highWaterMark 选项。 对于普通的流， highWaterMark 选项指定了总共的字节数。对于工作在对象模式的流， highWaterMark 指定了对象的总数。

当可读流的实现调用`stream.push(chunk)`方法时，数据被放到缓冲器中。如果流的消费者没有调用`stream.read()`方法，这些数据会始终存在于内部队列中，直到被消费。

当内部可读缓冲器的大小达到highWaterMark指定的阈值时，流会暂停从底层资源读取数据，直到当前 缓冲器的数据被消费 (也就是说，流会在内部停止调用readable._read()来填充可读缓冲器)。

可写流通过反复调用`writable.write(chunk)`方法将数据放到缓冲器。当内部可写缓冲器的总大小小于highWaterMark指定的阈值时，调用 `writable.write()`将返回true。一旦内部缓冲器的大小达到或超过highWaterMark，调用 `writable.write()`将返回false 。

stream API 的关键目标，尤其对于`stream.pipe()`方法，就是限制缓冲器数据大小，以达到可接受的程度。这样，对于读写速度不匹配的源头和目标，就不会超出可用的内存大小。

Duplex和Transform都是可读写的。在内部，它们都维护了两个相互独立的缓冲器用于读和写。在维持了合理高效的数据流的同时，也使得对于读和写可以独立进行而互不影响。例如，`net.Socket`就是Duplex的实例，它的可读端可以消费从套接字（socket）中接收的数据， 可写端则可以将数据写入到套接字。由于数据写入到套接字中的速度可能比从套接字接收数据的速度快或者慢，在读写两端使用独立缓冲器，并进行独立操作就显得很重要了。

## 流消费者的 API

几乎所有的 Node.js 应用，不管多么简单，都在某种程度上使用了流。 下面是在 Node.js 应用中使用流实现的一个简单的 HTTP 服务器：

```js
const http = require('http');

const server = http.createServer((req, res) => {
  // req 是 http.IncomingMessage 的实例，这是一个 Readable Stream
  // res 是 http.ServerResponse 的实例，这是一个 Writable Stream

  let body = '';
  // 接收数据为 utf8 字符串，
  // 如果没有设置字符编码，将接收到 Buffer 对象。
  req.setEncoding('utf8');

  // 如果监听了 'data' 事件，Readable streams 触发 'data' 事件 
  req.on('data', (chunk) => {
    body += chunk;
  });

  // end 事件表明整个 body 都接收完毕了 
  req.on('end', () => {
    try {
      const data = JSON.parse(body);
      // 发送一些信息给用户
      res.write(typeof data);
      res.end();
    } catch (er) {
      // json 数据解析失败 
      res.statusCode = 400;
      return res.end(`error: ${er.message}`);
    }
  });
});

server.listen(1337);

// $ curl localhost:1337 -d "{}"
// object
// $ curl localhost:1337 -d "\"foo\""
// string
// $ curl localhost:1337 -d "not json"
// error: Unexpected token o in JSON at position 1
```

Writable 流 (比如例子中的 res) 暴露了一些方法，比如 write() 和 end() 。这些方法可以将数据写入到流中。

当流中的数据可以读取时，Readable 流使用 EventEmitter API 来通知应用。 这些数据可以使用多种方法从流中读取。

Writable 和 Readable 流都使用了 EventEmitter API ，通过多种方式， 与流的当前状态进行交互。

Duplex 和 Transform 都是同时满足 Writable 和 Readable 。

对于只是简单写入数据到流和从流中消费数据的应用来说， 不要求直接实现流接口，通常也不需要调用 require('stream')。

需要实现两种类型流的开发者可以参考 API for Stream Implementers。

### 可写流

可写流是对数据写入'目的地'的一种抽象。

Writable 的例子包括了：
- HTTP requests, on the client
- HTTP responses, on the server
- fs write streams
- zlib streams
- crypto streams
- TCP sockets
- child process stdin
- process.stdout, process.stderr

注意: 上面的某些例子事实上是Duplex流，只是实现了Writable接口。

所有 Writable 流都实现了`stream.Writable`类定义的接口。

尽管特定的 Writable 流的实现可能略有差别， 所有的 Writable streams 都可以按一种基本模式进行使用，如下面例子所示：

```js
const myStream = getWritableStreamSomehow();
myStream.write('some data');
myStream.write('some more data');
myStream.end('done writing data');
```

stream.Writable类

- close事件
    - close事件将在流或其底层资源（比如一个文件）关闭后触发。close事件触发后，该流将不会再触发任何事件。不是所有可写流都会触发close事件。
- drain事件
    - 如果调用`stream.write(chunk)`方法返回false，流将在适当的时机触发drain事件，这时才可以继续向流中写入数据。
```js
// 向可写流中写入数据一百万次。
// 需要注意背压（back-pressure）。
function writeOneMillionTimes(writer, data, encoding, callback) {
  let i = 1000000;
  write();
  function write() {
    let ok = true;
    do {
      i--;
      if (i === 0) {
        // 最后 一次
        writer.write(data, encoding, callback);
      } else {
        // 检查是否可以继续写入。 
        // 这里不要传递 callback， 因为写入还没有结束！ 
        ok = writer.write(data, encoding);
      }
    } while (i > 0 && ok);
    if (i > 0) {
      // 这里提前停下了， 
      // 'drain' 事件触发后才可以继续写入  
      writer.once('drain', write);
    }
  }
}
```

- error事件
    - error事件在写入数据出错或者使用管道出错时触发。事件发生时，回调函数仅会接收到一个 Error参数。注意:error事件发生时，流并不会关闭。
- finish事件
    - 在调用了`stream.end()`方法，且缓冲区数据都已经传给底层系统（underlying system）之后，finish事件将被触发。
```js
const writer = getWritableStreamSomehow();
for (let i = 0; i < 100; i++) {
  writer.write(`hello, #${i}!\n`);
}
writer.end('This is the end\n');
writer.on('finish', () => {
  console.error('All writes are now complete.');
});
```

- pipe事件
    - `src <stream.Readable>` 输出到目标可写流（writable）的源流（source stream）。在可读流（readable stream）上调用 `stream.pipe()` 方法，并在目标流向 (destinations) 中添加当前可写流 ( writable ) 时，将会在可写流上触发pipe事件。
```js
const writer = getWritableStreamSomehow();
const reader = getReadableStreamSomehow();
writer.on('pipe', (src) => {
  console.error('something is piping into the writer');
  assert.equal(src, reader);
});
reader.pipe(writer);
```

- unpipe事件
    - `src <Readable Stream>` unpiped 当前可写流的源流。在Readable上调用 `stream.unpipe()`方法，从目标流向中移除当前Writable时，将会触发unpipe事件。
```js
const writer = getWritableStreamSomehow();
const reader = getReadableStreamSomehow();
writer.on('unpipe', (src) => {
  console.error('Something has stopped piping into the writer.');
  assert.equal(src, reader);
});
reader.pipe(writer);
reader.unpipe(writer);
```










