---
title: javaScript-inheritance
tags:
---

JohnResig - [Simple JavaScript Inheritance](https://johnresig.com/blog/simple-javascript-inheritance/)。

```javascript
/* Simple JavaScript Inheritance
 * By John Resig https://johnresig.com/
 * MIT Licensed.
 */
//从base2与Prototype这2个库中受到启发。
(function(){
  var initializing = false,
  fnTest = /xyz/.test(function(){xyz;}) ? /\b_super\b/ : /.*/;

 //基础的class实现 没有做任何事情
  this.Class = function(){};

  //创建一个新的类继承这个Class
  Class.extend = function(prop) {
    var _super = this.prototype;

    //实例化一个基础类（仅仅是创建实例，并没有运行初始化构造器）
    initializing = true;
    var prototype = new this();
    initializing = false;

    //复制属性到新的原型上
    for (var name in prop) {
      //检查我们是否覆盖了一个已经存在的方法
      prototype[name] = typeof prop[name] == "function" && 
        typeof _super[name] == "function" && fnTest.test(prop[name]) ?
        (function(name, fn){
          return function() {
            var tmp = this._super;
            // 添加._super()方法，该方法与超类的方法相同
            this._super = _super[name];
            // 该方法只需要临时存在，所以在执行完之后移除该方法
            var ret = fn.apply(this, arguments);        
            this._super = tmp;

            return ret;
          };
        })(name, prop[name]) :
        prop[name];
    }

    //仿真的类构造器
    function Class() {
      // All construction is actually done in the init method  所有的创建工作都会在init方法里完成
      if ( !initializing && this.init )
        this.init.apply(this, arguments);
    }

    //设置类的原型
    Class.prototype = prototype;

    //重载构造器的引用
    Class.prototype.constructor = Class;

    //让类可以继续扩展
    Class.extend = arguments.callee;

    return Class;
  };
})();
```

