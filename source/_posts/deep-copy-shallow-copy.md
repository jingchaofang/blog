---
title: Deep Copy Shallow Copy
date: 2018-08-13 16:36:05
tags:
---

## Deep Copy Shallow Copy

https://github.com/pvorb/clone

### 数据类型

数据分为基本数据类型(String, Number, Boolean, Null, Undefined, Symbol)和对象数据类型。

基本数据类型的特点：直接存储在栈(stack)中的数据。
对象数据类型的特点：存储的是该对象在栈中引用，真实的数据存放在堆内存里。

#### 基本数据类型与引用数据类型

基本数据类型：number, string, boolean, null, undefined, symbol
引用数据类型：对象，数组，函数

基本类型的名值存储在栈内存中

引用数据类型的名存在栈内存中，值存在于堆内存中，但是栈内存会提供一个引用的地址指向堆内存中的值

### 前言

深拷贝和浅拷贝是只针对Object和Array这样的对象数据类型的。

浅拷贝只复制指向某个对象的指针，而不复制对象本身，新旧对象还是共享同一块内存。但深拷贝会另外创造一个一模一样的对象，新对象跟原对象不共享内存，修改新对象不会改到原对象。



简单变量的复制，内存小，我们直接复制不会发生引用。
首先深复制和浅复制只针对像 Object, Array 这样的复杂对象的。简单来说，浅复制只复制一层对象的属性，而深复制则递归复制了所有层级。

js中的浅拷贝与深拷贝，只是针对复杂数据类型(object, Array)的复制问题。浅拷贝和深拷贝都可以实现在已有对象上再生出一份的作用。但是对象的实例是存储在堆内存中然后通过一个引用值只操作对象，由此拷贝的时候存在两种情况：拷贝引用和拷贝实例，也就是咱们今天要讨论的浅拷贝和深拷贝。

浅拷贝 : 浅拷贝是拷贝引用，拷贝后的引用都是指向同一个对象实例，彼此之间操作都会有影响
深拷贝 ：在堆中重新分配内存，并且把源对象所有属性都进行进行新建拷贝，以保证深拷贝的对象的引用图不包含任何原对象上的对象引用图上的任何对象，拷贝后的对象原对象完全隔离互不影响。

### 浅拷贝

浅拷贝分两种情况，拷贝直接拷贝源对象的引用和源对象拷贝实例，属性对象拷贝引用。

#### 拷贝源对象的引用

```
let a = {c:1};
let b = a;
console.log(a === b) //true
a.c = 2
console.log(b.c) // 2
```


#### 源对象拷贝实例，其属性对象拷贝引用

这种情况，外层源对象是拷贝实例，如果其属性元素为复杂数据类型时，内层元素拷贝引用。
对源对象直接操作，不影响另外一个对象，但是对其属性操作时，会改变另外一个对象的属性的值。
常用方法为：Array.prototype.slice(), Array.prototype.concat(), jQury的$.extend({},obj)，例：

```
let a = [{c: 1}, {d: 2}];
let b = a.slice();
console.log(a === b); // false 说明外层数组拷贝的是实例
a[0].c = 3;
console.log(b[0].c) // 3 说明其元素拷贝是引用
```

### 深拷贝

深拷贝后，两个对象，包括其内部的元素互不干扰。常见方法有JSON.parse(),JSON.stringify(),jquery的$.extend(true, {}, obj),lodash的_.cloneDeep和_.clone(value, true)。例：

```
var a = {c: {d: 1}};
var b = $.extend(true, {}, a);
console.log(a === b); // 输出false
a.c.d = 3;
console.log(b.c.d); // 输出 1，没有改变。
```

深拷贝就是增加一个“指针”，并申请一个新的内存，并且让这个新增加的“指针”指向这个新的内存地址，使用深拷贝，在释放内存的时候就不会像浅拷贝一样出现重复释放同一段内存的错误，当我们需要复制原对象而又不能修改元对象的时候，深拷贝就是一个，也是唯一的选择。我们来看一下例子：

