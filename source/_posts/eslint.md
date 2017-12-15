---
title: Eslint
date: 2017-12-15 19:27:23
tags:
---

# [EN/](https://eslint.org/)[CN/](https://cn.eslint.org/)[CN/](http://eslint.cn/)[Author](https://www.nczonline.net/)

The pluggable linting utility for JavaScript and JSX. ESLint is an open source project originally created by Nicholas C. Zakas in June 2013. Its goal is to provide a pluggable linting utility for JavaScript.

可组装的JavaScript和JSX检查工具。ESLint最初是由Nicholas C. Zakas于2013年6月创建的开源项目。它的目标是提供一个插件化的javascript代码检测工具。

## About 关于

ESLint is an open source JavaScript linting utility originally created by Nicholas C. Zakas in June 2013. Code linting is a type of static analysis that is frequently used to find problematic patterns or code that doesn’t adhere to certain style guidelines. There are code linters for most programming languages, and compilers sometimes incorporate linting into the compilation process.

ESLint 是一个开源的 JavaScript 代码检查工具，由 Nicholas C. Zakas 于2013年6月创建。代码检查是一种静态的分析，常用于寻找有问题的模式或者代码，并且不依赖于具体的编码风格。对大多数编程语言来说都会有代码检查，一般来说编译程序会内置检查工具。

JavaScript, being a dynamic and loosely-typed language, is especially prone to developer error. Without the benefit of a compilation process, JavaScript code is typically executed in order to find syntax or other errors. Linting tools like ESLint allow developers to discover problems with their JavaScript code without executing it.

JavaScript 是一个动态的弱类型语言，在开发中比较容易出错。因为没有编译程序，为了寻找 JavaScript 代码错误通常需要在执行过程中不断调试。像 ESLint 这样的可以让程序员在编码的过程中发现问题而不是在执行的过程中。

The primary reason ESLint was created was to allow developers to create their own linting rules. ESLint is designed to have all rules completely pluggable. The default rules are written just like any plugin rules would be. They can all follow the same pattern, both for the rules themselves as well as tests. While ESLint will ship with some built-in rules to make it useful from the start, you’ll be able to dynamically load rules at any point in time.

ESLint 的初衷是为了让程序员可以创建自己的检测规则。ESLint 的所有规则都被设计成可插入的。ESLint 的默认规则与其他的插件并没有什么区别，规则本身和测试可以依赖于同样的模式。为了便于人们使用，ESLint 内置了一些规则，当然，你可以在使用过程中自定义规则。

ESLint is written using Node.js to provide a fast runtime environment and easy installation via npm.

ESLint 使用 Node.js 编写，这样既可以有一个快速的运行环境的同时也便于安装。

## Philosophy

Everything is pluggable:

- Rule API is used both by bundled and custom rules
- Formatter API is used both by bundled and custom formatters
- Additional rules and formatters can be specified at runtime
- Rules and formatters don’t have to be bundled to be used

Every rule:

- Is standalone
- Can be turned off or on (nothing can be deemed “too important to turn off”)
- Can be set to a warning or error individually

Additionally:

- Rules are “agenda free” - ESLint does not promote any particular coding style
- Any bundled rules are generalizable

The project:

- Values documentation and clear communication
- Is as transparent as possible
- Believes in the importance of testing

所有都是可拔插的

- 内置规则和自定义规则共用一套规则 API
- 内置的格式化方法和自定义的格式化方法共用一套格式化 API
- 额外的规则和格式化方法能够在运行时指定
- 规则和对应的格式化方法并不强制捆绑使用

每条规则:

- 各自独立
- 可以开启或关闭（没有什么可以被认为“太重要所以不能关闭”）
- 可以将结果设置成警告或者错误

另外:

- ESLint 并不推荐任何编码风格，规则是自由的
- 所有内置规则都是泛化的

项目:

- 通过丰富文档减少沟通成本
- 尽可能的简单透明
- 相信测试的重要性

## Getting Started with ESLint 起步

ESLint is a tool for identifying and reporting on patterns found in ECMAScript/JavaScript code, with the goal of making code more consistent and avoiding bugs. In many ways, it is similar to JSLint and JSHint with a few exceptions:

- ESLint uses Espree for JavaScript parsing.
- ESLint uses an AST to evaluate patterns in code.
- ESLint is completely pluggable, every single rule is a plugin and you can add more at runtime.

### Getting Started Tutorial 入门教程

[Full ESLint Course at Pluralsight](https://www.pluralsight.com/courses/eslint-better-code-quality?utm_source=eslint-dot-org&utm_medium=video&utm_campaign=authordemo)

### Installation and Usage

Prerequisites: Node.js (>=4.x), npm version 2+.

There are two ways to install ESLint: globally and locally.

#### Local Installation and Usage

If you want to include ESLint as part of your project’s build system, we recommend installing it locally. You can do so using npm:

```
$ npm install eslint --save-dev
```

You should then setup a configuration file:

```
$ ./node_modules/.bin/eslint --init
```

After that, you can run ESLint in your project’s root directory like this:

```
$ ./node_modules/.bin/eslint yourfile.js
```

Any plugins or shareable configs that you use must also be installed locally to work with a locally-installed ESLint.

#### Global Installation and Usage

If you want to make ESLint available to tools that run across all of your projects, we recommend installing ESLint globally. You can do so using npm:

```
$ npm install -g eslint
```

You should then setup a configuration file:

```
$ eslint --init
```

After that, you can run ESLint on any file or directory like this:

```
$ eslint yourfile.js
```

Any plugins or shareable configs that you use must also be installed globally to work with a globally-installed ESLint.

**Note:** `eslint --init` is intended for setting up and configuring ESLint on a per-project basis and will perform a local installation of ESLint and its plugins in the directory in which it is run. If you prefer using a global installation of ESLint, any plugins used in your configuration must also be installed globally.

### Configuration

Note: If you are coming from a version before 1.0.0 please see the [migration guide](https://eslint.org/docs/user-guide/migrating-to-1.0.0).

After running `eslint --init`, you’ll have a `.eslintrc` file in your directory. In it, you’ll see some rules configured like this:

```
{
    "rules": {
        "semi": ["error", "always"],
        "quotes": ["error", "double"]
    }
}
```

The names semi and quotes are the names of rules in ESLint. The first value is the error level of the rule and can be one of these values:

- "off" or 0 - turn the rule off
- "warn" or 1 - turn the rule on as a warning (doesn’t affect exit code)
- "error" or 2 - turn the rule on as an error (exit code will be 1)

The three error levels allow you fine-grained control over how ESLint applies rules (for more configuration options and details, see the configuration docs).

Your `.eslintrc` configuration file will also include the line:

```
"extends": "eslint:recommended"
```

Because of this line, all of the rules marked “✅” on the [rules page](https://eslint.org/docs/rules) will be turned on. Alternatively, you can use configurations that others have created by [searching for “eslint-config” on npmjs.com](https://www.npmjs.com/search?q=eslint-config). ESLint will not lint your code unless you extend from a shared configuration or explicitly turn rules on in your configuration.

### Next Steps

- Learn about [advanced configuration](https://eslint.org/docs/user-guide/configuring) of ESLint.
- Get familiar with the [command line options](https://eslint.org/docs/user-guide/command-line-interface).
- Explore [ESLint integrations](https://eslint.org/docs/user-guide/integrations) into other tools like editors, build systems, and more.
- Can’t find just the right rule? Make your own [custom rule](https://eslint.org/docs/developer-guide/working-with-rules).
- Make ESLint even better by [contributing](https://eslint.org/docs/developer-guide/contributing/README).


