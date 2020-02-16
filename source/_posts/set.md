---
title: set --
date: 2019-12-27 14:44:03
tags:
---

`set --`

双横杠`--`在shell中表示选项的结束，后面的都当做参数处理而不是选项

`echo -- -e hello`和`echo -e hello`是不一样的，前者-e是一个普通参数，后者-e则是一个选项

## set 的 man page 

```
set [--abefhkmnptuvxBCEHPT] [-o option-name] [arg ...]
set [+abefhkmnptuvxBCEHPT] [+o option-name] [arg ...]
    -- If no arguments follow this option, then the positional parameters are unset.  Otherwise, the positional parameters are set to the args, even if some of them begin with a -.
```

`set --`后无内容，将当前shell脚本的参数置空，`$1 $? $@`等都为空。

`set --`后有内容，当前shell脚本的参数被替换为 `set --` 后的内容，`$1 $? $@` 等相应地被改变。

## example

```
# if command starts with an option, prepend mysqld
if [ "${1:0:1}" = '-' ]; then
    set -- mysqld "$@"
fi
```

```
${1:0:1} 释义 ${parameter:offset:length}
```

## hblock脚本中有应用

https://github.com/hectorm/hblock/blob/master/hblock


## 位置参数

The set command (when not setting options) sets the positional parameters eg

```
set a b c
echo $1
a
echo $2
b
echo $3
```

The -- is the standard "don't treat anything following this as an option"

The "$@" are all the existing position paramters.

```
echo $1,$2,$3
a,b,c
set -- d "$@"
echo $1,$2,$3,$4   
d,a,b,c
```

## related

https://segmentfault.com/q/1010000003874406

https://unix.stackexchange.com/questions/308260/what-does-set-do-in-this-dockerfile-entrypoint