```
var arrayA = [1, 2, 3, 4, 5];
var arrayB = [] ;
arrayA.forEach (function (element) {
    arrayB.push(elemnt);
});
var str = 'hello'
arrayA.push(str) ;
console.log(arrayA);// [1, 2, 3, 4, 5, "abc"]
console.log(arrayB);// [1, 2, 3, 4, 5]
```

这里的arrayA和arrayB中的最后一个元素，这个元素是一个对象，指向的是同一段内存地址,所以当修改其中一个元素对象的值时，导致了另一个的值也跟着发生改变,但是如果新增加的元素不是一个对象，而是一个字符串，或者一个数字，这时候是没问题的。有问题我们是需要去解决的，对于第一种情况，我们使用同样的方式去解决它。既然新增加的元素是一个字符串或者一个数字的情况下，改变一个元素的值不会引发另一个元素的值的改变，所以我们就使用这种方式去解决，解决方案如下所示：

```
function copy(sourceObj, c) {
    var c = c || (Array.isArray(sourceObj)? [ ] : {});
    for (var i in sourceObj) {
        if (typeof sourceObj[i] === 'object') {
            c[i] = Array.isArray(sourceObj[i])  ? [] : {};
            copy (sourceObj[i], c[i]);
        } else {
            c[i] = sourceObj[i];
        }
    }
    return c;
}
var arrayA = [1,2,3,4,5];
var obj = {name:'Alex'};
arrayA.push(obj);
var arrayB = [];
copy(arrayA,arrayB);
arrayB[5].name = 'Tom';
console.log(arrayA);// [1, 2, 3, 4, 5, {"name": "Alex"}]
console.log(arrayB);// [1, 2, 3, 4, 5, {"name": "Tom"}]
```

我们先定义一个copy函数，传入两个参数，第一个参数是原对象，第二个参数是复制的对象，我们循环原对象，看原对象中的元素的类型是否是对象（Object），如果是的话我们再使用递归调用copy这个对象，如果不是对象，直接赋值。最后返回copy后的对象，也就是这里的arrayB,当我们修改arrayB中的name的值时，arrayA里的值是不会跟着发生改变的。这里涉及到了递归调用，有不明白的童鞋可以看下递归相关的资料。这就完成了对一个对象的深拷贝。





## JavaScript实现方式

### 浅拷贝的实现方式

1.直接赋值一个变量

```
let a = {c:1};
let b = a;
console.log(a === b) // true
a.c = 2 // 修改原对象会影响复制的对象
console.log(b.c) // 2
```

2.Object.assign()

Object.assign方法实行的是浅拷贝，而不是深拷贝。也就是说，如果源对象某个属性的值是对象，那么目标对象拷贝得到的是这个对象的引用。

```
const obj1 = {a: {b: 1}};
const obj2 = Object.assign({}, obj1);
obj1.a.b = 2;
obj2.a.b // 2
```
3.Array.prototype.concat()

```
let arr = [1, 3, {username: 'kobe'}];
let arr2 = arr.concat();    
arr2[2].username = 'wade';
console.log(arr); // [1, 3, {username: "wade"}]
```

4.Array.prototype.slice()
```
let arr = [1, 3, {username: ' kobe'}];
let arr3 = arr.slice();
arr3[2].username = 'wade';
console.log(arr); // [1, 3, {username: "wade"}]
```

关于Array的slice和concat方法的补充说明：Array的slice和concat方法不修改原数组，只会返回一个浅复制了原数组中的元素的一个新数组。

原数组的元素会按照下述规则拷贝：
* 如果该元素是个对象引用(不是实际的对象)，slice 会拷贝这个对象引用到新的数组里。两个对象引用都引用了同一个对象。如果被引用的对象发生改变，则新的和原来的数组中的这个元素也会发生改变。
* 对于字符串、数字及布尔值来说（不是String、Number或者Boolean 对象），slice 会拷贝这些值到新的数组里。在别的数组里修改这些字符串或数字或是布尔值，将不会影响另一个数组。

