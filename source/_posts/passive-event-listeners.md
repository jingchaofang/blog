---
title: Passive Event Listeners
date: 2018-05-05 12:27:49
tags:
---

VM28610:2 [Intervention] Unable to preventDefault inside passive event listener due to target being treated as passive. See https://www.chromestatus.com/features/5093566007214080

{% asset_img 1.png browser console warning %}

访问https://www.chromestatus.com/features/5093566007214080

{% asset_img 2.png www.chromestatus.com/features/5093566007214080 %}

### related

https://zhuanlan.zhihu.com/p/24555031

```
// Test via a getter in the options object to see 
// if the passive property is accessed
var supportsPassive = false;
try {
  // https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty
  var opts = Object.defineProperty({}, 'passive', {
    get: function() {
      supportsPassive = true;
    }
  });
  // https://developer.mozilla.org/zh-CN/docs/Web/API/EventTarget/addEventListener
  window.addEventListener("test", null, opts);
} catch (e) {}

// Use our detect's results. 
// passive applied if supported, capture will be false either way.
elem.addEventListener(
  'touchstart',
  fn,
  supportsPassive ? { passive: true } : false
); 
```

https://blog.csdn.net/dj0379/article/details/52883315

http://www.cnblogs.com/ziyunfei/p/5545439.html

https://caniuse.com/#search=Passive%20event%20listeners

https://developer.mozilla.org/zh-CN/docs/Web/API/EventTarget/addEventListener