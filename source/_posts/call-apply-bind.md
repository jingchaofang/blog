---
title: call apply bind
date: 2019-06-12 21:10:30
tags:
---

## Function.apply.bind()

https://blog.csdn.net/weixin_37787381/article/details/81509361

## Function.bind.apply()

https://www.cnblogs.com/pspgbhu/p/6796795.html?utm_source=tuicool&utm_medium=referral


## [bind](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)

```
function.bind(thisArg[, arg1[, arg2[, ...]]])
```

返回一个原函数的拷贝，并拥有指定的this值和初始参数。

### 参数说明

`thisArg`

调用绑定函数时作为this参数传递给目标函数的值。 如果使用new运算符构造绑定函数，则忽略该值。当使用bind在setTimeout中创建一个函数（作为回调提供）时，作为thisArg传递的任何原始值都将转换为object。如果bind函数的参数列表为空，执行作用域的this将被视为新函数的thisArg。

`arg1, arg2, ...`

当目标函数被调用时，被预置入绑定函数的参数列表中的参数。

### 描述

`bind()`函数会创建一个新的绑定函数（bound function，BF）。绑定函数是一个exotic function object（怪异函数对象，ECMAScript2015中的术语），它包装了原函数对象。调用绑定函数通常会导致执行包装函数。

绑定函数具有以下内部属性：
* `[[BoundTargetFunction]]` - 包装的函数对象
* `[[BoundThis]]` - 在调用包装函数时始终作为this值传递的值。
* `[[BoundArguments]]` - 列表，在对包装函数做任何调用都会优先用列表元素填充参数列表。
* `[[Call]]` - 执行与此对象关联的代码。通过函数调用表达式调用。内部方法的参数是一个this值和一个包含通过调用表达式传递给函数的参数的列表。

当调用绑定函数时，它调用`[[BoundTargetFunction]]`上的内部方法`[[Call]]`，就像这样Call(boundThis, args)。其中，boundThis是`[[BoundThis]]`，args是`[[BoundArguments]]`加上通过函数调用传入的参数列表。

绑定函数也可以使用new运算符构造，它会表现为目标函数已经被构建完毕了似的。提供的this值会被忽略，但前置参数仍会提供给模拟函数。


### Polyfill可以部分地使用bind

```javascript
if (!Function.prototype.bind) {
  Function.prototype.bind = function(oThis) {
    if (typeof this !== 'function') {
      // closest thing possible to the ECMAScript 5
      // internal IsCallable function
      throw new TypeError('Function.prototype.bind - what is trying to be bound is not callable');
    }

    var aArgs   = Array.prototype.slice.call(arguments, 1),
        fToBind = this,
        fNOP    = function() {},
        fBound  = function() {
          // this instanceof fBound === true时,说明返回的fBound被当做new的构造函数调用
          return fToBind.apply(this instanceof fBound
                 ? this
                 : oThis,
                 // 获取调用时(fBound)的传参.bind 返回的函数入参往往是这么传递的
                 aArgs.concat(Array.prototype.slice.call(arguments)));
        };

    // 维护原型关系
    if (this.prototype) {
      // Function.prototype doesn't have a prototype property
      fNOP.prototype = this.prototype; 
    }
    // 下行的代码使fBound.prototype是fNOP的实例,因此
    // 返回的fBound若作为new的构造函数,new生成的新对象作为this传入fBound,新对象的__proto__就是fNOP的实例
    fBound.prototype = new fNOP();

    return fBound;
  };
}
```

### 用法：创建绑定函数

`bind()`最简单的用法是创建一个函数，不论怎么调用，这个函数都有同样的this值

### 用法：偏函数

bind的另一个最简单的用法是使一个函数拥有预设的初始参数。只要将这些参数（如果有的话）作为bind的参数写在this后面。当绑定函数被调用时，这些参数会被插入到目标函数的参数列表的开始位置，传递给绑定函数的参数会跟在它们后面。

### 用法：配合setTimeout

在默认情况下，使用window.setTimeout()时，this关键字会指向window（或 global）对象。当类的方法中需要this指向类的实例时，你可能需要显式地把this绑定到回调函数，就不会丢失该实例的引用。

```
function LateBloomer() {
  this.petalCount = Math.ceil(Math.random() * 12) + 1;
}

// 在 1 秒钟后声明 bloom
LateBloomer.prototype.bloom = function() {
  window.setTimeout(this.declare.bind(this), 1000);
};

LateBloomer.prototype.declare = function() {
  console.log('I am a beautiful flower with ' +
    this.petalCount + ' petals!');
};

var flower = new LateBloomer();
flower.bloom();  // 一秒钟后, 调用 'declare' 方法
```

### 用法：作为构造函数使用的绑定函数

