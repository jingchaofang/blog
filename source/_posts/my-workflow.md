---
title: My Workflow
date: 2017-12-25 16:28:27
tags:
---

- 编码：代码开发和审阅，版本控制工具、代码合并工具
- 构建：持续集成工具、构建状态统计工具
- 测试：通过测试和结果确定绩效的工具
- 打包：成品仓库、应用程序部署前暂存
- 发布：变更管理、发布审批、发布自动化
- 配置：基础架构配置和部署，基础架构即代码工具
- 监视：应用程序性能监视、最终用户体验

# 文件和文件夹操作

## 命令行切换到窗口视图

### pc

```
start .（pc打开文件夹视图）
```

```
explorer .（pc打开文件夹视图）
```

```
start www.baidu.com （浏览器打开网址）
```

### mac

```
open .（mac打开文件夹视图）
```

## 当前窗口视图切换到命令行

mac：右键菜单，Automator->服务
pc：右键菜单，gitbash

## 编辑器切换到命令行

SublimeText3 安装包 Terminal，`ctrl+shift+t`在命令行终端中打开当前文件，可以配置用哪个终端软件。

## 在命令行终端环境中用特定编辑器打开当前文件或文件夹

### SublimeText3

```
subl . -a
```

[具体配置说明](https://www.sublimetext.com/docs/3/osx_command_line.html)

#### sublimecodeintel

http://www.sublimecodeintel.com/

#### sublimelinter

https://github.com/SublimeLinter/SublimeLinter

https://segmentfault.com/a/1190000004169261

# Git

https://git-scm.com/

### .gitignore

你想要忽略的文件或者目录

### .gitattributes

[用于设置文件的对比方式，常用非文本文件](https://git-scm.com/book/zh/v1/%E8%87%AA%E5%AE%9A%E4%B9%89-Git-Git%E5%B1%9E%E6%80%A7)

### linguist

[linguist](https://github.com/github/linguist)

### LICENSE

[license list](http://www.gnu.org/licenses/license-list.html)

[choose a license](https://choosealicense.com/)


# GNU工具

## Pc

### Cygwin

[apt-cyg安装](http://jingyan.baidu.com/article/c74d60007a02500f6b595d7f.html)

先确认安装好./bin/wget.exe

安装./bin/apt-cyg

wget https://github.com/transcode-open/apt-cyg/blob/master/apt-cyg -P ./bin

install apt-cyg ./bin

安装tree命令

apt-cyg install tree

# 抓包工具

## Mac

### Charles

[Charles](https://www.charlesproxy.com/)

# 录制终端

[https://asciinema.org/](https://asciinema.org/)

# 代码插入页面运行

让你的代码活起来
https://runkit.com/home

代码演示调试
http://codepen.io

http://jsfiddle.net/

# 网站套件

https://www.google.com/analytics/

# 编辑器规范

http://editorconfig.org/

`.editorconfig`该文件定义项目的编码规范，编辑器的行为会与`.editorconfig`文件中定义的一致，并且其优先级比编辑器自身的设置要高，这在多人合作开发项目时十分有用而且必要。

```
root = true
[*]                                // 对所有文件应用下面的规则
charset = utf-8                    // 编码规则用utf-8
indent_style = space               // 缩进用空格
indent_size = 2                    // 缩进数量为2个空格
end_of_line = lf                   // 换行符格式
insert_final_newline = true        // 是否在文件的最后插入一个空行
trim_trailing_whitespace = true    // 是否删除行尾的空格
```

# 编辑器

## SublimeText3

### 快捷键绑定 Preferences > Key Bindings

所有的快捷方式都可以在这里找到，我们也可以绑定自己的快捷方式

```
[
    // 针对个人习惯做了定制
    { "keys": ["super+alt+i"], "command": "goto_definition" } 
]
```

### 配置 Preferences > Settings

```
{
    "font_size": 12,
    "ignored_packages":
    [
        "Markdown",
        "Vintage"
    ],
    "intent_to_bracket": true,
    "line_numbers": true,
    "rulers":
    [
        120
    ],
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    // 去除'-'的匹配，方便选中短横线连接
    "word_separators": "./\\()\"':,.;<>~!@#$%^&*|+=[]{}`~?"
}
```

### 插件推荐

#### Emmet

[emmet](https://www.emmet.io/download/)

[emmet-sublime](https://github.com/sergeche/emmet-sublime#readme)

### 插件开发

# 代码性能检测

[Jsperf](https://jsperf.com/)

# Continuous Integration 持续集成

[Travis CI](https://travis-ci.org/)

[Circle CI](http://circleci.com/)


## github

https://badge.fury.io/for/js
https://nodei.co/
http://shields.io/
https://github.com/fehmicansaglam/progressed.io


## 移动端调试

[vConsole](https://github.com/Tencent/vConsole)
