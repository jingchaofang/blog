---
title: Eslint Rules
date: 2017-12-15 23:04:14
tags:
---
# [EN/](https://eslint.org/docs/rules/)[CN](https://cn.eslint.org/docs/rules/)

## Rules 规则

Rules in ESLint are grouped by category to help you understand their purpose.

为了让你对规则有个更好的理解，ESLint对其进行了分门别类。

No rules are enabled by default. The "extends": "eslint:recommended" property in a configuration file enables rules that report common problems, which have a check mark ✅ below.

所有的规则默认都是禁用的。在配置文件中，使用 "extends": "eslint:recommended" 来启用推荐的规则，报告一些常见的问题，在下文中这些推荐的规则都带有一个对号✅标记。

The `--fix` option on the command line automatically fixes problems (currently mostly whitespace) reported by rules which have a wrench 🔧 below.

命令行的 `--fix` 选项用来自动修复规则所报告的问题（目前，大部分是对空白的修复），在下文中会有一个🔧的图标。


### Possible Errors

These rules relate to possible syntax or logic errors in JavaScript code:

这些规则与 JavaScript 代码中可能的错误或逻辑错误有关：

|&nbsp;|rule |explain|
|:---|:----|:---|
|&nbsp;|[for-direction](https://eslint.org/docs/rules/for-direction)|enforce “for” loop update clause moving the counter in the right direction.|
|&nbsp;|[getter-return](https://eslint.org/docs/rules/getter-return)|enforce return statements in getters|
|&nbsp;|[no-await-in-loop](https://eslint.org/docs/rules/no-await-in-loop)|disallow await inside of loops|
|✅|[no-compare-neg-zero](https://eslint.org/docs/rules/no-compare-neg-zero)|disallow comparing against `-0` <br>不允许和负0比较|
|✅|[no-cond-assign](https://eslint.org/docs/rules/no-cond-assign) <br> [释义](https://cn.eslint.org/docs/rules/no-cond-assign)|disallow assignment operators in conditional expressions <br>禁止条件表达式中出现赋值操作符|
|✅|[no-console](https://eslint.org/docs/rules/no-console)<br>[释义](https://cn.eslint.org/docs/rules/no-console)|disallow the use of console<br>禁用 console|
|✅|[no-constant-condition](https://eslint.org/docs/rules/no-constant-condition)<br>[释义](https://cn.eslint.org/docs/rules/no-constant-condition)|disallow constant expressions in conditions <br> 禁止在条件中使用常量表达式|
|✅|[no-control-regex](https://eslint.org/docs/rules/no-control-regex)<br>[释义](https://cn.eslint.org/docs/rules/no-control-regex)|disallow control characters in regular expressions<br>禁止在正则表达式中使用控制字符|
|✅ 🔧|[no-debugger](https://eslint.org/docs/rules/no-debugger)<br>[释义](https://cn.eslint.org/docs/rules/no-debugger)|disallow the use of debugger<br>禁用 debugger|
|✅|[no-dupe-args](https://eslint.org/docs/rules/no-dupe-args)<br>[释义](https://cn.eslint.org/docs/rules/no-dupe-args)|disallow duplicate arguments in function definitions<br>禁止 function 定义中出现重名参数|
|✅|[no-dupe-keys](https://eslint.org/docs/rules/no-dupe-keys)<br>[释义](https://cn.eslint.org/docs/rules/no-dupe-keys)|disallow duplicate keys in object literals<br>禁止对象字面量中出现重复的 key|
|✅|[no-duplicate-case](https://eslint.org/docs/rules/no-duplicate-case)<br>[释义](https://cn.eslint.org/docs/rules/no-duplicate-case)|disallow duplicate case labels<br>禁止出现重复的 case 标签|
|✅|[no-empty](https://eslint.org/docs/rules/no-empty)<br>[释义](https://cn.eslint.org/docs/rules/no-empty)|disallow empty block statements<br>禁止出现空语句块|
|✅|[no-empty-character-class](https://eslint.org/docs/rules/no-empty-character-class)<br>[释义](https://cn.eslint.org/docs/rules/no-empty-character-class)|disallow empty character classes in regular expressions<br>禁止在正则表达式中使用空字符集|
|✅|[no-ex-assign](https://eslint.org/docs/rules/no-ex-assign)<br>[释义](https://cn.eslint.org/docs/rules/no-ex-assign)|disallow reassigning exceptions in catch clauses<br>禁止对 catch 子句的参数重新赋值|
|✅ 🔧|[no-extra-boolean-cast](https://eslint.org/docs/rules/no-extra-boolean-cast)<br>[释义](https://cn.eslint.org/docs/rules/no-extra-boolean-cast)|disallow unnecessary boolean casts<br>禁止不必要的布尔转换|
|🔧|[no-extra-parens](https://eslint.org/docs/rules/no-extra-parens)<br>[释义](https://cn.eslint.org/docs/rules/no-extra-parens)|disallow unnecessary parentheses<br>禁止不必要的括号|
|✅ 🔧|[no-extra-semi](https://eslint.org/docs/rules/no-extra-semi)<br>[释义](https://cn.eslint.org/docs/rules/no-extra-semi)|disallow unnecessary semicolons<br>禁止不必要的分号|
|✅|[no-func-assign](https://eslint.org/docs/rules/no-func-assign)<br>[释义](https://cn.eslint.org/docs/rules/no-func-assign)|disallow reassigning function declarations<br>禁止对 function 声明重新赋值|
|✅|[no-inner-declarations](https://eslint.org/docs/rules/no-inner-declarations)<br>[释义](https://cn.eslint.org/docs/rules/no-inner-declarations)|disallow variable or function declarations in nested blocks<br>禁止在嵌套的块中出现变量声明或 function 声明|
|✅|[no-invalid-regexp](https://eslint.org/docs/rules/no-invalid-regexp)<br>[释义](https://cn.eslint.org/docs/rules/no-invalid-regexp)|disallow invalid regular expression strings in RegExp constructors<br>禁止 RegExp 构造函数中存在无效的正则表达式字符串|
|✅|[no-irregular-whitespace](https://eslint.org/docs/rules/no-irregular-whitespace)<br>[释义](https://cn.eslint.org/docs/rules/no-irregular-whitespace)|disallow irregular whitespace outside of strings and comments<br>禁止在字符串和注释之外不规则的空白|
|✅|[no-obj-calls](https://eslint.org/docs/rules/no-obj-calls)<br>[释义](https://cn.eslint.org/docs/rules/no-obj-calls)|disallow calling global object properties as functions<br>禁止把全局对象作为函数调用|
|&nbsp;|[no-prototype-builtins](https://eslint.org/docs/rules/no-prototype-builtins)<br>[释义](https://cn.eslint.org/docs/rules/no-prototype-builtins)|disallow calling some Object.prototype methods directly on objects<br>禁止直接调用 Object.prototypes 的内置属性|
|✅ 🔧|[no-regex-spaces](https://eslint.org/docs/rules/no-regex-spaces)<br>[释义](https://cn.eslint.org/docs/rules/no-regex-spaces)|disallow multiple spaces in regular expressions<br>禁止正则表达式字面量中出现多个空格|
|✅|[no-sparse-arrays](https://eslint.org/docs/rules/no-sparse-arrays)<br>[释义](https://cn.eslint.org/docs/rules/no-sparse-arrays)|disallow sparse arrays<br>禁用稀疏数组|
|&nbsp;|[no-template-curly-in-string](https://eslint.org/docs/rules/no-template-curly-in-string)<br>[释义](https://cn.eslint.org/docs/rules/no-template-curly-in-string)|disallow template literal placeholder syntax in regular strings<br>|
|✅|[no-unexpected-multiline](https://eslint.org/docs/rules/no-unexpected-multiline)<br>[释义](https://cn.eslint.org/docs/rules/no-unexpected-multiline)|disallow confusing multiline expressions<br>禁止出现令人困惑的多行表达式|
|✅|[no-unreachable](https://eslint.org/docs/rules/no-unreachable)<br>[释义](https://cn.eslint.org/docs/rules/no-unreachable)|disallow unreachable code after return, throw, continue, and break statements <br>禁止在return、throw、continue 和 break 语句之后出现不可达代码|
|✅|[no-unsafe-finally](https://eslint.org/docs/rules/no-unsafe-finally)<br>[释义](https://cn.eslint.org/docs/rules/no-unsafe-finally)|disallow control flow statements in finally blocks<br>禁止在 finally 语句块中出现控制流语句|
|✅ 🔧|[no-unsafe-negation](https://eslint.org/docs/rules/no-unsafe-negation)<br>[释义](https://cn.eslint.org/docs/rules/no-unsafe-negation)|disallow negating the left operand of relational operators<br>|
|✅|[use-isnan](https://eslint.org/docs/rules/use-isnan)<br>[释义](https://cn.eslint.org/docs/rules/use-isnan)|require calls to isNaN() when checking for NaN<br>要求使用 isNaN() 检查 NaN|
|&nbsp;|[valid-jsdoc](https://eslint.org/docs/rules/valid-jsdoc)<br>[释义](https://cn.eslint.org/docs/rules/valid-jsdoc)|enforce valid JSDoc comments<br>强制使用有效的 JSDoc 注释|
|✅|[valid-typeof](https://eslint.org/docs/rules/valid-typeof)<br>[释义](https://cn.eslint.org/docs/rules/valid-typeof)|enforce comparing typeof expressions against valid strings<br>强制 typeof 表达式与有效的字符串进行比较|

### Best Practices

These rules relate to better ways of doing things to help you avoid problems:

这些规则是关于最佳实践的，帮助你避免一些问题:

||rule |explain|
|:---|:----|:---|
||[accessor-pairs](https://eslint.org/docs/rules/accessor-pairs)<br>[释义](https://cn.eslint.org/docs/rules/accessor-pairs)|enforce getter and setter pairs in objects<br>强制 getter 和 setter 在对象中成对出现|
||[array-callback-return](https://eslint.org/docs/rules/array-callback-return)<br>[释义](https://cn.eslint.org/docs/rules/array-callback-return)|enforce return statements in callbacks of array methods<br>强制数组方法的回调函数中有 return 语句|
||[block-scoped-var](https://eslint.org/docs/rules/block-scoped-var)<br>[释义](https://cn.eslint.org/docs/rules/block-scoped-var)|enforce the use of variables within the scope they are defined<br>强制把变量的使用限制在其定义的作用域范围内|
||[class-methods-use-this](https://eslint.org/docs/rules/class-methods-use-this)<br>[释义](https://cn.eslint.org/docs/rules/class-methods-use-this)|enforce that class methods utilize this<br>|
||[complexity](https://eslint.org/docs/rules/complexity)<br>[释义](https://cn.eslint.org/docs/rules/complexity)|enforce a maximum cyclomatic complexity allowed in a program<br>指定程序中允许的最大环路复杂度|
||[consistent-return](https://eslint.org/docs/rules/consistent-return)<br>[释义](https://cn.eslint.org/docs/rules/consistent-return)|require return statements to either always or never specify values<br>要求 return 语句要么总是指定返回的值，要么不指定|
|🔧|[curly](https://eslint.org/docs/rules/curly)<br>[释义](https://cn.eslint.org/docs/rules/curly)|enforce consistent brace style for all control statements<br>强制所有控制语句使用一致的括号风格|
||[default-case](https://eslint.org/docs/rules/default-case)<br>[释义](https://cn.eslint.org/docs/rules/default-case)|require default cases in switch statements<br>要求 switch 语句中有 default 分支|
|🔧|[dot-location](https://eslint.org/docs/rules/dot-location)<br>[释义](https://cn.eslint.org/docs/rules/dot-location)|enforce consistent newlines before and after dots<br>强制在点号之前和之后一致的换行|
|🔧|[dot-notation](https://eslint.org/docs/rules/dot-notation)<br>[释义](https://cn.eslint.org/docs/rules/dot-notation)|enforce dot notation whenever possible<br>强制尽可能地使用点号|
|🔧|[eqeqeq](https://eslint.org/docs/rules/eqeqeq)<br>[释义](https://cn.eslint.org/docs/rules/eqeqeq)|require the use of === and !==<br>要求使用 === 和 !==|
||[guard-for-in](https://eslint.org/docs/rules/guard-for-in)<br>[释义](https://cn.eslint.org/docs/rules/guard-for-in)|require for-in loops to include an if statement<br>要求 for-in 循环中有一个 if 语句|
||[no-alert](https://eslint.org/docs/rules/no-alert)<br>[释义](https://cn.eslint.org/docs/rules/no-alert)|disallow the use of alert, confirm, and prompt<br>禁用 alert、confirm 和 prompt|
||[no-caller](https://eslint.org/docs/rules/no-caller)<br>[释义](https://cn.eslint.org/docs/rules/no-caller)|disallow the use of arguments.caller or arguments.callee<br>禁用 arguments.caller 或 arguments.callee|
|✅|[no-case-declarations](https://eslint.org/docs/rules/no-case-declarations)<br>[释义](https://cn.eslint.org/docs/rules/no-case-declarations)|disallow lexical declarations in case clauses<br>不允许在 case 子句中使用词法声明|
||[no-div-regex](https://eslint.org/docs/rules/no-div-regex)<br>[释义](https://cn.eslint.org/docs/rules/no-div-regex)|disallow division operators explicitly at the beginning of regular expressions<br>禁止除法操作符显式的出现在正则表达式开始的位置|
|🔧|[no-else-return](https://eslint.org/docs/rules/no-else-return)<br>[释义](https://cn.eslint.org/docs/rules/no-else-return)|disallow else blocks after return statements in if statements<br>禁止 if 语句中 return 语句之后有 else 块|
||[no-empty-function](https://eslint.org/docs/rules/no-empty-function)<br>[释义](https://cn.eslint.org/docs/rules/no-empty-function)|disallow empty functions<br>禁止出现空函数|
|✅|[no-empty-pattern](https://eslint.org/docs/rules/no-empty-pattern)<br>[释义](https://cn.eslint.org/docs/rules/no-empty-pattern)|disallow empty destructuring patterns<br>禁止使用空解构模式|
||[no-eq-null](https://eslint.org/docs/rules/no-eq-null)<br>[释义](https://cn.eslint.org/docs/rules/no-eq-null)|disallow null comparisons without type-checking operators<br>禁止在没有类型检查操作符的情况下与 null 进行比较|
||[no-eval](https://eslint.org/docs/rules/no-eval)<br>[释义](https://cn.eslint.org/docs/rules/no-eval)|disallow the use of eval()<br>禁用 eval()|
||[no-extend-native](https://eslint.org/docs/rules/no-extend-native)<br>[释义](https://cn.eslint.org/docs/rules/no-extend-native)|disallow extending native types<br>禁止扩展原生类型|
|🔧|[no-extra-bind](https://eslint.org/docs/rules/no-extra-bind)<br>[释义](https://cn.eslint.org/docs/rules/no-extra-bind)|disallow unnecessary calls to .bind()<br>禁止不必要的 .bind() 调用|
|🔧|[no-extra-label](https://eslint.org/docs/rules/no-extra-label)<br>[释义](https://cn.eslint.org/docs/rules/no-extra-label)|disallow unnecessary labels<br>禁用不必要的标签|
|✅|[no-fallthrough](https://eslint.org/docs/rules/no-fallthrough)<br>[释义](https://cn.eslint.org/docs/rules/no-fallthrough)|disallow fallthrough of case statements<br>禁止 case 语句落空|
|🔧|[no-floating-decimal](https://eslint.org/docs/rules/no-floating-decimal)<br>[释义](https://cn.eslint.org/docs/rules/no-floating-decimal)|disallow leading or trailing decimal points in numeric literals<br>禁止数字字面量中使用前导和末尾小数点|
|✅|[no-global-assign](https://eslint.org/docs/rules/no-global-assign)<br>[释义](https://cn.eslint.org/docs/rules/no-global-assign)|disallow assignments to native objects or read-only global variables<br>|
|🔧|[no-implicit-coercion](https://eslint.org/docs/rules/no-implicit-coercion)<br>[释义](https://cn.eslint.org/docs/rules/no-implicit-coercion)|disallow shorthand type conversions<br>禁止使用短符号进行类型转换|
||[no-implicit-globals](https://eslint.org/docs/rules/no-implicit-globals)<br>[释义](https://cn.eslint.org/docs/rules/no-implicit-globals)|disallow variable and function declarations in the global scope<br>禁止在全局范围内使用变量声明和 function 声明|
||[no-implied-eval](https://eslint.org/docs/rules/no-implied-eval)<br>[释义](https://cn.eslint.org/docs/rules/no-implied-eval)|disallow the use of eval()-like methods<br>禁止使用类似 eval() 的方法|
||[no-invalid-this](https://eslint.org/docs/rules/no-invalid-this)<br>[释义](https://cn.eslint.org/docs/rules/no-invalid-this)|disallow this keywords outside of classes or class-like objects<br>禁止 this 关键字出现在类和类对象之外|
||[no-iterator](https://eslint.org/docs/rules/no-iterator)<br>[释义](https://cn.eslint.org/docs/rules/no-iterator)|disallow the use of the `__iterator__` property<br>禁用 `__iterator__` 属性|
||[no-labels](https://eslint.org/docs/rules/no-labels)<br>[释义](https://cn.eslint.org/docs/rules/no-labels)|disallow labeled statements<br>禁用标签语句|
||[no-lone-blocks](https://eslint.org/docs/rules/no-lone-blocks)<br>[释义](https://cn.eslint.org/docs/rules/no-lone-blocks)|disallow unnecessary nested blocks<br>禁用不必要的嵌套块|
||[no-loop-func](https://eslint.org/docs/rules/no-loop-func)<br>[释义](https://cn.eslint.org/docs/rules/no-loop-func)|disallow function declarations and expressions inside loop statements<br>禁止在循环中出现 function 声明和表达式|
||[no-magic-numbers](https://eslint.org/docs/rules/no-magic-numbers)<br>[释义](https://cn.eslint.org/docs/rules/no-magic-numbers)|disallow magic numbers<br>禁用魔术数字|
|🔧|[no-multi-spaces](https://eslint.org/docs/rules/no-multi-spaces)<br>[释义](https://cn.eslint.org/docs/rules/no-multi-spaces)|disallow multiple spaces<br>禁止使用多个空格|
||[no-multi-str](https://eslint.org/docs/rules/no-multi-str)<br>[释义](https://cn.eslint.org/docs/rules/no-multi-str)|disallow multiline strings<br>禁止使用多行字符串|
||[no-new](https://eslint.org/docs/rules/no-new)<br>[释义](https://cn.eslint.org/docs/rules/no-new)|disallow new operators outside of assignments or comparisons<br>|
||[no-new-func](https://eslint.org/docs/rules/no-new-func)<br>[释义](https://cn.eslint.org/docs/rules/no-new-func)|disallow new operators with the Function object<br>禁止对 Function 对象使用 new 操作符|
||[no-new-wrappers](https://eslint.org/docs/rules/no-new-wrappers)<br>[释义](https://cn.eslint.org/docs/rules/no-new-wrappers)|disallow new operators with the String, Number, and Boolean objects<br>禁止对 String，Number 和 Boolean 使用 new 操作符|
|✅|[no-octal](https://eslint.org/docs/rules/no-octal)<br>[释义](https://cn.eslint.org/docs/rules/no-octal)|disallow octal literals<br>禁用八进制字面量|
||[no-octal-escape](https://eslint.org/docs/rules/no-octal-escape)<br>[释义](https://cn.eslint.org/docs/rules/no-octal-escape)|disallow octal escape sequences in string literals<br>禁止在字符串中使用八进制转义序列|
||[no-param-reassign](https://eslint.org/docs/rules/no-param-reassign)<br>[释义](https://cn.eslint.org/docs/rules/no-param-reassign)|disallow reassigning function parameters<br>禁止对 function 的参数进行重新赋值|
||[no-proto](https://eslint.org/docs/rules/no-proto)<br>[释义](https://cn.eslint.org/docs/rules/no-proto)|disallow the use of the `__proto__` property<br>禁用 `__proto__` 属性|
|✅|[no-redeclare](https://eslint.org/docs/rules/no-redeclare)<br>[释义](https://cn.eslint.org/docs/rules/no-redeclare)|disallow variable redeclaration<br>禁止多次声明同一变量|
||[no-restricted-properties](https://eslint.org/docs/rules/no-restricted-properties)<br>[释义](https://cn.eslint.org/docs/rules/no-restricted-properties)|disallow certain properties on certain objects<br>|
||[no-return-assign](https://eslint.org/docs/rules/no-return-assign)<br>[释义](https://cn.eslint.org/docs/rules/no-return-assign)|disallow assignment operators in return statements<br>禁止在 return 语句中使用赋值语句|
||[no-return-await](https://eslint.org/docs/rules/no-return-await)<br>[释义](https://cn.eslint.org/docs/rules/no-return-await)|disallow unnecessary return await<br>|
||[no-script-url](https://eslint.org/docs/rules/no-script-url)<br>[释义](https://cn.eslint.org/docs/rules/no-script-url)|disallow javascript: urls<br>禁止使用 javascript: url|
|✅|[no-self-assign](https://eslint.org/docs/rules/no-self-assign)<br>[释义](https://cn.eslint.org/docs/rules/no-self-assign)|disallow assignments where both sides are exactly the same<br>禁止自我赋值|
||[no-self-compare](https://eslint.org/docs/rules/no-self-compare)<br>[释义](https://cn.eslint.org/docs/rules/no-self-compare)|disallow comparisons where both sides are exactly the same<br>禁止自身比较|
||[no-sequences](https://eslint.org/docs/rules/no-sequences)<br>[释义](https://cn.eslint.org/docs/rules/no-sequences)|disallow comma operators<br>禁用逗号操作符|
||[no-throw-literal](https://eslint.org/docs/rules/no-throw-literal)<br>[释义](https://cn.eslint.org/docs/rules/no-throw-literal)|disallow throwing literals as exceptions<br>禁止抛出异常字面量|
||[no-unmodified-loop-condition](https://eslint.org/docs/rules/no-unmodified-loop-condition)<br>[释义](https://cn.eslint.org/docs/rules/no-unmodified-loop-condition)|disallow unmodified loop conditions<br>禁用一成不变的循环条件|
||[no-unused-expressions](https://eslint.org/docs/rules/no-unused-expressions)<br>[释义](https://cn.eslint.org/docs/rules/no-unused-expressions)|disallow unused expressions<br>禁止出现未使用过的表达式|
|✅ 🔧|[no-unused-labels](https://eslint.org/docs/rules/no-unused-labels)<br>[释义](https://cn.eslint.org/docs/rules/no-unused-labels)|disallow unused labels<br>禁用出现未使用过的标签|
||[no-useless-call](https://eslint.org/docs/rules/no-useless-call)<br>[释义](https://cn.eslint.org/docs/rules/no-useless-call)|disallow unnecessary calls to .call() and .apply()<br>禁止不必要的 .call() 和 .apply()|
||[no-useless-concat](https://eslint.org/docs/rules/no-useless-concat)<br>[释义](https://cn.eslint.org/docs/rules/no-useless-concat)|disallow unnecessary concatenation of literals or template literals<br>禁止不必要的字符串字面量或模板字面量的连接|
|✅|[no-useless-escape](https://eslint.org/docs/rules/no-useless-escape)<br>[释义](https://cn.eslint.org/docs/rules/no-useless-escape)|disallow unnecessary escape characters<br>禁用不必要的转义字符|
|🔧|[no-useless-return](https://eslint.org/docs/rules/no-useless-return)<br>[释义](https://cn.eslint.org/docs/rules/no-useless-return)|disallow redundant return statements<br>|
||[no-void](https://eslint.org/docs/rules/no-void)<br>[释义](https://cn.eslint.org/docs/rules/no-void)|disallow void operators<br>禁用 void 操作符|
||[no-warning-comments](https://eslint.org/docs/rules/no-warning-comments)<br>[释义](https://cn.eslint.org/docs/rules/no-warning-comments)|disallow specified warning terms in comments<br>禁止在注释中使用特定的警告术语|
||[no-with](https://eslint.org/docs/rules/no-with)<br>[释义](https://cn.eslint.org/docs/rules/no-with)|disallow with statements<br>禁用 with 语句|
||[prefer-promise-reject-errors](https://eslint.org/docs/rules/prefer-promise-reject-errors)<br>[释义](https://cn.eslint.org/docs/rules/prefer-promise-reject-errors)|require using Error objects as Promise rejection reasons<br>|
||[radix](https://eslint.org/docs/rules/radix)<br>[释义](https://cn.eslint.org/docs/rules/radix)|enforce the consistent use of the radix argument when using parseInt()<br>强制在parseInt()使用基数参数|
||[require-await](https://eslint.org/docs/rules/require-await)<br>[释义](https://cn.eslint.org/docs/rules/require-await)|disallow async functions which have no await expression<br>|
||[vars-on-top](https://eslint.org/docs/rules/vars-on-top)<br>[释义](https://cn.eslint.org/docs/rules/vars-on-top)|require var declarations be placed at the top of their containing scope<br>要求所有的 var 声明出现在它们所在的作用域顶部|
|🔧|[wrap-iife](https://eslint.org/docs/rules/wrap-iife)<br>[释义](https://cn.eslint.org/docs/rules/wrap-iife)|require parentheses around immediate function invocations<br>要求 IIFE 使用括号括起来|
|🔧|[yoda](https://eslint.org/docs/rules/yoda)<br>[释义](https://cn.eslint.org/docs/rules/yoda)|require or disallow “Yoda” conditions<br>要求或禁止 “Yoda” 条件|