> 警告 :这部分演示了 JavaScript 的能力并且记录了 bind() 的超前用法。以下展示的方法并不是最佳的解决方案，且可能不应该用在任何生产环境中

绑定函数自动适应于使用new操作符去构造一个由目标函数创建的新实例。当一个绑定函数是用来构建一个值的，原来提供的this就会被忽略。不过提供的参数列表仍然会插入到构造函数调用时的参数列表之前。

### 用法：快捷调用

在你想要为一个需要特定的this值的函数创建一个捷径（shortcut）的时候，bind()也很好用。

你可以用Array.prototype.slice来将一个类似于数组的对象转换成一个真正的数组

```javascript
var slice = Array.prototype.slice;
slice.apply(arguments);
```
用 bind()可以使这个过程变得简单。在下面这段代码里面，slice 是 Function.prototype 的 apply() 方法的绑定函数，并且将 Array.prototype 的 slice() 方法作为 this 的值。这意味着我们压根儿用不着上面那个 apply()调用了。

```
// 与前一段代码的 "slice" 效果相同
var unboundSlice = Array.prototype.slice;
var slice = Function.prototype.apply.bind(unboundSlice);
slice(arguments);
```

## [call](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/call)

```
function.call(thisArg, arg1, arg2, ...)
```

call方法使用一个指定的this值和单独给出的一个或多个参数来调用一个函数。

> 该方法的语法和作用与 apply() 方法类似，只有一个区别，就是 call() 方法接受的是一个参数列表，而 apply() 方法接受的是一个包含多个参数的数组。

### 参数

`thisArg`

可选的。在function函数运行时使用的this值。请注意，this可能不是该方法看到的实际值：如果这个函数处于非严格模式下，则指定为null或undefined时会自动替换为指向全局对象，原始值会被包装。

`arg1, arg2, ...`

指定的参数列表。

### 返回值

使用调用者提供的this值和参数调用该函数的返回值。若该方法没有返回值，则返回undefined。

### 描述

call允许为不同的对象分配和调用属于一个对象的函数/方法。

call提供新的this值给当前调用的函数/方法。你可以使用call来实现继承：写一个方法，然后让另外一个新的对象来继承它（而不是在新对象中再写一次这个方法）。

### 用法：使用call方法调用父构造函数

在一个子构造函数中，你可以通过调用父构造函数的 call 方法来实现继承

### 用法：使用call方法调用匿名函数

### 用法：使用call方法调用函数并且指定上下文的this

### 用法：使用call方法调用函数并且不指定第一个参数

如果没有传递第一个参数，this的值将会被绑定为全局对象。在严格模式下，this的值将会是undefined。

## [apply](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)

```
func.apply(thisArg, [argsArray])
```

apply方法调用一个具有给定this值的函数，以及作为一个数组（或类似数组对象）提供的参数。

### 参数

`thisArg`

必选的。在func函数运行时使用的this值。请注意，this可能不是该方法看到的实际值：如果这个函数处于非严格模式下，则指定为null或undefined时会自动替换为指向全局对象，原始值会被包装。

`argsArray`

可选的。一个数组或者类数组对象，其中的数组元素将作为单独的参数传给func函数。如果该参数的值为null或undefined，则表示不需要传入任何参数。从ECMAScript5开始可以使用类数组对象。

### 返回值

调用有指定this值和参数的函数的结果。

### 描述

在调用一个存在的函数时，你可以为其指定一个this对象。this指当前对象，也就是正在调用这个函数的对象。 使用apply你可以只写一次这个方法然后在另一个对象中继承它，而不用在新对象中重复写该方法。

apply与call非常相似，不同之处在于提供参数的方式。apply使用参数数组而不是一组参数列表。apply 可以使用数组字面量（array literal），如fun.apply(this, ['eat', 'bananas'])或数组对象， 如fun.apply(this, new Array('eat', 'bananas'))。

你也可以使用arguments对象作为argsArray参数。 arguments是一个函数的局部变量。 它可以被用作被调用对象的所有未指定的参数。这样，你在使用apply函数的时候就不需要知道被调用对象的所有参数。 你可以使用arguments来把所有的参数传递给被调用对象。被调用对象接下来就负责处理这些参数。

从 ECMAScript 第5版开始，可以使用任何种类的类数组对象，就是说只要有一个length属性和(0..length-1)范围的整数属性。例如现在可以使用NodeList或一个自己定义的类似{'length': 2, '0': 'eat', '1': 'bananas'}形式的对象。


### 用法：用apply将数组添加到另一个数组

我们可以使用push将元素追加到数组中。并且，因为push接受可变数量的参数，我们也可以一次推送多个元素。但是，如果我们传递一个数组来推送，它实际上会将该数组作为单个元素添加，而不是单独添加元素，因此我们最终得到一个数组内的数组。如果那不是我们想要的怎么办？在这种情况下，concat确实具有我们想要的行为，但它实际上并不附加到现有数组，而是创建并返回一个新数组。但是我们想要附加到我们现有的阵列......那么现在呢？ 写一个循环？当然不是吗？apply来帮你！


