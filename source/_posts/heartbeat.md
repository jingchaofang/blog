---
title: Heart Beat
date: 2019-12-23 13:00:53
tags:
---


```javascript
/**
 * 心跳统计
 * @param {Object} opt 配置参数
 */
function init(opt) {
    var tn = opt.tn;
    var log = opt.log;
    var interval = 1000;
    var cur = 0;
    var point = null;
    var logTo = 'u';
    if (opt.isDuba) {
        logTo = 'v';
    }
    /* eslint-disable fecs-camelcase */
    var rule = {
        playlong: function (v) {
            return (v === 1 * 60 || v === 2 * 60 || v === 3 * 60 || v % (5 * 60) === 0);
        },
        baiduYingshi_hao123: function (v) {
            return (v === 10 || v === 20 || v === 30 || v % 60 === 0);
        },
        kanShort: function (v) {
            return (v === 10 || v === 20 || v === 30 || v % 60 === 0);
        },
        baiduYingshi: function (v) {
            return (v === 10 || v === 20 || v === 30 || v % 60 === 0);
        },
        kanShort_hao123: function (v) {
            return (v === 10 || v === 20 || v === 30 || v % 60 === 0);
        },
        kanShort_duba: function (v) {
            return (v === 10 || v === 20 || v === 30 || v % 60 === 0);
        },
        watchdetail: function (v) {
            return (v === 10 || v === 20 || v === 30 || v % 60 === 0);
        }

    };
    /* eslint-enable fecs-camelcase */
    setInterval(function () {
        cur++;
        if (rule[tn].call(null, cur)) {
            if (tn.indexOf('playlong') !== -1) {
                $.log('http://pc.videoclick.baidu.com/' + logTo + '.gif?pid=104&' + encodeURI(log) + '&i=' + cur / 60);
            }
            else {
                if (tn.indexOf('kanShort') !== -1) {
                    $.log('http://pc.videoclick.baidu.com/' + logTo + '.gif?pid=104&' + encodeURI(log) + '&s10=' + cur / 10);
                }
            }
        }
    }, interval);
}
```