可能这段话晦涩难懂，我们举个例子，将上面的例子小作修改：

```
let arr = [1, 3, {username: 'kobe'}];
let arr3 = arr.slice();
arr3[1] = 2;
console.log(arr);  // [1, 3, {username: 'kobe'}]
console.log(arr3); // [1, 2, {username: 'kobe'}]
```

### 深拷贝的实现方式

1、JSON.parse(JSON.stringify())

```
let arr = [1, 3, {username: 'kobe'}];
let arr4 = JSON.parse(JSON.stringify(arr));
arr4[2].username = 'duncan'; 
console.log(arr); // [1, 3, {username: 'kobe'}]
console.log(arr4); // [1, 3, {username: 'duncan'}]
```

原理： 用JSON.stringify将对象转成JSON字符串，再用JSON.parse()把字符串解析成对象，一去一来，新的对象产生了，而且对象会开辟新的栈，实现深拷贝。

这种方法虽然可以实现数组或对象深拷贝，但不能处理函数。

```
let arr = [1, 3, {username: 'kobe'}, function(){}];
let arr4 = JSON.parse(JSON.stringify(arr));
arr4[2].username = 'duncan';
console.log(arr); // [1, 3, {username: 'kobe'}, function(){}]
console.log(arr4); // [1, 3, {username: 'duncan'}, null]
```
这是因为JSON.stringify()方法是将一个JavaScript值(对象或者数组)转换为一个 JSON字符串，不能接受函数。

2、手写递归方法

递归方法实现深度克隆原理：遍历对象、数组直到里边都是基本数据类型，然后再去复制，就是深度拷贝。

```javascript
// 定义检测数据类型的功能函数
function checkedType(target) {
  return Object.prototype.toString.call(target).slice(8, -1)
}
// 实现深度克隆---对象/数组
function clone(target) {
  // 判断拷贝的数据类型
  // 初始化变量result 成为最终克隆的数据
  let result, targetType = checkedType(target)
  if (targetType === 'object') {
    result = {}
  } else if (targetType === 'Array') {
    result = []
  } else {
    return target
  }
  // 遍历目标数据
  for (let i in target) {
    // 获取遍历数据结构的每一项值。
    let value = target[i]
    // 判断目标结构里的每一值是否存在对象/数组
    if (checkedType(value) === 'Object' || checkedType(value) === 'Array') {
      // 对象/数组里嵌套了对象/数组
      // 继续遍历获取到value值
      result[i] = clone(value)
    } else { //获取到value值是基本的数据类型或者是函数。
      result[i] = value;
    }
  }
  return result;
}
```

3、函数库lodash

该函数库也有提供_.cloneDeep用来做Deep Copy。

```
var _ = require('lodash');
var obj1 = {
    a: 1,
    b: { f: { g: 1 } },
    c: [1, 2, 3]
};
var obj2 = _.cloneDeep(obj1);
console.log(obj1.b.f === obj2.b.f); // false
```

说了这么多，了解深拷贝也不仅仅是为了应付面试题，在实际开发中也是非常有用的。例如后台返回了一堆数据，你需要对这堆数据做操作，但多人开发情况下，你是没办法明确这堆数据是否有其它功能也需要使用，直接修改可能会造成隐性问题，深拷贝能帮你更安全安心的去操作数据，根据实际情况来使用深拷贝，大概就是这个意思。


## Reference

[深入浅出的“深拷贝与浅拷贝”](https://juejin.im/post/5b56f2325188251b1f2261bc)

[深拷贝与浅拷贝的区别，实现深拷贝的几种方法](https://www.cnblogs.com/echolun/p/7889848.html)