```javascript
var array = ['a', 'b'];
var elements = [0, 1, 2];
array.push(elements); // ["a", "b", [0, 1, 2]]
// concat并不附加到现有数组，而是创建并返回一个新数组
array.concat(elements); // ["a", "b", 0, 1, 2]
array.push.apply(array, elements); // ["a", "b", 0, 1, 2] push附加到现有的数组
```

### 使用apply和内置函数

聪明的apply用法允许你在某些本来需要写成遍历数组变量的任务中使用内建的函数。在接下里的例子中我们会使用Math.max/Math.min来找出一个数组中的最大/最小值。

```javascript
/* 找出数组中最大/小的数字 */
var numbers = [5, 6, 2, 3, 7];

// 应用(apply) Math.min/Math.max 内置函数完成
// 基本等同于 Math.max(numbers[0], ...) 或 Math.max(5, 6, ..)
// 会有超出JavaScript引擎的参数长度限制的风险
var max = Math.max.apply(null, numbers); 
var min = Math.min.apply(null, numbers);

/* 代码对比：用简单循环完成 */
max = -Infinity, min = +Infinity;
for (var i = 0; i < numbers.length; i++) {
  if (numbers[i] > max)
    max = numbers[i];
  if (numbers[i] < min) 
    min = numbers[i];
}
```

参数个数限制在65536（因平台而异），如果你的参数数组可能非常大，那么推荐使用下面这种策略来处理，将参数数组切块后循环传入目标方法：

```javascript
function minOfArray(arr) {
  var min = Infinity;
  var QUANTUM = 32768;

  for (var i = 0, len = arr.length; i < len; i += QUANTUM) {
    var submin = Math.min.apply(null, arr.slice(i, Math.min(i + QUANTUM, len)));
    min = Math.min(submin, min);
  }

  return min;
}

var min = minOfArray([5, 6, 2, 3, 7]);
```

### 用法：使用apply来链接构造器

```javascript
Function.prototype.construct = function (aArgs) {
  var oNew = Object.create(this.prototype);
  this.apply(oNew, aArgs);
  return oNew;
};
```


## call, apply, bind 区别

bind与apply、call最大的区别就是：bind不会立即调用，其他两个会立即调用。

首先说下call和apply两者的区别：call和apply都是为了解决改变this的指向。作用都是相同的，只是传参的方式不同。除了第一个参数外，call可以接收一个参数列表，apply只接受一个参数数组。

call方法的作用和apply方法类似，区别就是call方法接受的是参数列表，而apply方法接受的是一个参数数组。

## 模拟实现call和apply

可以从以下几点来考虑如何实现

* 不传入第一个参数，那么默认为window
* 改变了this指向，让新的对象可以执行该函数。那么思路是否可以变成给新的对象添加一个函数，然后在执行完以后删除？

```javascript
Function.prototype.myCall = function (context) {
  var context = context || window
  // 给 context 添加一个属性
  // getValue.call(a, 'yck', '24') => a.fn = getValue
  context.fn = this
  // 将 context 后面的参数取出来
  var args = [...arguments].slice(1)
  // getValue.call(a, 'yck', '24') => a.fn('yck', '24')
  var result = context.fn(...args)
  // 删除 fn
  delete context.fn
  return result
}
```

以上就是call的思路，apply的实现也类似

```javascript
Function.prototype.myApply = function (context) {
  var context = context || window
  context.fn = this

  var result
  // 需要判断是否存储第二个参数
  // 如果存在，就将第二个参数展开
  if (arguments[1]) {
    result = context.fn(...arguments[1])
  } else {
    result = context.fn()
  }

  delete context.fn
  return result
}
```

bind和其他两个方法作用也是一致的，只是该方法会返回一个函数。并且我们可以通过bind实现柯里化。同样的，也来模拟实现下bind。

```javascript
Function.prototype.myBind = function (context) {
  if (typeof this !== 'function') {
    throw new TypeError('Error')
  }
  var _this = this
  var args = [...arguments].slice(1)
  // 返回一个函数
  return function F() {
    // 因为返回了一个函数，我们可以 new F()，所以需要判断
    if (this instanceof F) {
      return new _this(...args, ...arguments)
    }
    return _this.apply(context, args.concat(...arguments))
  }
}
```

## reference

[参数个数限制在65536](https://bugs.webkit.org/show_bug.cgi?id=80797)

[Polyfill:function-bind](https://github.com/Raynos/function-bind)

[interview](https://yuchengkai.cn/docs/frontend/#call-apply-bind-%E5%8C%BA%E5%88%AB)