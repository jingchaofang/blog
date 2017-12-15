---
title: Eslint Configuration
date: 2017-12-16 00:32:59
tags:
---

## Configuring ESLint

ESLint is designed to be completely configurable, meaning you can turn off every rule and run only with basic syntax validation, or mix and match the bundled rules and your custom rules to make ESLint perfect for your project. There are two primary ways to configure ESLint:

ESlint 被设计为完全可配置的，这意味着你可以关闭每一个规则而只运行基本语法验证，或混合和匹配 ESLint 默认绑定的规则和你的自定义规则，以让 ESLint 更适合你的项目。有两种主要的方式来配置 ESLint：

1. Configuration Comments - use JavaScript comments to embed configuration information directly into a file.
2. Configuration Files - use a JavaScript, JSON or YAML file to specify configuration information for an entire directory (other than your home directory) and all of its subdirectories. This can be in the form of an `.eslintrc.*` file or an `eslintConfig` field in a package.json file, both of which ESLint will look for and read automatically, or you can specify a configuration file on the [command line](https://eslint.org/docs/user-guide/command-line-interface).

1. Configuration Comments - 使用 JavaScript 注释把配置信息直接嵌入到一个代码源文件中。
2. Configuration Files - 使用 JavaScript、JSON 或者 YAML 文件为整个目录和它的子目录指定配置信息。可以配置一个独立的 `.eslintrc.*` 文件，或者直接在 package.json 文件里的 `eslintConfig` 字段指定配置，ESLint 会查找和自动读取它们，再者，你可以在命令行运行时指定一个任意的配置文件。

If you have a configuration file in your home directory (generally `~/`), ESLint uses it only if ESLint cannot find any other configuration file.

There are several pieces of information that can be configured:
- Environments - which environments your script is designed to run in. Each environment brings with it a certain set of predefined global variables.
- Globals - the additional global variables your script accesses during execution.
- Rules - which rules are enabled and at what error level.
All of these options give you fine-grained control over how ESLint treats your code.

有很多信息可以配置：
- Environments - 指定脚本的运行环境。每种环境都会有一组特定的预定义全局变量。
- Globals - 脚本在执行期间访问的额外的全局变量。
- Rules - 启用的规则及其各自的错误级别。
所有这些选项让你可以细粒度地控制 ESLint 如何对待你的代码。

### Specifying Parser Options

ESLint allows you to specify the JavaScript language options you want to support. By default, ESLint expects ECMAScript 5 syntax. You can override that setting to enable support for other ECMAScript versions as well as JSX by using parser options.

ESLint 允许你指定你想要支持的 JavaScript 语言选项。默认情况下，ESLint 支持 ECMAScript 5 语法。你可以覆盖该设置，以启用对 ECMAScript 其它版本和 JSX 的支持。

Please note that supporting JSX syntax is not the same as supporting React. React applies specific semantics to JSX syntax that ESLint doesn’t recognize. We recommend using [eslint-plugin-react](https://github.com/yannickcr/eslint-plugin-react) if you are using React and want React semantics. By the same token, supporting ES6 syntax is not the same as supporting new ES6 globals (e.g., new types such as `Set`). For ES6 syntax, use `{ "parserOptions": { "ecmaVersion": 6 } }`; for new ES6 global variables, use `{ "env": { "es6": true } }` (this setting enables ES6 syntax automatically). Parser options are set in your `.eslintrc.*` file by using the `parserOptions` property. The available options are:

- `ecmaVersion` - set to 3, 5 (default), 6, 7, or 8 to specify the version of ECMAScript syntax you want to use. You can also set to 2015 (same as 6), 2016 (same as 7), or 2017 (same as 8) to use the year-based naming.
- `sourceType` - set to `"script"` (default) or `"module"` if your code is in ECMAScript modules.
- ecmaFeatures - an object indicating which additional language features you’d like to use:
    - `globalReturn` - allow `return` statements in the global scope
    - `impliedStrict` - enable global [strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode) (if `ecmaVersion` is 5 or greater)
    - `jsx` - enable [JSX](http://facebook.github.io/jsx/)
    - `experimentalObjectRestSpread` - enable support for the experimental [object rest/spread properties](https://github.com/tc39/proposal-object-rest-spread) (**IMPORTANT**: This is an experimental feature that may change significantly in the future. It’s recommended that you do not write rules relying on this functionality unless you are willing to incur maintenance cost when it changes.)

Here’s an example .eslintrc.json file:
```json
{
    "parserOptions": {
        "ecmaVersion": 6,
        "sourceType": "module",
        "ecmaFeatures": {
            "jsx": true
        }
    },
    "rules": {
        "semi": 2
    }
}
```

Setting parser options helps ESLint determine what is a parsing error. All language options are `false` by default.



