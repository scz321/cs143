前言

本笔记采取问题导向式记录：只记录问题，不记录答案（除非是gpt无法给出清晰解析，并且查找课件也无法得到准确答案，并且我当时也难以理解的问题

## preparation

- 上传之后图片无法正常显示，想看图片可以看同一级目录下的文件：record.pdf

#### 评分

1. 下载评分脚本：

   ```
   CODE
   wget https://courses.edx.org/assets/courseware/v1/2aa4dec0c84ec3a8d91e0c1d8814452b/asset-v1:StanfordOnline+SOE.YCSCS1+1T2020+type@asset+block/pa1-grading.pl
   ```

   编译：

   ```
   CODE
   make lexer
   ```

   测试：

   ```
   CODE
   perl pa1-grading.pl
   ```

#### 报错处理

如果

```
SHELL
make lexer
```

产生如下报错：

```
CODE
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/libfl.so: undefined reference to `yylex' collect2: error: ld returned 1 exit status
```

那么在definitions和rules之间增加如下内容即可：

```
CODE
%option noyywrap
```

git push前：

```
git config --global http.proxy
git config --global https.proxy 
git config --global --unset http.proxy
git config --global --unset https.proxy

(windows需要管理员权限)

如果上面的方法不行，可以试下面的方法（同样需要管理员权限）
git config --global http.sslVerify false
git config --global https.sslVerify false
```

```
git push github_remote thread:thread --force
```

token:

```
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
```

###### push问题也可以用ssh方式解决：

> 你现在遇到的问题是SSH公钥认证失败，表示GitHub没有识别你的公钥，所以拒绝了你的连接请求。为了解决这个问题，你需要确保你的本地SSH公钥已经添加到GitHub账号的SSH Key部分。
>
> 按照以下步骤操作：
>
> 1. **检查你的SSH密钥是否已存在**：
>
>    在你的终端中输入：
>
>    ```
>    bashCopy code
>    cat ~/.ssh/id_rsa.pub
>    ```
>
>    如果你看到了一长串的密钥，那么你的SSH公钥已经存在。
>
>    如果返回"没有此文件或目录"或类似信息，你需要生成一个新的SSH密钥：
>
>    ```
>    bashCopy code
>    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
>    ```
>
>    替换"[your_email@example.com](mailto:your_email@example.com)"为你在GitHub上注册的邮箱地址。
>
> 2. **将SSH公钥添加到GitHub**：
>
>    如果你在第一步中找到了你的公钥或生成了一个新的，使用以下命令复制你的公钥：
>
>    ```
>    bashCopy code
>    cat ~/.ssh/id_rsa.pub | xclip
>    ```
>
>    (注：如果`xclip`没有安装，你可以手动打开`id_rsa.pub`文件并复制内容。)
>
>    - 登录到你的GitHub账户。
>    - 点击右上角的用户头像，然后选择"Settings"（设置）。
>    - 在左侧菜单中，选择"SSH and GPG keys"（SSH 和 GPG 密钥）。
>    - 点击"New SSH key"（新建SSH密钥）按钮。
>    - 在“Title”字段中为你的密钥起一个名字，例如"Personal Laptop"。
>    - 在“Key”字段中粘贴你的公钥。
>    - 最后，点击"Add SSH key"（添加SSH密钥）按钮。
>
> 3. **再次尝试推送**：
>
>    ```
>    bashCopy code
>    git push cs143 master:main
>    ```
>
> 如果按照以上步骤操作后仍然遇到问题，请提供更多的背景信息，我会尽量为你提供进一步的帮助。

## language specification

###### 使用正则语言和正则表达式来进行language specification

![image-20230914145348970](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914145348970.png)

> 你如何理解下面这段话：The standard notation for regular languages is regular expressions.。请结合实例详细解释
>
> 
>
> ChatGPT
>
> 
>
> 这句话说的是，对于正则语言（Regular Languages），通常使用正则表达式（Regular Expressions）作为标准表示方法。
>
> 首先，我们来简单了解一下“正则语言”和“正则表达式”。
>
> 1. **正则语言 (Regular Languages)**: 在计算机科学和形式语言理论中，正则语言是一种特定类型的语言，可以由正则表达式描述或由有限自动机接受。正则语言的主要特点是它们的结构相对简单，并且可以通过计算机上的算法进行高效处理。
> 2. **正则表达式 (Regular Expressions)**: 正则表达式是一种字符串，用来描述一类特定模式的字符串集合。它们通常用于字符串搜索和替换操作，以及数据验证等场景。正则表达式本身有一套特定的语法，可以用来描述复杂的字符串模式。
>
> 现在，举一个实例来进一步解释：
>
> 假设我们想描述所有由三个字母组成的字符串模式。对应的正则表达式可以是：
>
> ```
> cssCopy code
> ^[a-zA-Z]{3}$
> ```
>
> 这个正则表达式可以分为以下部分进行解释：
>
> - `^`: 表示字符串的开始。
> - `[a-zA-Z]`: 表示一个字符，可以是任意的小写或大写字母。
> - `{3}`: 表示前面的模式（即一个字母）重复三次。
> - `$`: 表示字符串的结束。
>
> 所以，整个正则表达式描述的是：一个恰好由三个字母（不区分大小写）组成的字符串。
>
> 这种表达方式使得我们可以非常精确地描述和匹配特定的字符串模式。所以正则表达式成为了描述正则语言的标准表示方法。

对于下面五个规则的介绍，仅仅看课件不够，参阅视频后可以掌握,[链接](https://www.bilibili.com/video/BV17K4y147Bz?p=10&spm_id_from=pageDriver&vd_source=1fcac92e7e383d04d0f8eb7c835fa7cd)

![image-20230914161019777](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914161019777.png)

![image-20230914161626392](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914161626392.png)



- 为什么integer = digit digit*，而integer = digit`*`是不够的?

  > 因为digit*必然包括digit(0)={""}

## language implemention



啊？？ NFA->DFA也行？

> 确实是可以的：把NFA的一个eplsion闭包整体视为一个状态，且在此基础上发生的tansition都是非epsilon的。而且start state和final state也很好定义。
>
> 能看懂下面这张图即可：
>
> ![image-20230914195017621](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914195017621.png)

![image-20230914163043854](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914163043854.png)

正则表达式的notation略作改变：

![image-20230914163213806](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914163213806.png)

###### NFA->DFA转换规则

主要是add transition的部分不太好理解，结合具体例子理解。

值得注意得的是，这里的iff的意思是充分必要条件的意思，也就是说，仅仅在这种case下才可以为新建的DFA新增一个transition

![image-20230914171555746](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914171555746.png)



> 对于这段话中的any我不是很明确，它是否意味着，对于S‘中的任何一个状态，都可以由S中的任何一个状态在input为a的情况下得到？
>
> 
>
> 对于你提到的那段话，"any" 不意味着“对于`S'`中的任何一个状态，都可以由`S`中的任何一个状态在input为a的情况下得到”。
>
> 实际上，它的意思是：“存在一个状态在`S`中，当看到输入`a`时，可以到达`S'`中的某些状态”。
>
> 换句话说，只要`S`中的某个状态在输入`a`时可以到达`S'`中的任何状态（考虑到ε-moves），我们就会在DFA中为`S`和`S'`之间添加一个转换。

emmmm,感觉gpt的解释仍然不是很明确：

还是参考龙书的表述比较准确：S'是S在读入了某个输入串之后可能谓语的所有状态的集合

![image-20230914191105361](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914191105361.png)

## PA2

首先，需要学习flex的相关知识,以下面的示例程序为例，说明一些注意点：

```cpp
 /* scanner for a toy Pascal-like language */

    %{
    /* need this for the call to atof() below */
    #include <math.h>
    %}

    DIGIT    [0-9]
    ID       [a-z][a-z0-9]*

    %%

    {DIGIT}+    {
                printf( "An integer: %s (%d)\n", yytext,
                        atoi( yytext ) );
                }

    {DIGIT}+"."{DIGIT}*        {
                printf( "A float: %s (%g)\n", yytext,
                        atof( yytext ) );
                }

    if|then|begin|end|procedure|function        {
                printf( "A keyword: %s\n", yytext );
                }

    {ID}        printf( "An identifier: %s\n", yytext );

    "+"|"-"|"*"|"/"   printf( "An operator: %s\n", yytext );

    "{"[^{}\n]*"}"     /* eat up one-line comments */

    [ \t\n]+          /* eat up whitespace */

    .           printf( "Unrecognized character: %s\n", yytext );

    %%

    int main( int argc, char **argv )
        {
        ++argv, --argc;  /* skip over program name */
        if ( argc > 0 )
                yyin = fopen( argv[0], "r" );
        else
                yyin = stdin;

        yylex();
        }
```

- 对于正则表达式的匹配，存在如下规则：

  > "x"    :     an ”x”, even if x is an operator.

​	这里其实容易引发歧义，主要是对于operator的理解,这里的operator是指正则表达式中的operator，而不是Expression中的operator，加双引号的意义就在	于此。比如+号在正则表达式和算术运算中有着不同的意义

> 在 `flex` 中，当正则表达式用双引号包围时，它通常表示字符串中的字面值。这意味着它会尝试匹配输入中的确切字符序列，而不是正则表达式中可能表示的特殊字符。
>
> 因此，当你在 `flex` 规则中写：
>
> ```
> flexCopy code
> "+"  { /* action for the + character */ }
> ```
>
> 这意味着它将匹配输入中的实际 `+` 字符，而不是正则表达式中的其他特殊意义（例如，`+` 在正则表达式中通常表示“一个或多个前面的元素”）。
>
> 因此，对于你的问题："x" an ”x”, even if x is an operator。这句话的意思是，即使 `x` 是一个正则表达式的操作符，当它被双引号包围时，它将被识别为字面字符 `x` 而不是操作符。

- 上面的规则定义中，最后有一条：

  ```
      .           printf( "Unrecognized character: %s\n", yytext );
  ```

  这里利用到了规则定义中的一个特性，或者说是yylex函数执行时的一个特性：==按照从前到后的顺序进行匹配，一旦匹配到符合条件的就停止匹配。==也就是说，这些规则的先后顺序本质上就是他们的优先级顺序。

> 这里我的理解其实不是很准确，因为我只考虑到了顺序原则：
>
> 
>
> 在flex定义的规则中，当输入的文本可以被多个模式匹配时，flex遵循以下的规则：
>
> 1. **==最长匹配原则==**：flex会选择与输入文本匹配最长的那个模式。例如，如果输入是"ab"，而规则中有模式"a"和"ab"，则会选择"ab"这个模式。
> 2. **==顺序原则==**：如果有多个模式与输入文本匹配的长度相同，flex会选择在文件中出现最早的那个模式。例如，如果规则文件中先定义了模式"a"，然后是模式"ab"，当输入为"ab"时，尽管两个模式都可以匹配，但flex会选择第一个模式"a"。
>
> 所以，在你提到的那条规则中：
>
> ```
> perlCopy code
> .           printf( "Unrecognized character: %s\n", yytext );
> ```
>
> `.` 这个模式会匹配任何单个字符。因为它是规则文件中的最后一条，所以只有当输入的文本没有被前面的任何模式匹配时，这条规则才会生效。这确保了任何未被其他规则识别的字符都会被这条规则捕获并输出错误消息。这是一个常见的模式，用于报告扫描器中的词法错误。

### Definitions Section

The definition can subsequently be referred to using ‘{name}’, which will expand to ‘==(definition)==’. For example：

定义：

```
DIGIT    [0-9]
ID       [a-z][a-z0-9]*
```

那么在规则部分，

```
{DIGIT}+"."{DIGIT}*
```

就等价于：

```
([0-9])+"."([0-9])*
```

### User Code Section

The user code section is simply copied to lex.yy.c verbatim. It is used for companion routines which call or are called by the scanner. The presence of this section is ==optional==; if it is missing, the second ‘%%’ in the input file may be skipped, too.

> 所以说，对于我自己定义的rule.flex文件，我必须要定义一个main函数，并且在其中调用yylex()，对吗？
>
> 
>
> ChatGPT
>
> 
>
> 不完全是。你是否需要在 `.flex` 文件中定义一个 `main` 函数取决于你的用例和扫描器如何与其他代码协同工作。
>
> 1. **如果 `.flex` 文件是独立的**: 如果你想要生成一个独立的扫描器程序，那么你确实需要在 `.flex` 文件中定义一个 `main` 函数并在其中调用 `yylex()`。这样，当你生成、编译并运行扫描器时，它会开始读取输入，并按照定义的规则进行匹配。
> 2. **与其他代码集成**: 如果你的扫描器是与其他代码（例如 Bison 生成的解析器）一起工作的，那么你可能不需要在 `.flex` 文件中定义 `main` 函数。在这种情况下，其他代码可能会负责调用 `yylex()`。
> 3. **默认的 `main` 函数**: 如果你没有为 `.flex` 文件提供 `main` 函数，`flex` 会为生成的 C 代码提供一个默认的 `main` 函数，这个函数简单地调用 `yylex()` 并返回。这可以方便地用于测试扫描器。
>
> 总之，你是否需要在 `.flex` 文件中定义一个 `main` 函数取决于你的需求。如果你只是想测试扫描器，使用默认的 `main` 函数或自己定义一个就足够了。如果你的扫描器是与其他系统集成的一部分，你可能需要确保适当的代码调用了 `yylex()`。

### Patterns

> \X’
>
> ==if== X is ‘a’, ‘b’, ‘f’, ‘n’, ‘r’, ‘t’, or ‘v’, then the ANSI-C interpretation of ‘\x’. ==Otherwise==, a literal ‘X’ (used to escape operators such as ‘*’)

### 实验细节

- 其实它已经帮你做了很多了——先后顺序已经排好了，这意味着优先级顺序不需要列入我们的考虑范围之内，我们只需要专注于正则表达式的匹配即可

- 在cool-parse.h中，搞清楚美剧类型的yytokentype和YYSTYPE之间的关系：

  首先给出两者的定义：

```
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 46 "cool.y"
{
  Boolean boolean;
  Symbol symbol;
  Program program;
  Class_ class_;
  Classes classes;
  Feature feature;
  Features features;
  Formal formal;
  Formals formals;
  Case case_;
  Cases cases;
  Expression expression;
  Expressions expressions;
  char *error_msg;
}
/* Line 1489 of yacc.c.  */
#line 124 "cool.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

```

- 关于字符串+换行:其匹配规则为：

  ```cpp
  /* 换行 */
  <STRING>\\\n                                                    {
                                                                      curr_lineno++;
                                                                      yymore();
                                                                  }
  ```

  而不是你想当然认为的<STRING>\n

  事实上，匹配到\n是会报错的！

  ```cpp
  <STRING>\n                                                      {
                                                                      cool_yylval.error_msg = "Unterminated string constant";
                                                                      curr_lineno++;
                                                                      BEGIN 0;
                                                                      return ERROR;
                                                                  }
  ```

  以c语言举例：

  ![image-20230916001203258](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916001203258.png)

![image-20230916001341763](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916001341763.png)

> - 使用`BEGIN(STRING);`切换到`STRING`状态，这意味着从此时开始，只有标记为`<STRING>`的模式会被考虑匹配。
> - 使用`yymore();`，这个函数是Flex提供的，它的意思是将下一个识别到的文本追加到`yytext`中，而不是替换它。

- 整数/标识符

- 这里就涉及你对于string table结构体的master了

  > 对于下面的规则。把标识符添加到stringtable中我可以理解，但是为什么对于简单的证书也要将它添加到相应的inttable中？：{DIGIT}+                                                        

  ```cpp
  {DIGIT}+                                                        {   
                                                                      cool_yylval.symbol = 																								inttable.add_string(yytext);
                                                                      return INT_CONST;
                                                                  }
  
  
  [A-Z][0-9a-zA-Z_]*                                              {
                                                                      cool_yylval.symbol = 																								idtable.add_string(yytext);
                                                                      return TYPEID;
                                                                  }
  
  [a-z][0-9a-zA-Z_]*                                              {   
                                                                      cool_yylval.symbol = 																								idtable.add_string(yytext);
                                                                      return OBJECTID;
                                                                  }
  
  ```

  > ChatGPT
  >
  > 在编译器设计中，把数字常量、标识符、类型标识符等加入到各自的表格中的做法是常见的。理由如下：
  >
  > 1. **唯一性和重用**: 将词素（如数字、标识符）添加到表中确保了只为源代码中的每个不同的词素保存一个实例。例如，假设源代码中的数字`123`出现了多次，那么`inttable`中只存储一次`123`。这可以节省内存，并使得之后对这个数字的所有引用都指向同一个地方。
  > 2. **高效的相等性检查**: 当从表中检索或比较值时，不需要对整个字符串进行字符逐字符的比较。由于每个词素在表中都是唯一的，因此可以简单地比较其指针或索引。
  > 3. **额外的信息存储**: 通常，当向这样的表中添加一个项时，除了字符串本身，还可以关联其他信息。例如，可以为每个项分配一个唯一的索引号，或者关联有关该项的附加数据。
  > 4. **代码生成**: 在代码生成阶段，特别是在目标代码或汇编代码的生成中，这些表格为常量提供了方便的管理方式。例如，为每个`inttable`中的数字生成全局数据段中的一个项。
  > 5. **错误检测和调试**: 当编译器发现一个错误或当你在调试模式下运行编译器时，这些表提供了一种简便的方法来引用、打印或处理词素。
  >
  > 考虑这样一个情境：假设你在编译的源代码中有一个大型数组，其所有元素都被初始化为相同的整数值`12345`。如果不使用`inttable`，则每次出现这个数字时，编译器都必须为其分配新的内存，并重复存储同样的字符序列。但是，使用`inttable`，这个数字只存储一次，并为所有其他出现重复使用同一个表项。这不仅节省了内存，而且使得在语义分析和代码生成阶段处理这个数字更为高效。



> 在前面的代码中，解释code_string_table的作用？
>
> 
>
> ChatGPT
>
> 
>
> 在给出的代码中，`code_string_table`是`StrTable`和`IntTable`类的成员函数，但没有给出其具体实现，因此我们只能基于函数名和一般编译器设计的经验来推测其作用。
>
> 在编译器的上下文中，`code_string_table`可能用于==生成目标代码或中间表示==，以定义或引用字符串表或整数表中的项。由于字符串和整数常量在运行时需要特定的内存布局或位置，因此这样的函数用于生成这些布局的代码。
>
> 这是一个简化的例子来解释其可能的作用：
>
> 假设我们有以下的源代码：
>
> ```
> coolCopy codeclass Main inherits IO {
>  main() : IO {
>      out_string("Hello, World!")
>  };
> };
> ```
>
> 在这里，字符串"Hello, World!"需要在运行时被存储在某个位置。编译器首先会将其添加到`stringtable`中。接着，在代码生成阶段，它需要为这个字符串生成数据定义。
>
> 一个简化的汇编代码片段可能如下：
>
> ```
> assemblyCopy code.data
> string_1: .asciiz "Hello, World!"
> ```
>
> `code_string_table`函数可能会负责生成上述汇编代码片段，将所有`stringtable`中的字符串都转换为这种格式的数据定义。
>
> 同样地，对于整数表`inttable`，函数可能会生成整数常量的数据定义。
>
> 总之，`code_string_table`函数可能是用于生成存储在表中的常量的目标代码或中间表示的。但没有具体的函数实现或文档，我们只能推测其精确的作用。



> 我注意到，对于IdTable，并没有这个方法
>
> 
>
> ChatGPT
>
> 
>
> 是的，从你提供的代码来看，确实只有`StrTable`和`IntTable`有`code_string_table`方法，而`IdTable`没有。
>
> 这个设计选择有一定的道理：
>
> 1. **字符串和整数常量需要数据存储**：字符串（如"Hello, World!"）和整数常量（如123）在运行时都需要一个特定的内存位置。这是因为它们是程序的实际数据，所以需要为它们分配存储空间，并在生成的代码中引用这些位置。因此，对于这两种类型的表，我们需要一个方法来生成这些数据的定义。
> 2. **标识符不需要数据存储**：相反，标识符（如变量名、类名或函数名）通常不存储为数据。而是在编译时被转换为某种引用（如内存地址、寄存器或其他编译器生成的标识符）。因此，标识符本身不需要在运行时的数据段中有一个位置。这解释了为什么`IdTable`不需要一个`code_string_table`方法：我们不需要为标识符生成数据定义。
>
> 这种区别是基于编译器如何处理不同种类的符号。字符串和整数常量被视为数据，需要在程序的数据段中分配存储空间；而标识符在编译过程中有不同的处理方式，通常它们的名字在运行时不直接出现，因此不需要生成对应的数据定义。

- operator

  - multiple-character operator和single-character operator的本质区别：

    > /*这里有一个巧妙的设计，对于ASCII码中已经定义的字符集，直接返回，就是它的“值”，而
    > 对于multiple-character operators，就必须要返回自己预先定义的一些值，比如256，257.
    > 这样就实现了=>和=在semantics层面的一致性*/   同样的，关键字的返回值也是基于此，实现了semantically-equal

- 由于这些匹配规则的先后顺序也很重要，所以说，出问题了也要想想是不是顺序没有排对。

- 盘点一些逆天bug：

  > ![image-20230916012700780](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916012700780.png)

- lexer的工作原理：

  > 所以说，我的lexer是针对我写的每一条rule生成一个DFA，还是综合所有的rule生成一个总的DFA？
  >
  > 
  >
  > ChatGPT
  >
  > 
  >
  > ==综合所有的规则生成一个总的DFA。==
  >
  > 具体地说，词法分析器生成工具（例如Flex）通常按照以下步骤工作：
  >
  > 1. **生成NFA**：针对每一个提供的规则（正则表达式），工具会首先为每一个单独的规则生成一个NFA。
  > 2. **合并NFA**：所有这些单独的NFA被组合成一个大的NFA。这可以通过创建一个新的初始状态并从这个状态向每一个规则对应的NFA的初始状态添加ε（空）转移来完成。
  > 3. **从NFA到DFA**：接着，这个大的NFA被转换为DFA。这是通过所谓的“powerset构造法”或“子集构造法”完成的。这个过程可能会生成大量的状态，但每个状态都明确地表示一个特定的字符输入应该如何转移。
  > 4. **状态最小化**：为了使DFA更高效，它会被最小化，以确保它没有冗余的状态。
  >
  > 在执行阶段，词法分析器使用这个总的DFA来匹配输入的字符序列。当它进入一个接受状态（即一个状态代表一个有效的记号结束）时，它会查看是哪条规则首先匹配并执行该规则的关联动作。
  >
  > 由于是总的DFA，它可以在单次扫描中处理所有的规则。这使得DFA驱动的词法分析器非常高效，因为它只需为每个输入字符执行一次状态转移。

  > 你的意思是，词法分析器只要遇到accepted state，就会停止对DFA的遍历，把当前的结果从input'中提取出来？但是这会不会导致不满足最长匹配原则
  >
  > 
  >
  > ChatGPT
  >
  > 
  >
  > 你指出了一个重要的问题，即"最长匹配原则"。我的上一次解释可能有些简化，确实没有涉及这一点。让我们进一步探讨这个问题。
  >
  > 你是对的，DFA在遇到accepted state时不会立即停止。实际上，词法分析器通常使用贪婪匹配策略，尝试找到最长的匹配。
  >
  > 为了说明这一点，我们再考虑一个简单的例子：
  >
  > 规则：
  >
  > 1. `if`
  > 2. `[a-z]+` (匹配任意小写字母串)
  >
  > 现在，如果输入是"ifelse"：
  >
  > - 一个简单的DFA可能在读取"if"时即刻认为已找到一个匹配（即关键字"if"）。
  > - 但根据最长匹配原则，它应该继续读取，因为"ifelse"也符合第二个规则，即一个由小写字母组成的字符串。
  >
  > 因此，词法分析器的工作方式如下：
  >
  > 1. 它会==持续读取，直到没有更多的转移可以接受更多的输入为止==。
  > 2. 然后它==回溯==到上一个accepted state，并返回该状态对应的token。
  >
  > 在上面的例子中，DFA会在读完"ifelse"后停止，但它会回溯到"if"并返回关键字`if`的token，因为规则1在规则列表中出现得比规则2早。
  >
  > 这就是词法分析器如何确保遵循最长匹配原则的。同时，当有多个规则都可以匹配同一个字符串时，它会选择规则列表中最早的那个规则。

- 关于返回的类型和值：

  > 下面是我截取的部分规则：我发现，对于每一个keyword或者是oprator，我是仅仅返回其type，而且每一个不同的operator的返回type都不一样，但是对于字符串，我们在返回时区分它们的值，返回相同的type，为什么会有这种差异？
  >
  > 
  >
  > ChatGPT
  >
  > 
  >
  > 你提到了词法分析器处理关键字、运算符和字面量（如字符串、数字）时的两种不同策略。这两种策略之间的差异源于这些token的语义和用途。让我们一一分析：
  >
  > 1. **关键字和运算符**:
  >    - 关键字（如`if`、`while`）和运算符（如`+`、`-`）在大多数编程语言中具有固定的含义。==对于编译器来说，识别这些token的确切类型就足够了==，因为它们的语义是明确的。
  >    - 举个例子，关键字`if`在源代码中的出现表示一个条件语句的开始。编译器只需要知道遇到了一个`if`关键字，而不需要关心它的“值”。
  >    - 同理，对于运算符，识别出是哪个运算符就足够了（例如`+`、`-`、`*`等）。
  > 2. **字面量**:
  >    - 字面量，如字符串、整数和浮点数，有一个与之关联的值。这个值对于后续的编译步骤（例如语义分析和代码生成）是非常重要的。
  >    - 例如，字符串`"hello"`和`"world"`都是字符串，但它们的值是不同的。因此，虽然它们都是`STR_CONST`类型，但它们的具体值是必要的。
  >    - 同样，数字`42`和`100`都是整数，但它们的值也是不同的。
  >
  > 为了解决这个问题，大多数编译器的词法分析器将为每个token返回两部分信息：
  >
  > 1. **Token类型**：这告诉编译器这是什么样的token（例如，关键字、运算符、字符串、整数等）。
  > 2. **Token的属性值**：这对于字面量是必需的，表示该token的实际值（例如，字符串的内容或整数的数值）。
  >
  > 在你提供的例子中，关键字和运算符只返回其类型，因为它们的值对编译器的后续步骤没有意义。但对于像字符串这样的字面量，返回其类型和值都是必要的。

- 这个PA的扣分全在COMMET的部分，尤其要注意的是对于“全局状态”的把握，一般来说，写出下面的规则是很危险的;它表示在任何状态下你遇到(*字符都会进入COMMENT状态，那么，如果是在STRING状态呢hhh

```
"(*"       {cmt_depth++;BEGIN(COMMENT);}
```

- 正确的写法见源代码
- 总之做PA2的一个很大收获在于体会到了使用%x 定义的这些状态的妙用，以及对源码有了一个初步的认识

![image-20230916121253223](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916121253223.png)

## parser



- 不是所有语言都是正则的

  > 我不太能理解下面这段话：Strings of balanced parentheses are not regular
  >
  > 
  >
  > ChatGPT
  >
  > 
  >
  > 这句话关于“平衡的括号的字符串不是正则的”需要一些形式语言理论的背景来理解。
  >
  > 首先，当我们谈论一个语言是“正则的”，我们指的是该语言可以由一个正则表达式描述，或者说可以由一个确定性有限自动机（DFA）或非确定性有限自动机（NFA）识别。
  >
  > 考虑一个语言L，其中包含所有的平衡的括号字符串。一个字符串被认为是平衡的，当且仅当它包含相同数量的打开括号`(`和关闭括号`)`，并且在任何字符串的前缀中，打开括号的数量都不少于关闭括号的数量。
  >
  > 例如：
  >
  > - `()` 是平衡的。
  > - `()()` 是平衡的。
  > - `(())` 是平衡的。
  > - `)(` 是不平衡的。
  > - `(()` 是不平衡的。****

DFA的不足：对于下面的DFA，它只能判断01字符串中1的数量是不是偶数个，但是不能判断1到达accepted state的次数。而对于诸如左右括号、if-else这种嵌套结构，其acceptd的状态的判断是以来于上面提到的”次数"的，这就引出了parse

![image-20230914200718585](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914200718585.png)

parser vs lexer：

![image-20230914201228904](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914201228904.png)

### 上下文无关法

首先结合具体事例体会它的威力：

> 现在，来看一个具体的例子。
>
> 假设我们有以下的CFG，它描述了简单的平衡括号的字符串：
>
> ```
> S → (S)
> S → SS
> S → ε
> ```
>
> 其中，S是开始符号，ε表示空字符串，"("和")"是终结符。
>
> 使用这个CFG，我们可以生成如下的字符串：
>
> 1. **S → ε**: 这意味着空字符串是这个语言的一部分。
> 2. **S → (S) → ()**: 这表示字符串"()"是这个语言的一部分。
> 3. **S → SS → (S)S → (S)(S) → ()(S) → ()()**: 这表示字符串"()()"也是这个语言的一部分。
>
> 以上的例子都符合定义，即：从开始符号S出发，我们可以经过一系列的产生式得到一个仅由终结符组成的字符串。
>
> 因此，根据给定的定义，该CFG描述的语言是所有由这个CFG生成且仅由终结符组成的字符串的集合。

结合这个例子可以理解这句话：

> Let G be a context-free grammar with start symbol S. Then ==the language of G== is: {a1…an | S →* a1…an and every ai is a terminal }

同时你也可以理解start symbol存在的意义

> 我们常常写出下面的context-free gramer： Expr->id，这里Expr是表达式的意思，我想知道id的详细含义
>
> 
>
> ChatGPT
>
> 
>
> 在许多编译器和形式语言的文献中，`id` 通常是一个代表**标识符**（identifier）的缩写。标识符在编程语言中是一个非常常见的概念，它用于命名变量、函数、类型等。
>
> 在形式化语言和上下文无关文法（Context-Free Grammar, CFG）的描述中，`id` 是一个终结符，它代表源代码中的一个标识符。
>
> 例如，考虑以下的简单语法：
>
> ```
> bashCopy codeExpr -> id
> | Expr + Expr
> | ( Expr )
> ```
>
> 这个语法描述了一个简单的算术表达式，其中表达式可以是一个标识符，两个表达式通过加号连接，或者一个在括号中的表达式。
>
> 在这种情况下，`id` 可以代表任何有效的标识符，例如：`x`, `y`, `totalAmount`, `computeValue` 等。
>
> 在实际的编译器或解释器的实现中，通常会有更为复杂的规则来定义什么样的字符串序列构成一个有效的`id`。例如，在许多编程语言中，标识符必须以字母或下划线开头，后跟字母、数字或下划线。这些具体的词法规则通常是通过词法分析器（lexer）来实施的，而不是在CFG中明确指定的。



> 按照你的说法，纯数字，比如37并不能算作一个标识符，这就意味着37+37并不符合上述要求？
>
> 
>
> ChatGPT
>
> 
>
> 你是对的，基于我先前给出的简化语法，表达式`37 + 37`确实不符合那个语法，因为`37`不是一个标识符（`id`）。
>
> 在许多实际的上下文无关文法中，你会看到对数字（如整数、浮点数等）有明确的定义。例如，我们可以扩展上述语法，使其更加完整：
>
> ```
> scssCopy codeExpr   -> id
> | num
> | Expr + Expr
> | ( Expr )
> 
> id     -> [a-zA-Z_][a-zA-Z0-9_]*
> num    -> [0-9]+
> ```
>
> 在这个扩展的语法中，`id`仍然代表标识符，而新添加的`num`代表数字。`[a-zA-Z_]`和`[a-zA-Z0-9_]*`这样的正则表达式定义了标识符的模式。`[0-9]+`定义了至少一个数字组成的数字模式。
>
> 这样，表达式`37 + 37`就满足这个扩展后的语法了，因为`37`被视为一个数字（`num`），而不是标识符。



截至目前，我们能做的仅仅是判断yes or no：==目前只能够判断a string of tokens是否属于某一种由CFG定义的语言==，但是这距离我们得出语法树还是有相当的距离的。

因此，我们下面要做的工作是：对于某一个EXPR，在判断为yes的基础上，对它进行derivation，得到一个parse tree。

这里又会引出一个问题，对于一个判定结果为yes的EXPR，我们可以由多种方式（一般使用left-most/right-most进行解析）进行derivation得到它，那么，不同的derivation过程就对应着不同的parse tree吗？还是说对于对于一个判定结果为yes的EXPR，其parse tree一定是固定的?



答案是否定的，考虑下面的例子：

> ![image-20230914223153278](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914223153278.png)
>
> 对于同一个expr，我们按照下面展示的CFG，将会解析出两种不同的parse tree，这不是编译器希望看到的
>
> ![image-20230914223304995](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914223304995.png)



这就引出了`ambiguous` grammar的概念了

解决方法：

- 写出更优雅的grammar：（most used)

  > ![image-20230914223825155](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230914223825155.png)
  >
  > - 仔细体会一下这个优化后的grammar，它实现了一个效果：所有的加法都必须在乘法之前被先进行分解，换言之，感觉它从某种程度上实现了乘法和加法的运算优先级的问题

- 另一种方法：（由于使用anbiguous的模式更贴近自然）现在许多编译器都使用这种更自然的方法，在出问题时（出现==二义性==时）再进行特殊处理（with disambiguation delarations)。

eg:下面的原来的grammar具有二义性，但是新增了==Left assosiativity declarition==之后就明确了：

> ![image-20230915113501957](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230915113501957.png)

### error handling

以bison采取的方法为例：理解下面这张图：

![image-20230916154645189](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916154645189.png)

### AST

#### 自顶向下法--recursive descent



##### 直观画图理解--这个过程很好模拟

https://www.bilibili.com/video/BV17K4y147Bz?t=303.7&p=23

##### 算法表述

首先要理解下面3个函数：

![image-20230916161018300](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916161018300.png)

> S返回为真的条件是==any of== Si返回为真，懂？（存在，而非任意）

其实还是有很多细节的：比如下面的例子，就巧妙地利用了&&和||的短路原理实现了不同production优先级排序

> ![image-20230916162804980](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916162804980.png)

##### 存在问题

考虑下面的函数，如果输入int*int，会被rejected：因为E会返回true，但是指针没有遍历整个input。从程序的角度，这正是先前的短路运算导致的：T1的成功导致E的判定成功，这导致其他的production彻底失去了被尝试的可能

![image-20230916164308196](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916164308196.png)

事实上，这个分解算法是由缺陷的，但是它胜在简洁。特别的，如果一种grammar，对于任何非终端节点，最多只有一个production succeed，那么这个算法就刚刚好

##### 左递归问题

- 遇到直接==或者间接==地存在左递归地grammar是。这种自顶向下地算法也会失效
- 这个一般靠人们通过重写语法的方式来避免

[链接](https://www.bilibili.com/video/BV17K4y147Bz?p=26&spm_id_from=pageDriver&vd_source=1fcac92e7e383d04d0f8eb7c835fa7cd)

#### 自顶向下法--predictive parsing

![image-20230916171235599](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916171235599.png)

###### left factoring

- 是什么？为什么？怎么做？

  > 一言以蔽之，改写语法，使得语法的每一步都可以在LL(1)的情况下进行predict
  >
  > ![image-20230916172735204](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916172735204.png)

###### parsing table

- 怎么用?结合例子记忆算法

  > ![image-20230916183812543](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916183812543.png)

![image-20230916184241724](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916184241724.png)

![image-20230916184853438](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916184853438.png)

- 如何生成parsing table？：

  按照下图所示规则：

  - 第一点很好理解：它其实很好的利用了大背景：我们已经对原来的grammar进行了left factoring，因此，只要A经过了*步的推导（这里的`*`表示>=0),发现input中的t在首位，则与之相应的a必然就是唯一应当采取的derivation，这是由left factored的grammar保证的。
  - 第二点其实是对第一种case的一种补充--它考虑到A经过了*步的推导（这里的`*`表示>=0)，得出epsilon的case

  > ![image-20230916190809455](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916190809455.png)

  - first set的计算：

    - 规则：(这里尤其要注意第三点，注意是==for== 1<i<n,这意味着对于A1-n都必须要满足epsilon属于First(X))

      > ![image-20230916193551540](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916193551540.png)

    - 示例：这里，由于First（T）中不包含epsilon，所以FirstE直接等于FirstT，如果包含epsilon的话，根据规则3，只能是子集关系。

      > ![image-20230916193607984](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916193607984.png)

  - follow set的计算：

    - 规则：

      - epsilon只在First set的考虑范围之内，而不在Follow set的考虑范围之内
      - 尤其是要注意对第三条的理解应用

      > ![image-20230916201735490](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916201735490.png)
      >
      > ![image-20230916201707074](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916201707074.png)

    - 示例：尤其是要注意上面规则中的第三条。以下图为例：尤其要注意最终可以得出epsilon的rightmost non-terminal结点。比如这里，X可以得出epsilon，这导致Follow（X）还将包括Follow(E)

    - follow set的计算，主要是找目标出现在哪些位置，把这些位置遍历一遍即可

      > ![image-20230916201523415](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230916201523415.png)

- 基于上面两个方法建立parsing table：理解了Firt set和Follow set的含义之后，建表规则就很好理解了：

  > ![image-20230917105228700](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917105228700.png)

  - parsing table可以用于反向验证先前的grammar是否符合LL（1）的要求，唯一的判断依据是建立parsing table。看看吗=每个entry是不是唯一的
  - 事实证明，大部分主流编程语言对应的语法都不是LL（1）的，但是他的思想得到了传承doge



#### Bottom up法

##### 两个重要概念：viable prefix和handle：

> 请解释viable prefix的概念及其和handle的关系？
>
> 
>
> ChatGPT
>
> 
>
> 在自底向上（bottom-up）语法分析中，两个关键的概念是 "handle" 和 "viable prefix"。
>
> ### Viable Prefix（可行前缀）
>
> **定义**： Viable prefix 是那些可以出现在解析堆栈的顶部的输入字符串的前缀。这些前缀可能是一个句柄，或可能在后续的输入后成为一个句柄。简而言之，这是一个可以在堆栈中进一步解析的前缀，而不会导致错误。
>
> **示例**： 考虑我们之前提到的文法：
>
> ```
> rCopy codeE → E + T | T
> T → T * F | F
> F → ( E ) | id
> ```
>
> 对于输入 `id + id * id`，以下是一些可行的前缀：
>
> - `id`
> - `E +`
> - `E + id`
> - `E + T *` ...等等。
>
> 这些都是可以出现在堆栈顶部的前缀，因为它们都可以在后续的输入后被进一步解析。
>
> 基于其定义，可以有如下推论：
>
> 
>
> ### Handle
>
> 请详细向我解释bottom up语法分析中 handle的概念
>
> 
>
> ChatGPT
>
> 
>
> 自底向上语法分析，特别是在 shift-reduce 解析中，"handle" 是一个核心概念。理解 "handle" 对于理解整个解析过程是很重要的。
>
> **定义**: 在自底向上解析中，"handle" 是一个与文法的某个产生式直接匹配的句柄，可以立即使用这个产生式进行归约。
>
> 以下是与 handle 相关的重要概念：
>
> 1. **位置**：handle 通常位于解析堆栈的顶部。这意味着它是当前已解析符号的一个子串，并且可以立即归约。
> 2. **归约**：当找到一个 handle 时，解析器会将其替换为该产生式的左侧的非终结符。这就是所谓的"reduce"操作。
> 3. **目的**：handle 的概念是为了保证我们在正确的时机进行归约，确保产生的语法树是输入句子的正确解释。
>
> 以一个简单的文法为例：
>
> ```
> rCopy codeE → E + T | T
> T → T * F | F
> F → ( E ) | id
> ```
>
> 考虑一个输入句子 `id + id * id`。
>
> 当我们解析到 `id + id *`，堆栈内容可能是 `E + T *`。在这个状态下，`T *` 是下一个产生式 `T → T * F` 的一个前缀，但它还不是一个 handle，因为我们不能只使用 `T → T *` 进行归约。相反，我们需要继续移入堆栈直到找到一个完整的 handle。
>
> 当我们进一步解析并移入下一个 `id`，堆栈变为 `E + T * F`。现在，`T * F` 是一个 handle，因为它完全匹配产生式 `T → T * F`，因此可以归约为 `T`。
>
> 这个过程继续进行，直到整个输入句子被解析。
>
> 总的来说，handle 是自底向上解析策略的核心，它决定了何时以及如何归约输入句子的一部分。找到正确的 handle 是确保得到正确语法树的关键。
>
> ### Viable Prefix 与 Handle 的关系
>
> 1. **所有的 handle 都是 viable prefix**：当一个字符串前缀是一个 handle 时，它可以被立即归约。但是，并不是所有的 viable prefix 都是 handle。
> 2. **堆栈上的内容始终是一个 viable prefix**：解析器的工作是确保堆栈上总是一个可行的前缀，这意味着它可以在后续的输入后继续解析。
> 3. **归约时机**：当堆栈的顶部是一个 handle 时，解析器会进行归约操作。但如果堆栈顶部只是一个可行的前缀（而不是句柄），那么解析器可能选择移入操作。
>
> 总结一下，viable prefix 是描述可以在堆栈上进一步解析的前缀，而 handle 是指示归约操作何时应该发生的特定类型的可行前缀。理解这两个概念以及它们之间的关系对于理解自底向上解析过程非常关键。



NFA构建算法：

1.Add a new start production S’ → S to G（grammar） 

2.The NFA states are the items of G –(Including the new start production) 

3.For item E → α.Xβ add transition E → α.Xβ  →X  E → αX.β 

- 这里的X既可以是terminal，又可以是non-terminal

4.For item E → α.Xβ and production X → γ add E → α.Xβ   →ε   X → .γ

- 这里的X必然是non-terminal

- 要理解第四点，首先要足够理解NFA：它的状态转移应当理解成一种并行的状态的探索

  > 当我们看到形如`E → α.Xβ`的项时，它表示当前的解析位置在X之前。此时，解析器试图决定下一步是移入`X`还是执行某种归约。为了做出决策，解析器需要考虑可能的产生式，即`X`可能如何展开。
  >
  > 考虑项`E → α.Xβ`和产生式`X → γ`。虽然在当前输入位置上还没有明确的`γ`，但解析器需要知道这是一个可能的选择。因此，解析器考虑ε-转移来表示这一可能性，即在没有消耗任何输入的情况下开始解析`X`。
  >
  > 此ε-转移并不意味着我们已经在输入中看到了`γ`，而是表示我们正在为解析`X`做准备，并考虑它可以如何展开。这就是为什么虽然`E → α.Xβ`和`X → .γ`的成立条件不同，但在这种上下文中使用ε-转移是有意义的。



![image-20230917195638197](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917195638197.png)

目前对于下面这张图中的某些transition不是很理解（或者说对NFA还是不够理解？

![image-20230917202429105](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917202429105.png)

转换为DFA：

![image-20230917220846671](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917220846671.png)



##### SLR

- 主要为了减少conflicts

- 新增执行reduce的条件：

  > ![image-20230917221345975](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917221345975.png)
  >
  > 举个例子：对于下面的FDFA，当读取到int的时候，由于*在Follow（T）中，所以进行reduce而不是shift
  >
  > ![image-20230917222122150](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917222122150.png)

- 算法：尤其是注意篮筐的两条

  > ![image-20230917223726838](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917223726838.png)
  >
  > 如果在采用了避免措施的情况下，仍然在最后一步发生conflict，那么就是grammar的问题：当前grammar不是SLR（k）的grammar
  >
  > [这里有一个典型例子](https://learning.edx.org/course/course-v1:StanfordOnline+SOE.YCSCS1+3T2020/block-v1:StanfordOnline+SOE.YCSCS1+3T2020+type@sequential+block@08517ec4c5fd4e5f9e814a8c0be8adb7/block-v1:StanfordOnline+SOE.YCSCS1+3T2020+type@vertical+block@ff7b537ff38a4128813e4af06121103e),需要注意的是，每次发生reduce之后都需要从头开始





##### SLR improvement

> 算法：求求你给我个例子吧qwq
>
> ![image-20230917230543320](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917230543320.png)





























- Important Fact #1:A bottom-up parser traces a ==rightmost derivation== in ==reverse==

  > 结合下面这张图片理解上面的话
  >
  > ![image-20230917133710082](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917133710082.png)

- reduction：和derivation相反的操作

- shift move& reduce move

  - 使用stack很合适，因为我们永远只可能对vertical bar左边字符的末端进行reduce
  - shift-reduce conflict：相对来说容易解决
  - reduce-reduce conflict：难以解决，一般是严重的语法问题

- 所以这里的核心自然就在于：确定vertical bar在移动过程中，next step是shift还是reduction?

- 这样就自然引出了handle：

  - intuition：

    > ![image-20230917155248683](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917155248683.png)

    

- Important Fact #2:In shift-reduce parsing, handles appear ==only at the top of the stack==, never inside(可以说是根据其intuition的一个推论)

- 关于viable prefix：

  > 请结合具体示例详细解释？
  >
  > 
  >
  > ChatGPT
  >
  > 
  >
  > 当然可以。让我们使用一个简单的例子来解释。
  >
  > 考虑一个非常简单的语法，它只接受形如 `a*b` 的字符串。这意味着我们期待一个或多个 'a' 字符，后面紧跟一个或多个 'b' 字符。
  >
  > 现在，我们有一个基于堆栈的解析器，它按照这个语法来解析字符串。
  >
  > **示例 1：**`aaab`
  >
  > 1. 解析器开始读取输入的第一个字符，它是 'a'。
  > 2. 'a' 是一个可行的前缀，因为按照我们的语法，'a' 可以出现在最前面。因此，解析器将它推入堆栈。
  > 3. 解析器继续读取，遇到第二个 'a'，这仍然是一个可行的前缀，所以再次推入堆栈。
  > 4. 当解析器读取到 'b' 时，根据我们的语法，'a' 后面可以跟 'b'，所以解析器开始弹出堆栈上的 'a' 并接受 'b'。
  > 5. 解析器成功地解析了整个字符串，并且没有发现错误。
  >
  > **示例 2：**`aaba`
  >
  > 1. 解析器开始读取第一个字符 'a' 并推入堆栈。
  > 2. 继续读取下一个字符 'a' 并再次推入堆栈。
  > 3. 解析器读取到 'b'，开始弹出堆栈上的 'a' 并接受 'b'。
  > 4. 解析器读取到最后一个字符 'a'。此时，根据我们的语法，'b' 后面不应该是 'a'。此时，尽管堆栈上之前的内容（例如 'a'）都是可行的前缀，但现在解析器遇到了一个错误，因为 'b' 后面不能跟 'a'。
  >
  > 在第二个示例中，尽管堆栈上有可行的前缀 'a'，但由于后续输入的字符不符合期望的模式，因此检测到了一个解析错误。
  >
  > 这个例子的核心思想是，只要堆栈上的内容可以与之后的输入合并成有效的语法结构，解析器就认为一切正常。只有当堆栈上的内容无法与之后的输入合并成有效的语法结构时，解析器才会检测到错误。

- Important Fact #3 about bottom-up parsing: For any SLR grammar, ==the set of viable prefixes is a regular language==

  > 请结合合适的例子解释下面这段话：Important Fact #3 about bottom-up parsing: For any SLR grammar, the set of viable prefixes is a regular language
  >
  > 
  >
  > ChatGPT
  >
  > 
  >
  > 好的，让我们首先分解这段话的关键概念，然后使用示例进行解释。
  >
  > 1. **Bottom-up parsing**：这是一个解析方法，从输入的叶子（单个的词法单元或字符）开始，逐步构建语法结构，直到达到起始符号。
  > 2. **SLR grammar**：SLR代表Simple LR. SLR文法是LR(0)文法的一种简化版本，它使用了更简单的方法来检查文法的冲突。
  > 3. **Viable prefixes**：如前所述，这些是可以出现在堆栈顶部的输入字符串的前缀，并且可能指向有效的解析。
  > 4. **Regular language**：正则语言是可以由正则表达式或确定性有限自动机（DFA）表示的语言。它们是形式语言的一个子集，具有可计算性质。
  >
  > 现在，重要事实#3的核心内容是：对于任何SLR文法，其可行前缀的集合都是一个正则语言。这意味着我们可以使用确定性有限自动机（DFA）来识别和处理这些可行前缀。
  >
  > **示例**：
  >
  > 考虑一个简单的文法，它描述了加法：
  >
  > ```
  > mathematicaCopy codeE -> E + E
  > E -> n
  > ```
  >
  > 其中E代表表达式，n代表数字。
  >
  > 现在，假设我们正在使用基于堆栈的解析器进行自底向上的解析。当我们遇到输入`n + n`时，我们会经历以下过程：
  >
  > 1. 将`n`压入堆栈。
  > 2. 当我们遇到`+`时，我们可以将前面的`n`识别为一个表达式E。
  > 3. 继续推进，我们再次将`n`识别为另一个表达式E。
  >
  > 这里的关键点是，==堆栈上的内容（例如`E +`）构成了可行前缀的集合==。这个可行前缀的集合可以通过一个确定性有限自动机（DFA）进行识别，因为它是一个正则语言。
  >
  > 这个事实是自底向上解析的一个关键组成部分，因为它意味着我们可以使用DFA来有效地识别并处理堆栈上的内容，以确定如何继续解析或何时应用文法规则。
  >
  > 为了真正构建这样的DFA并处理更复杂的文法，通常需要使用解析器生成工具，如Yacc或Bison，这些工具可以为给定的文法自动生成相应的DFA。

  - notation:Item T → (E.) says that so far we have seen (E of this production and hope to see )

    - 额额，其实就是用.来标记当前vertical bar所在的位置

  - 结合下面的例子理解，如何结合前面的概念，生成与之对应的NFA：

    > grammar：
    >
    > ![image-20230917165205763](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917165205763.png)
    >
    > NFA：
    >
    > ![image-20230917181713844](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230917181713844.png)



 

















## PA3

- 注意理解词法分析和语法分析是如何综合起来的

###### 好好好

![image-20230921165703908](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230921165703908.png)

![image-20230921001732278](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230921001732278.png)

###### 关于cool-tree.aps与tree.h、cool-tree.h之间的关系的理解

> 目前不是很理解这个.aps文件是如何在编译过程中发挥作用的。当时，对于.aps文件的理解花费了很长时间。目前来看，最好的情况是，这个所谓的aps文件+bison只是为程序员提供了一层建立AST树的抽象。
>
> ![image-20230919230657152](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230919230657152.png)

cool-tree.aps与tree.h、cool-tree.h其实没有必要完全读完，要建立Abstraction的概念，知道这些工具怎么用就好了。反而是==仔细读读bison的文档==，比如第二章的example部分对于加深对整个语法分析、词法分析过程的理解很有帮助。

###### %type

- 关于cool.y的一些源码分析（注意是语法不熟悉hhh

  > 在Bison中（这是你在示例中使用的工具，它是用于创建parsers的GNU工具），`%type`用于指定非终端符号的类型。
  >
  > 具体来说，Bison中的每一个非终端都有一个与之相关联的“语义值”。这些值是在解析过程中构建和传递的。你可以将它们视为在语法分析器规则中由`$$`和`$1`、`$2`等符号引用的值。
  >
  > 例如，在示例中：
  >
  > ```
  > %type <program> program
  > ```
  >
  > 这一行声明了一个非终端`program`，其语义值的类型为`program`（这个类型在之前的`%union`中已经定义）。
  >
  > 同样：
  >
  > ```
  > %type <classes> class_list
  > %type <class_> class
  > ```
  >
  > 上面两行分别为`class_list`和`class`这两个非终端指定了语义值的类型。
  >
  > 简而言之，`%type`指令允许你为每个非终端指定一个类型，这样你在处理这些非终端的值时就知道它们的具体类型了。

###### TYPEID和OBJECTID

> 1. **TYPEID 278**
>
>    - `TYPEID`很代表一个类型标识符，例如在许多面向对象的编程语言中，类的名称就是一个类型标识符。所以在COOL（Classroom Object-Oriented Language）中，当你定义一个新的类时，例如`class Hello {}`，这里的`Hello`就是一个`TYPEID`。
>
> 2. **OBJECTID 279**
>
>    它可能表示对象的标识符，即变量名或方法名。在面向对象的语言中，对象通常是一个类的实例。例如，考虑以下的COOL代码：
>
>    ```
>    let greeting: String <- "Hello World!";
>    ```
>
>    在这里，greeting是一个OBJECTID，它是String类型的一个实例。
>
> 现在，为什么要为这些标识符提供类型，例如`<symbol>`？这是因为，在词法分析期间，当词法分析器识别到一个字符串常量、类型标识符或对象标识符时，它不仅返回token类型（例如`STR_CONST`、`TYPEID`或`OBJECTID`），还返回与该token关联的值。这些值通常存储在symbol table中，并且在语法分析或后续的编译阶段可以进一步访问。
>
> 举例来说，对于以下的代码：
>
> ```
> let greeting: String <- "Hello World!";
> ```
>
> - `greeting`被词法分析器识别为`OBJECTID`，它的值可能会被存储在symbol table中以供后续使用。
> - `String`被识别为`TYPEID`，它的值也存储在symbol table中。
> - `"Hello World!"`被识别为`STR_CONST`，与此token关联的值是实际的字符串内容"Hello World!"。
>
> 这种机制允许Bison在解析过程中访问和操纵这些值，从而为下一编译阶段提供丰富的上下文信息。

###### 错误处理

这部分是这次作业的难点，主要是根据PA2的错误处理部分：

- 如果类定义中有错误，但该类正确终止，并且下一个类的语法正确，则解析器应该能够在下一个类定义时重新启动。
- 类似地，解析器应该从feature（继续到下一个feature）、let绑定（继续到下一个变量）和{…}块中的表达式中的错误中恢复。

这两部分对应如下三种含义：

- 如果处理class时报错，应该忽略该错误，然后处理后续的class。
- 如果处理feature时报错，则忽略该错误，然后处理后续的feature。
- 如果处理let时报错，则忽略该错误，然后处理后续的let。

对应的代码：

```
CPPclass
  : CLASS TYPEID '{' feature_list '}' ';'
    { $$ = class_($2,idtable.add_string("Object"),$4,
      stringtable.add_string(curr_filename)); }
  | CLASS TYPEID INHERITS TYPEID '{' feature_list '}' ';'
    { $$ = class_($2,$4,$6,stringtable.add_string(curr_filename)); }
  | CLASS error ';' class 
    { $$ = $4; }
    
feature_list
  :		/* empty */
    { $$ = nil_Features(); }
  | feature_list feature
    { $$ = append_Features($1, single_Features($2)); };
  | feature_list error ';'
    { $$ = $1; }
    
let
  : OBJECTID ':' TYPEID IN expr
    { $$ = let($1, $3, no_expr(), $5); }
  | OBJECTID ':' TYPEID ASSIGN expr IN expr
    { $$ = let($1, $3, $5, $7); }
  | OBJECTID ':' TYPEID ',' let
    { $$ = let($1, $3, no_expr(), $5); }
  | OBJECTID ':' TYPEID ASSIGN expr ',' let
    { $$ = let($1, $3, $5, $7); };
  | error ',' let
    { $$ = $3; }
```

## PA2 vs PA3

###### 两者是如何联系起来的？

> 1. **接口**:
>    - 当 `flex` 识别出一个记号，它会调用 `yylex()` 函数返回这个记号的类型。
>    - `bison` 生成的解析器会周期性地调用 `yylex()` 函数来获取下一个记号，并根据给定的文法规则进行解析。
> 2. **数据交换**:
>    - 当 `flex` 识别出一个记号，它不仅返回记号的类型，还可能设置一个全局变量（如 `yylval`）来传递与该记号相关的附加数据（例如，如果记号是一个整数常量，`yylval` 可能包含该整数的值）。
>    - 当 `bison` 的解析器调用 `yylex()` 并接收到一个记号时，它可以访问 `yylval` 来获取与该记号相关的数据。
> 3. **协作**:
>    - `bison` 通常会提供一个函数 `yyerror()` 来报告解析错误。这个函数也可以被 `flex` 生成的词法分析器使用，以报告例如非法字符之类的词法错误。
>    - 通过合适的错误处理和同步策略，`flex` 和 `bison` 生成的代码可以协同工作，即使在面对错误输入时也能继续进行。
>
> 为了将 `flex` 和 `bison` 生成的代码整合到一起，通常的做法是：
>
> 1. 使用 `flex` 编写一个 `.l` 文件来定义词法规则。
> 2. 使用 `bison` 编写一个 `.y` 文件来定义语法规则。
> 3. 分别使用 `flex` 和 `bison` 工具编译 `.l` 和 `.y` 文件，生成源代码。
> 4. 将生成的源代码与其他代码一起编译，生成最终的编译器或解释器。
>
> 这样，`flex` 和 `bison` 就协同工作，将源代码从文本形式转化为一种更适于进一步处理（如优化和代码生成）的形式。

###### 作用过程对比

flex的作用是一个一个char的读取，按照正则表达式的规则识别token，而bison的规则是一个一个token读取，按照语法规则（这里的语法规则是否也是满足正则表达式？？）识别出一个terminal symbol 或者non terminal symbol。从这个角度来说，它们都只是借助了NFA/DFA的强大功能，实现了基于特定规则的匹配。



不同之处在于，bison在每次识别成功之后，都会对AST进行一步构建。tree.h和cool-tree.h的头文件就是为我们提供与之相关的所有数据类型以及接口函数（主要展示一些构造函数）对于下面的例子，就调用了nil_Features()和append_Features接口函数。

```
 /* Feature list may be empty, but no empty features in list. */
  feature_list
      :		/* empty */
        { $$ = nil_Features(); }
      | feature_list feature
        { $$ = append_Features($1, single_Features($2)); };
      | feature_list error ';' //看，错误处理！
        { $$ = $1; }
```

> 所以说，tree.h和cool-tree.h的编写对于语法分析来说是很关键的一个部分。

似乎这两个关于AST的生成其实不是靠人写的，而是借助那个cool-tree.aps自动化地生成了所有与之相关的cpp代码？

> 您的总结大部分是正确的，但有几点需要更详细地说明或微调。
>
> 1. **flex 和 bison 的角色**:
>    - 正如您所说，`flex` 的作用确实是按字符读取输入并根据正则表达式的规则识别记号（token）。这个过程称为词法分析。
>    - `bison` 则按照给定的上下文无关文法的规则，一个接一个地读取记号并识别更高层次的结构，如表达式、语句等。这个过程称为语法分析。
> 2. **文法的类型**:
>    - `bison` ==使用的是上下文无关文法，而不是正则文法。这意味着它可以描述比正则表达式更复杂的语言。而正则文法（由正则表达式描述）只是上下文无关文法的子集。==
> 3. **NFA/DFA**:
>    - 您是对的，`flex` 的内部机制确实利用了 NFA/DFA 来实现正则表达式的匹配。但 `bison` 则使用了不同的算法（如 LR(1)、LALR(1) 等）来实现上下文无关文法的解析。
> 4. **构建抽象语法树**:
>    - 您正确地指出，`bison` 的规则中的动作通常用于构建抽象语法树（AST）。`tree.h` 和 `cool-tree.h` 确实提供了相关的数据类型和接口函数。
> 5. **自动化生成**:
>    - 您也是对的，通常 `tree.h` 和 `cool-tree.h` 中的代码会由一些工具自动生成，如您提到的 `cool-tree.aps`。这种自动化生成可以确保与文法规则的一致性，并简化了添加新规则或修改现有规则时的工作。
>
> 综上所述，您的总结很准确，只是需要注意 `bison` 使用的是上下文无关文法，而不是正则文法。而且，`bison` 的解析算法与 `flex` 使用的 NFA/DFA 有所不同。

###### 各种文法的对比

- 好吧，课本还是有东西的。确实听听课还是有价值的,高珍老师的ppt要比gpt讲的清晰、严谨很多

> - <img src="C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230921144553305.png" alt="image-20230921144553305" style="zoom: 67%;" />
>
> - <img src="C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230921144627351.png" alt="image-20230921144627351" style="zoom: 67%;" />
>
> - <img src="C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230921144643980.png" alt="image-20230921144643980" style="zoom: 67%;" />
>
> - <img src="C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230921144752838.png" alt="image-20230921144752838" style="zoom: 67%;" />
>
>   这里的“下推自动机”：可以简单的理解为： 一个简单的有限自动机==加上一个栈结构==即可
>
> - <img src="C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230921145051854.png" alt="image-20230921145051854" style="zoom:67%;" />
>
> 

> 请系统化地解释正则文法和上下文无关文法之间的关系，对所有文法的分类和包含关系进行分析
>
> 
>
> ChatGPT
>
> 
>
> 文法的分类通常是基于其产生式（production rules）的复杂性。下面是常见的文法分类及其关系：
>
> 1. **正则文法（Regular Grammars）**:
>    - **描述能力**：可以描述所有正则语言。正则语言是最简单的形式语言类别。
>    - **应用场景**：正则文法主要用于词法分析和简单的文本模式匹配。
>    - **产生式示例**：A -> aB, A -> a
>    - **实现机制**：可以由确定性有限自动机（DFA）或非确定性有限自动机（NFA）来识别。
>    - **常用工具**：正则表达式。
> 2. **上下文无关文法（Context-Free Grammars, CFG）**:
>    - **描述能力**：比正则文法的描述能力强，但不能描述所有的形式语言。例如，它不能描述所有需要平衡括号的语言。
>    - **应用场景**：上下文无关文法常用于编程语言的语法分析阶段。
>    - **产生式示例**：A -> aBb, B -> b
>    - **实现机制**：可以由推导自动机或LR解析器来识别。
> 3. **上下文相关文法（Context-Sensitive Grammars）**:
>    - **描述能力**：比上下文无关文法的描述能力强。
>    - **应用场景**：上下文相关文法在实际编译器设计中使用较少，但它们可以描述某些在CFG中不可能描述的语言。
>    - **产生式示例**：aAb -> aBb (只有在A前有a时，A才可以转换为B)
>    - **实现机制**：由线性有界非确定性图灵机来识别。
> 4. **递归可枚举文法（Recursively Enumerable Grammars）**:
>    - **描述能力**：这是描述能力最强的文法类型，可以描述任何由图灵机可识别的语言。
>    - **应用场景**：由于其复杂性，在实际编译器设计中很少使用。
>    - **实现机制**：由图灵机来识别。
>
> **关系与包含性**:
>
> 文法的描述能力有一个清晰的包含关系：正则文法是上下文无关文法的子集，上下文无关文法是上下文相关文法的子集，而上下文相关文法是递归可枚举文法的子集。或更形象地说：
>
> ```
> 正则文法 ⊆ 上下文无关文法 ⊆ 上下文相关文法 ⊆ 递归可枚举文法
> ```
>
> 简而言之，当我们从正则文法向递归可枚举文法移动时，文法的描述能力增加，但文法的处理和解析变得更加复杂。



正则文法vsCFG

> 结合具体实例说明上下文无关文法和正则文法的区别？在我看来，它们形式上是一样的，只是具体的文法内容不同？
>
> 
>
> ChatGPT
>
> 
>
> 上下文无关文法（CFG）和正则文法（RG）的确都是用于描述形式语言的，但它们的能力和适用场合是有区别的。首先，让我们通过具体的实例来理解这两者的不同。
>
> ### **正则文法（Regular Grammar）**:
>
> - 只能使用右线性（右递归）或左线性（左递归）的产生式。
> - 通常用于描述可以通过有限状态机（FSM）进行识别的语言。
>
> **示例**:
>
> 描述所有由零或多个 `a` 组成的字符串的语法：
>
> ```
> rustCopy code
> S -> aS | ε
> ```
>
> ### **上下文无关文法（Context-Free Grammar）**:
>
> - 可以描述更复杂的结构，如嵌套结构。
> - 通常用于描述可以通过推导自动机（如LL或LR解析器）识别的语言。
>
> **示例**:
>
> 描述所有正确配对的括号字符串的语法：
>
> ```
> rustCopy code
> S -> (S) | SS | ε
> ```
>
> ### **对比和说明**:
>
> 1. **描述能力**:
>    - RG 可以描述所有正则语言，而 CFG 可以描述更多，包括一些非正则语言。
>    - 例如，上述的配对括号语言是非正则的，因此不能用正则文法（或正则表达式）描述，但可以用上下文无关文法描述。
> 2. **形式**:
>    - 尽管它们的形式看起来相似，但 CFG 允许更复杂的产生式。
>    - 在 RG 中，每个产生式的右侧要么是非终端符号后跟终端符号，要么是终端符号后跟非终端符号，或只有终端符号。而 CFG 则没有这种限制。
> 3. **解析方法**:
>    - RG 可以使用有限状态机（FSM）来解析，而 CFG 则需要更复杂的解析技术，如递归下降解析或LR解析。
> 4. **应用场景**:
>    - RG 通常用于词法分析阶段，例如在编译器前端将源代码分解为标记。
>    - CFG 用于语法分析阶段，例如在编译器前端建立抽象语法树。
>
> 简而言之，上下文无关文法和正则文法在形式上可能看起来类似，但它们的描述能力和应用场景有很大的不同。CFG 可以描述 RG 无法捕获的某些复杂结构。
>
> 
>
> 所以说，它们形式上是一样的，只是具体的文法内容不同。我想知道具体的不同之处在哪，它们分别对于文法的书写有何区别
>
> 
>
> ChatGPT
>
> 
>
> 对，您的理解是对的：正则文法（RG）和上下文无关文法（CFG）确实在形式上都使用产生式，但是它们的产生式有一些固有的约束和特点，这些约束和特点决定了它们描述语言的能力。
>
> ### **正则文法（RG）**:
>
> - 右线性（或右递归）
>
>   ：每个产生式的右侧由一个终端符号和一个非终端符号（或无）组成。
>
>   ```
>   cssCopy code
>   A -> aB | a
>   ```
>
> - 左线性（或左递归）
>
>   ：每个产生式的右侧由一个非终端符号和一个终端符号（或无）组成。
>
>   ```
>   cssCopy code
>   A -> Ba | a
>   ```
>
> - 正则文法不允许描述中间结构，例如嵌套结构。
>
> ### **上下文无关文法（CFG）**:
>
> - 没有上述正则文法中的那些限制。每个产生式的右侧可以是任意组合的终端符号和非终端符号。
>
> - 可以描述复杂的中间结构，例如嵌套结构。
>
>   ```
>   rustCopy code
>   S -> aSb | ε
>   ```
>
>   这描述了形如 
>
>   ```
>   aabb
>   ```
>
>   、
>
>   ```
>   aaabbb
>   ```
>
>    等具有平衡的 
>
>   ```
>   a
>   ```
>
>    和 
>
>   ```
>   b
>   ```
>
>    的语言。
>
> ### **不同之处**:
>
> 1. **产生式的形式**：
>    - 正则文法的产生式具有特定的形式：要么右递归，要么左递归。CFG 没有这种形式限制。
> 2. **描述能力**：
>    - CFG 能够描述一些 RG 无法描述的语言，例如需要平衡括号或其他嵌套结构的语言。
> 3. **嵌套结构**：
>    - RG 不能描述任何形式的嵌套或递归结构，而 CFG 可以。
>
> ### **结论**:
>
> 尽管 RG 和 CFG 在形式上都使用产生式，但它们在描述能力上有很大的不同，这主要是由于它们对产生式形式的不同约束所决定的。CFG 由于其更大的灵活性，通常用于描述编程语言的语法，而 RG 由于其简单性，通常用于描述更简单的模式，如正则表达式中使用的模式。

###### CFG 和 LL（1） LR LALR之间的关系

> LL(1)文法，LR文法，都是上下文无关文法的子集，都是CFG的在不同约定下的，便于解析的写法，对吗？
>
> 
>
> ChatGPT
>
> 
>
> 是的，您的理解是正确的。LL(1)文法和LR文法都是上下文无关文法（CFG）的子集，它们的设计是为了使解析更为简单和直接。让我们更具体地解析一下：
>
> ### 1. **LL(1) 文法**：
>
> - **LL** 代表从左到右扫描输入（第一个L）并从左到右产生派生（第二个L）。
> - **(1)** 代表使用一个符号的前瞻来决定下一步的解析动作。
> - LL(1)文法特别适合**递归下降解析**，这是一种简单的、可以手写的、顶部向下的解析方法。
> - LL(1)文法要求对于给定的非终端和输入符号，必须有一个明确的产生式来应用，也就是说，它不允许有二义性。
>
> ### 2. **LR 文法**：
>
> - **LR** 代表从左到右扫描输入（L）并从右到左产生派生（R）。
> - **LR解析器**是一种底部向上的解析器，它构建一个解析树，从叶子开始并向上到根。
> - LR文法比LL(1)文法能描述的语言范围更广泛。
> - 常见的LR解析器有：SLR、LALR、Canonical LR等，其中**LALR**（Look-Ahead LR）==是很多实际工具（如 Yacc 和 Bison）中最常用的==。
>
> ### 3. **关于子集关系**：
>
> - 并不是所有的上下文无关文法都是LL(1)或LR(1)。这两者都是CFG的子集，并且它们都有自己的限制。
> - 通常，LR文法的范围更广，因此LR解析器可以处理更多的上下文无关文法。
>
> ### 4. **目的和应用**：
>
> - 这两种文法的制定是为了简化解析。特定的解析技术可能只适用于某种特定类型的文法。
> - 为了使一个给定的CFG适合特定的解析技术（如LL或LR），通常需要重写或修改原始的CFG。
>
> 综上所述，您是对的：LL(1)和LR文法都是上下文无关文法的子集，它们都是为了便于特定的解析技术而定义的特定形式的CFG。





## Semantic analysis

- What Does Semantic Analysis Do?具体包括哪些方面？

  > ![image-20230922164407243](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922164407243.png)

- 对于这次lab来说，3，4点可以一起实现，核心在于建立type的的继承图（同时这个继承图也会在type checking，type inference中起到作用，所以优先进行）

- 剩下的要求主要就是type environment、type inference，目前的想法是：首先自底向上进行inference&checking，符合inference的假设条件的就对结果进行

- 对于type checking，type checking的核心在于对与不同type的对象之间的==运算符==的处理：比如，3+“2”在cool语言中是不合理的（因此也不会有相应的、相匹配的inference rule存在，换言之，在inference的过程中我们会推测根据3和“2”的字面值推导出它们分别的类型==，但是，并不会计算这个表达式的类型，因为不存在与之对应的inference rule==，而这应当就是type checking发挥作用的地方：呃呃，好像逻辑很简单：只要发现没有相关的rule，就报错，并且进行相关的错误处理（使得编译继续下去），这就是type checking，有rule，就进行inference）

- 在完成了前述的自底向上的过程后，AST的每一个node都会有与之对应的type，此时，再自顶向下构建每一个node的type environment，因此推测type environment的实现应该是为每一个node新增一个属性（本实验中应该是3个，变量、method、selftype各一个）

### scope

- 为什么需要引入scope的概念？
- most closely nested rule
- static scope vs dynamic scope
- 列举cool语言中的所有identifier（6种：
- 这六种identifier对于`most closely nested rule`有着不同的反响，Not all kinds of identifiers follow the most-closely nested rule
  - class：
  - attr：
  - method：


### type checking

###### 为什么需要type cheking

- 提示：从汇编（机器代码）的视角出发

###### 3种基础case的处理

- 这里考虑常规的3种case（也即：let expr、case expr、formal expr）：对于它们的type check思路不难：可以使用stack轻松实现这一点：stack的每一个元素的类型是一个symbol table，除了基本的push和pop操作之外，增加一个find的操作。


- ？？？这种做法的弊端在于容易出现存储空间的浪费，好处在于容易理解

- 优化版本的stack：stack的每一个元素是一个具体的symbol，而push和add操作不变==，find的逻辑为：自栈顶往下遍历，找到的第一个符合要求的symbol作为结果==。没有则返回-1

- ？？？无法处理变量重定义的错误，本质上是之前的栈结构==不能保证在同一个scope内变量声明的唯一性==，解决方法也很简单：新增一个check函数，每次执行add之前调用一次。
- 但是仅仅是这样又会引出另一个问题，或者说前面在描述时并没有把所谓的重定义的前提条件描述清楚：这里的重定义应当是仅仅在同一个scope内才会发生错误。因此还需新增两个函数：enter_scope(),close_scope()
- symbol_table数据结构体在本项目中已经实现

###### 3种特殊case的处理

这部分等做完lab再来

- 结合type的定义，我们可以知道，目前我的推测是，type inference和checking应该是在自底向上的遍历中同步进行的：

### 对type的理解

- type的内涵有两方面：

  - a type is a set of values（结合词法分析中正则表达式理解）

  - 更重要的一点：A set of ==operations== on those values
    - 举不出例子你就是没有掌握！

- 具体到cool这种面向对象语言，一个class就是一种type，两者完全对应
- Statically typed和Dynamically typed的区别
  - 举不出例子你就是没有掌握！

### cool中的type

- 除了class name表示一个type，还有什么特殊case？
- 用户为identifier定义type
- 编译器为expr计算（infer）type
  - 出于统一性的考虑，每一个expr都有其返回的type，甚至if-else这种也有，这不过对它们会进行特殊处理

### type inferrence

- 首先，你要理解为什么需要type inference：

  - 要执行type cheking，我们首先需要知道每一个identifier/expr当前的类型，例如：int b=a*c；这里我们对于a和c的类型可以通过查找symbol table的栈结构来实现，但是，仅仅知道a和c的类型还不够，我们还需要一套成体系的规则来告诉编译器：对于当前的两种type执行乘法，其expr将会是何种type。
  - 值得一提的是：int b=a*c；涉及了两个expr而不是一个。

- 这里涉及到新的形式语言：(箭头指的位置可以加type environment)

  > ![image-20230922161026224](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922161026224.png)

- 形式语言的soundness vs正确性：eg，对于下面的写法，很正确，but not sound：

  > ![image-20230922161525073](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922161525073.png)

- 理解这句话：Types are computed in a ==bottom-up pass== over the AST

  - 那么自底向上计算node的type时的规则就很重要了：

    > ![image-20230922162110508](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922162110508.png)
    >
    > 注意这里的new返回的是类型，而不是该类型的指针。
    >
    > ![image-20230922162151326](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922162151326.png)

### type environment

- 在课件中，它指出根据现有的结构体我们无法知道variable reference的类型，也即前面的int b=a*c中的a和c的类型。但是，我认为这依赖于之前涉及的栈结构是完全可以实现的。课件以此引出了所谓的type environment的概念。

- 这里先存个疑，到时候看看type environment和前面的symbol table的栈结构是不是在实现上是同一种数据结构。

  - O[T/x]本质上是一种对type environment的修改，具体来说，对于input为x时，把output修改为T。在实际实现时应该与栈有关，因为这里必然会涉及到对原来的type environment的回溯。

  - 这里，e1中往往包含了x，因此==参与到e1最终类型的计算的x的类型==都会是T0。


> ![image-20230921223247310](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230921223247310.png)

- type environment还有着更加强大的功能：借助它，我们可以实现cool语言中，变量名与方法名享有独立的命名空间，SLEF_TYPE的机制也可以借助它来实现
  - 举不出例子就是不会！
  - 能不能看明白：![image-20230922163746073](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922163746073.png)

### method types

###### 遇到问题

对于函数调用（注意，是调用而不是定义），函数的返回值类型，形式参数的类型都是未知的。

###### 解决方法

自然也是使用type environment的方式解决，但是这里需要注意的是，在cool语言以及一些其他语言中，==函数与变量之间是独立的命名空间==，因此这里没有再使用O而是用了M。注意M接收两个参数，C是类名。

- 我想现在你对于所谓的namespace应该也有更深的理解了

![image-20230922003833607](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922003833607.png)

![image-20230922004151339](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922004151339.png)

### self type

###### 遇到问题

对于SELF_TYPE关键字（类似于cpp中的this指针），我们需要知道它当前指向的class

###### 解决方法

不同的问题，==同一种思路==：在新增了M(T,f)的type environment的基础上，再新增一个type environment：C

### type checking实现



- 现在知道为什么学好数据结构很重要了吧。
- 不懂就问，就你那一点代码实践都没有的数据结构也敢叫学过数据结构吗？？？做完cs143赶紧去做数据结构&算法的lab去，最好别再结合答案做了。

![image-20230922012033017](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922012033017.png)

![image-20230922013512694](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922013512694.png)

## PA4实现

### 需求分析

最核心的地方在于，要对Env的构建、type_check的执行、type_inference的实现有一个清晰的认识，在此基础上，能够回答下列问题。

> ![image-20230922164407243](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922164407243.png)

下面，首先跟着main函数的流程，一步步讲述Env的构建、type_check的执行、type_inference的实现：

### main函数整体分析

main函数位于semant-phase.cc中：

```cpp
#include <stdio.h>
#include "cool-tree.h"

extern Program ast_root;      // root of the abstract syntax tree
FILE *ast_file = stdin;       // we read the AST from standard input
extern int ast_yyparse(void); // entry point to the AST parser

int cool_yydebug;     // not used, but needed to link with handle_flags
char *curr_filename;

void handle_flags(int argc, char *argv[]);

int main(int argc, char *argv[]) {
  handle_flags(argc,argv);//处理命令行的参数列表
  ast_yyparse();//这里应该是调用词法分析+语法分析，但是我并没有找到与之相关的函数定义
  ast_root->semant();
  ast_root->dump_with_types(cout,0);
}

```

对于本lab。主要从semant函数的执行开始看：

```cpp
void program_class::semant()
{
    initialize_constants();
    //std::cout<<"=========test======="<<std::endl;



    /* ClassTable constructor may do some semantic analysis */
    // Classes : classes
    // first pass
    ClassTable *classtable = new ClassTable(classes);


    /* some semantic analysis code may go here */
    // second pass
    if ((!classtable->errors()) && (classtable->is_valid())){
        Env env(classtable);//type environment初始化
        for (int i = classes->first(); classes->more(i); i = classes->next(i)){
            env.om->enterscope();
            env.cur_class = classes->nth(i);
            classes->nth(i)->init(env);
            classes->nth(i)->type_check(env);
            env.om->exitscope();
        }
    }



    if (classtable->errors()) {
        cerr << "Compilation halted due to static semantic errors." << endl;
        exit(1);
    }
}
```

在semant函数中，我们首先使用当前program所有classes建立ClassTable，ClassTable的主要作用在于：

- 内置一个class_table属性，记录当前的symbol(也即identifier，具体到这里，是类型名称）和Class_（也即所谓的type）之间的映射关系
- 内置一个inhert_graph属性，记录symbol和symbol之间的父子关系

然后是一个遍历：遍历该program的所有class，对于每一个class，都是先执行init(env)，再执行type_check(env)。

下面主要分析这两个函数的执行过程：

- 先猜测：init：自上而下地遍历AST，完成Env的构建。type_check(env)：自下而上地遍历AST，逐步进行type_check，这里我猜测它同时也实现了type_inference。

- 不对，有问题。==别忘了为什么要进行type inference，是因为type check时有的object的类型为止，这意味着，它不应该和type check同步进行，而应该先进行。==

### Env相关数据结构详解

下面首先分析init：

在分析init之前，首先要认清Env的数据结构，它和形式语言描述的略有不同：

```cpp
class ClassTable;

// 环境信息, 对应类型环境中的(O, M, C)
class Env {
public:
   // 符号表, 对应O, M  ？？这里为什么O和M共同使用一个符号表？？
   SymbolTable<Symbol, Symbol> *om;
   // 类表, 补充信息
   ClassTable *ct;
   // 环境的当前类, 对应C
   Class_ cur_class;
   Env() {
      om = new SymbolTable<Symbol, Symbol>();
      ct = NULL;
      cur_class = NULL;
   }

   Env(ClassTable *ct) {
      om = new SymbolTable<Symbol, Symbol>();
      this->ct = ct;
      cur_class = NULL;
   }
};
```

这里涉及到一个SymbolTable，其定义在symtbl.h中，

> 这段代码实现了一个符号表(Symbol Table)的数据结构。符号表是一个关键的数据结构，常用于编译器、解释器以及其他需要管理名称与关联数据之间关系的应用中。
>
> 1. **符号表条目类**(`SymtabEntry`)：
>
>    ```cpp
>    template <class SYM, class DAT>
>    class SymtabEntry {
>    private:
>      SYM id;        // the key field
>      DAT *info;     // associated information for the symbol
>    public:
>      SymtabEntry(SYM x, DAT *y) : id(x), info(y) { }
>      SYM get_id() const    { return id; }
>      DAT *get_info() const { return info; }
>    };
>    ```
>
>    这是一个模板类，表示符号表的一个条目。它将类型为`SYM`的键与类型为`DAT`的数据相关联。它提供了获取这些数据的方法。
>
> 2. **符号表类**(`SymbolTable`)：
>
>    ```cpp
>    template <class SYM, class DAT>
>    class SymbolTable
>    {
>       typedef SymtabEntry<SYM,DAT> ScopeEntry;
>       typedef List<ScopeEntry> Scope;
>       typedef List<Scope> ScopeList;
>    private:
>       ScopeList  *tbl;
>    public:
>        //一些其他方法
>    };
>    ```
>
>    这个模板类表示符号表本身。它的实现是一个“列表的列表”，其中外部列表表示作用域列表，而内部列表表示给定作用域中的符号。这允许符号表管理嵌套的作用域，这在编译器和解释器中非常有用。
>
>    - `enterscope()`: 进入一个新的作用域。
>    - `exitscope()`: 退出当前的作用域。
>    - `addid()`: 向当前作用域添加一个新的符号及其关联数据。
>    - `lookup()`: 查找一个符号，从最内层的作用域开始，直到找到或达到最外层的作用域。
>    - `probe()`: 仅在顶层作用域中查找一个符号。
>    - `dump()`: 打印符号表的内容。

这里对最里层的ScopeEntry要认清：它建立的是object的symbol与object的type之间的联系，其使用示例如下：

![image-20230923212149964](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230923212149964.png)

对于Scopelist，需要注意新增的Scope永远是增加到它的"头部"，这样就能理解exitscope的逻辑：

```cpp
void exitscope()
   {
       // It is an error to exit a scope that doesn't exist.
       if (tbl == NULL) {
	   fatal_error("exitscope: Can't remove scope from an empty symbol table.");
       }
       tbl = tbl->tl();
   }
```



这里有一个小疑问：它并没有使用一种嵌套的结构，这是否意味着。外层的scope中的object的symbol在内层的scope中无法被识别？

如何找到答案？去看lookup的函数实现即可！事实证明，这种看起来使用链表实现的scope机制不但没有问题，反而是以一种高效的方式实现了scope的需求。

```cpp
 DAT *lookup(SYM s)
   {
       for (ScopeList *i = tbl; i != NULL; i = i->tl())
       {
           for (Scope *j = i->hd(); j != NULL; j = j->tl())
           {
               if (s == j->hd()->get_id())
               {
                   return (j->hd()->get_info());
               }
           }
       }
       return NULL;
   }
```



Env中的另外两个属性都和理论相符，不难理解



-------------------------分割线，读到这里，应该可以理解Env，尤其是scope的实现机制了。----------------------------------------------

### init详解

下面才开始正题：init的实现：

```cpp
// class__class, 初始化, 递归处理, 先设置父节点
void class__class::init(Env env){
    if (name != Object){
        // 先设置父节点
        env.ct->get_class(parent)->init(env);
        //这种方式可以确保type environment的建立是自顶向下的
    }

    // 设置feature
    for (int i = features->first(); features->more(i); i = features->next(i)){
        features->nth(i)->add_to_env(env);
    }
}
```

从代码可以看出，由于递归的存在，决定了我们必然会自顶向下进行构建，这也和理论是一致的。



那么，我们为什么需在init阶段对features执行add_to_env的操作，而不是在type_checking阶段呢？（按理说，env应该是一个随着type_cheking的scope状态不同而动态变化的一个数据结构才对？）

==原因就在于，我们要求类中的属性在定义之前就可以被使用==，但是method则不具有这种特殊性，这就解释了为什么我们对attr_class::add_to_env给出了具体的实现，但是对于method_class::add_to_env并没有进行实现，因为它本就不应该被实现！！！！

（当时这个点困扰了俺好久hhh，谁让你不熟悉语法的。。。）

-----------------------------分割线，到这里应该可以完全理解init部分执行的操作及其支持的cool的语言特性了---------------------------------

### type_check&type_inference

下面，是一个更重要的疑惑：程序在执行完init之后就执行type_check，那么type inference到底是在什么时候发生的？

还是说，在实际设计中，压根就不需要type inference？？

至少从程序运行的最终结果来看，我们是知道所有的type的，这是怎么发生的呢？

> ![image-20230923221234995](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230923221234995.png)



背后的原因让人暖心：原因就在那一个个type_check中。首先要明白：type_check的调用是自上而下调用的，但是==type_check函数主体内容的执行是自下而上进行的==，例如：

> Feature method_class::==type_check==(Env env){
>
>   // step1
>
>   env.om->enterscope();
>
>   // step2
>
>   Symbol cur_class = env.cur_class->get_name();
>
>   env.om->addid(self, &cur_class);
>
>   // step3
>
>   for (int i = formals->first(); formals->more(i); i = formals->next(i)){
>
> ​    formals->nth(i)->==type_check==(env);
>
>   }
>
>   // step4
>
>   // 首先获得包含当前method的父类, 然后查看是否和父类method匹配
>
>   // 获得包含method的父类
>
>   Symbol parent_class = env.ct->get_parent(cur_class, name);
>
>   if (parent_class != NULL){
>
> ​    // 判断方法是否继承正确
>
> ​    if(!env.ct->check_method(cur_class, parent_class, name)){
>
> ​      env.ct->semant_error(env.cur_class) << "Method " << name << "inherent wrong!" << endl;
>
> ​    }
>
> 
>
>   }
>
>   // step5
>
>   Symbol true_return_type = expr->==type_check==(env)->type;
>
>   if (return_type == SELF_TYPE){
>
> ​    // 5.1
>
> ​    if (true_return_type != SELF_TYPE){
>
> ​      env.ct->semant_error(env.cur_class) << "True return type should be SELF_TYPE!" << endl;
>
> ​    }
>
>   }else if (!env.ct->is_class_exit(return_type)){
>
> ​    // 5.2
>
> ​    env.ct->semant_error(env.cur_class) << "Return type doesn't exist!" << endl;
>
>   }else{
>
> ​    // 5.3
>
> ​    if (true_return_type == SELF_TYPE){
>
> ​      true_return_type = env.cur_class->get_name();
>
> ​    }
>
> ​    if (!env.ct->is_sub_class(true_return_type, return_type)){
>
> ​      env.ct->semant_error(env.cur_class->get_filename(), this) << "True return type isn't subclass of return type!" << endl;
>
> ​    }
>
>   }
>
>   
>
>   // step1
>
>   env.om->exitscope();
>
> 
>
>   return this;
>
> }

而这种自下而上的执行过程就刚好支持了我们的type inference。比如，在上面的method的check中有如下代码：

```cpp
Symbol true_return_type = expr->type_check(env)->type;
```

==这段代码除了展现了check的类似于递归的行为之外，还隐藏着一个重要信息：type_check的返回值也是一个type！那么，这个type是什么type呢？没错！在这里，这正是我们的expr的type，我们正是使用type check的返回值作为type inference的结果！！！！==

Ok，误会解除，我只能说，你是懂type_inference的。

下面就拿这个method举例进行说明。首先，我们需要有番外中的知识，这样才能继续讨论。

--------------------------------------------番外分割线-------------------------------------------------------

==为什么method_class中的expr的类型是Expression而不是Expressoins？难道说一个函数体中只能有一个表达式？==

原因如下：

>在 COOL 中，方法体中的连续表达式实际上被隐式地封装在一个块 `{ ... }` 中。当你写：
>
>```
>foo() : Int {
>    x <- 5;
>    y <- 10;
>    x + y
>};
>```
>
>即使你没有明确地使用 `{ ... }`，这个方法体实际上可以被视为一个块，其中包含三个连续的表达式。因此，整个方法体实际上是一个复合 `Expression`，这个复合表达式内部包含其他子表达式。
>
>这样的设计简化了抽象语法树 (AST) 的结构，因为方法体可以始终被视为一个单一的 `Expression`，无论其中包含多少个连续的表达式。

---------------------------------------------番外结束，正片继续------------------------------------

因此，我们首先需要讨论block_class的type_check的返回值的处理逻辑。(事实上，正确的做法应当是先去找手册上面的形式化语言的描述。)

```cpp
/**
 * block class
 * [[expr;]]+
 * body
 **/
Expression block_class::type_check(Env env){
    Symbol s = NULL;
    for (int i = body->first(); body->more(i); i = body->next(i)){
        s = body->nth(i)->type_check(env)->type;
    }
    type = s;

    return this;
}
```

从它的定义可以看出，它的返回类型是它的body中的最后一个表达式的返回类型。那么，这个表达式的类型会是什么呢？没错，对于函数体来说，那当然就是return xxx;

妙啊，太妙了。、

但是对于cool来说不是如此，但是本质是一样的，知识cool不支持return关键字而已：

> 在cool语言的语法中，函数的返回是不是也使用return关键字？
>
> 
>
> ChatGPT
>
> 
>
> 不，COOL (Classroom Object-Oriented Language) 不使用 `return` 关键字来返回函数或方法的值。在 COOL 中，方法的返回值是方法体中的最后一个表达式的值。
>
> 例如，考虑以下的方法定义：
>
> ```
> coolCopy codefoo() : Int {
>     x <- 5;
>     y <- 10;
>     x + y
> }
> ```
>
> 在这个方法中，`x + y` 是方法体中的最后一个表达式，因此它的值（即 15）将被作为 `foo` 方法的返回值。
>
> 如果你想提前从方法中返回，你需要重新组织你的代码，例如使用条件表达式或其他控制流结构来确保你想要的返回值是方法体中的最后一个表达式。





### 一些番外

---------------------番外篇：一些杂记------------------------------------------------------------------------------------

###### semant.cc

- 下面是预先给出的代码：其作用在于以枚举的方式对stringTbale进行了初始化------把所有的keywords添加到identifier对应的idtable中

```cpp
//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.
//
//////////////////////////////////////////////////////////////////////
static Symbol 
    arg,
    arg2,
    Bool,
    concat,
    cool_abort,
    copy,
    Int,
    in_int,
    in_string,
    IO,
    length,
    Main,
    main_meth,
    No_class,
    No_type,
    Object,
    out_int,
    out_string,
    prim_slot,
    self,
    SELF_TYPE,
    Str,
    str_field,
    substr,
    type_name,
    val;
//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
    arg         = idtable.add_string("arg");
    arg2        = idtable.add_string("arg2");
    Bool        = idtable.add_string("Bool");
    concat      = idtable.add_string("concat");
    cool_abort  = idtable.add_string("abort");
    copy        = idtable.add_string("copy");
    Int         = idtable.add_string("Int");
    in_int      = idtable.add_string("in_int");
    in_string   = idtable.add_string("in_string");
    IO          = idtable.add_string("IO");
    length      = idtable.add_string("length");
    Main        = idtable.add_string("Main");
    main_meth   = idtable.add_string("main");
    //   _no_class is a symbol that can't be the name of any 
    //   user-defined class.
    No_class    = idtable.add_string("_no_class");
    No_type     = idtable.add_string("_no_type");
    Object      = idtable.add_string("Object");
    out_int     = idtable.add_string("out_int");
    out_string  = idtable.add_string("out_string");
    prim_slot   = idtable.add_string("_prim_slot");
    self        = idtable.add_string("self");
    SELF_TYPE   = idtable.add_string("SELF_TYPE");
    Str         = idtable.add_string("String");
    str_field   = idtable.add_string("_str_field");
    substr      = idtable.add_string("substr");
    type_name   = idtable.add_string("type_name");
    val         = idtable.add_string("_val");
}


```

###### classTable的合理性检验

- 为什么在定义inhert_graph时要把第一项设置为child，第二项设置为parent了。（反过来就不行）

因为两者是多对一的关系。从下面的代码实现中我们可以发现，两者如果颠倒顺序，那么预期的功能将无法正常实现。

```cpp
/**
 * 判断定义是否合理：
 * 1. 不含环。
 * 2. 判断是否包含Main。
 * 3. 判断父类是否都已定义。
 **/
bool ClassTable::is_valid(){
    bool cycle_flag = true;
    bool main_flag = false;
    bool define_flag = true;
    for (auto it = inhert_graph.begin(); it != inhert_graph.end(); it++){
        Symbol child = it->first;
        Symbol parent = it->second;
        // 判断是否包含main
        if (child == Main){
            main_flag = true;
        }
        // Object的parent为No_class, 该条件判断是否为根
        while (parent != No_class){
            // 环
            if (parent == child){
                semant_error(class_table[child]) << "Has cycle!" << endl;
                return false;
            }
            // 不存在父节点
            if (!inhert_graph.count(parent)){
                semant_error(class_table[child]) << "Doesn't contain parent!" << endl;
                return false;
            }
            parent = inhert_graph[parent];
        }
    }

    if (main_flag){
        return true;
    }else{
        semant_error() << "Class Main is not defined." << endl;
        return false;
    }
}

```

- 

```
Feature attr_class::type_check(Env env){
    // step1
    env.om->enterscope();
    // step2
    Symbol cur_class = env.cur_class->get_name();
    env.om->addid(self, &cur_class);
    // step3
    Symbol true_return_type = init->type_check(env)->type;
    // 3.1
    if (name == self){
        env.ct->semant_error(env.cur_class->get_filename(), this) << "Attr shouldn't be self!" << endl;
    }
    // 3.2
    // SELF_TYPE的类型为自身
    if (true_return_type == SELF_TYPE){
        true_return_type = env.cur_class->get_name();
    }
    // 3.3
    // 判断是否为type_decl的子类, 排除No_type
    if (true_return_type != No_type){
        if (!(env.ct->is_sub_class(true_return_type, type_decl))){
            env.ct->semant_error(env.cur_class) << "True attr type isn't subcalss of type_decl!" << endl;
        }
    }

    // step1
    env.om->exitscope();

    return this;
}

```

> 上面是对cool语言的类的属性进行type_checking的代码，我不太理解，为什么对每个属性进行type_checking前后分别需要进行enterscope和exitscope的操作？请结合实例加以解释？
>
> 
>
> ChatGPT
>
> 
>
> 在 COOL (Classroom Object Oriented Language) 中，`enterscope` 和 `exitscope` 都与符号表（Symbol Table）的使用有关。符号表通常用于存储和跟踪当前作用域内的变量（及其类型）。
>
> 让我们首先简要解释上面的代码。
>
> 1. **enterscope**: 创建一个新的作用域层级。在这个新的层级中，你可以添加新的符号或覆盖父级作用域中的符号。
> 2. 在这个新的作用域中，`self` 被关联到当前类的名称。这意味着在属性的初始化表达式中，如果你引用 `self`，它会解析为当前类的类型。
> 3. 进行实际的类型检查。
> 4. **exitscope**: 退出当前作用域，回到父级作用域。
>
> 为什么要这样做？让我们通过一个例子来理解。
>
> 假设你有如下的 COOL 代码：
>
> ```
> coolCopy codeclass A {
>     x : Int <- 5;
>     y : SELF_TYPE <- self;
> };
> ```
>
> 在处理属性 `y` 的初始化时（即 `self`），你需要知道 `self` 的类型。通过在属性的类型检查之前创建一个新的作用域并关联 `self` 为 `A`，你确保了 `self` 在属性初始化表达式中的正确类型解析。一旦属性的类型检查完成，你可以退出作用域，因为对于类的其他部分（如其他属性或方法），你可能不希望有这个特定的 `self` 绑定。
>
> 实际上，为每个属性进行这样的作用域操作可能是为了简化逻辑和避免在处理一个属性时由于前一个属性引入的可能的副作用。例如，如果两个属性之间有依赖关系或相互引用，这样的作用域隔离可以帮助避免复杂的交互效应。
>
> 简而言之，这是一种确保在处理每个属性时都有一个清晰、明确的上下文，并且不受其他属性可能引入的副作用影响的方法。





> 对于cool语言，类中的attr和method是否共享同一个命名空间
>
> 
>
> 在 COOL (Classroom Object Oriented Language) 中，属性（`attr`）和方法（`method`）共享同一个命名空间。这意味着在同一个类中，你不能有一个与属性同名的方法。
>
> 例如，以下的 COOL 代码是非法的，因为 `foo` 同时被用作属性和方法的名称：
>
> ```
> coolCopy codeclass A {
>  foo : Int;
>  foo() : Int { ... };
> };
> ```
>
> 尝试编译这样的代码会产生一个错误，指出 `foo` 已经在该类中被定义过了。
>
> 但是对于cpp：
>
> ![image-20230922235812185](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230922235812185.png)
>
> 这里也许可以作为一个课程设计可以优化的点



- 评价为细节拉满：



![image-20230923111301456](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230923111301456.png)

如果方法的返回类型是`SELF_TYPE`，则返回值的实际类型应当是调用该方法的对象的类型。这就是为什么`type`被赋值为`t0`的原因。`t0`在前面的代码中被确定为`expr`的类型。

以Cool（Classroom Object Oriented Language）为例，它有一个特殊的类型`SELF_TYPE`，表示调用者对象的实际类型。例如，在一个类`A`中，如果有一个方法的返回类型是`SELF_TYPE`，那么当这个方法在一个`A`的实例上被调用时，它返回的类型就是`A`。

###### type inference的错误处理

- 有的地方报错才是正常的！因为测试的cool程序本身有语法问题！

- 关于error handling，有两个最基本的思路

  - 返回Object（所有类的父类）

    - 问题：级联报错

      > ![image-20230924111213760](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924111213760.png)

  - 返回no type(所有类的子类，仅对编译器可见，使用它的好处：==可以防止级联报错==)

    - 问题：在数据结构层面，实现起来可能稍微有些困难（事实上，加入no type之后它就不在是tree了）


----------------------------番外结束，PA4结束，完结撒花，呜呼~~----------------------------------------------------

### 好好好

![image-20230923231642057](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230923231642057.png)

## Backend

后端包括两项内容：

- 
-  

其中前者不在本项目的讨论范围之内，我们主要讨论code generation。

---------------------------------------------------分割线-------------------------------------------------------------

那么，我们首先要知道我们相要生成的是个什么玩意儿--因此首先要对程序的Run time organization有一个清晰的认识

首先，按照我们目前浅薄的os知识，我们可以大致把程序在内存中的映像分为两段：代码段和数据段，这意味着，所谓的code generation不只是字面意思--不只是产生代码段！它还包括数据段的生成，并且要能够在代码段中添加对数据段的引用！（结合你浅薄的汇编语言的知识应该可以理解这一点）



###### 两个重要assumption：

> ![image-20230924124007780](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924124007780.png)

###### lifetime vs scope

- ![image-20230924124225195](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924124225195.png)

- activation tree
  - depends on run time behavior
  - is different under different input
  - stack结构非常适合与记录activation tree（发生函数调用则push，return则pop），因此，在我们前面的code段和数据段的基础上，我们为程序的内存空间新增了stack：

好，现在我们知道了要用stack来实现activation tree，但是我们尚不清楚每一次push具体要push什么信息，这就是所谓的Activation record的研究内容了，或者说是stack frame，不难理解，一个frame需要包含下列内容：

![image-20230924130019961](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924130019961.png)

课上给出了一个frame的示例设计：

![image-20230924131035309](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924131035309.png)

但是事实上（在cool project中)这种设计往往因语言/编译器的不同而不同：比如本项目的return addr似乎就是通过寄存器的方式进行存取的（更加高效）

汇编语言对这方面也有所设计，可以去看看汇编语言的学习笔记



！！前面借用了stack的概念来描述，但本质上，它其实是一个数组（因为我们在“pop”之后，仍然需要访问被pop的frame中的内容！！）

eg：第二次f调用结束后，我们需要访问1处的result，在第一次f调用中使用。这里的contol link，视频中的描述是：指向parent的activation，我的猜测是指明在这个“数组“中我们该返回的位置（注意体会它和return addrees的区别！！！）

![image-20230924131521352](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924131521352.png)

###### globals & heap

![image-20230924133217932](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924133217932.png)

- alignment（对齐）

首先回顾一下machine word的概念：它与计算机硬件有关，一般要么是8bytes a word，要么是4bytes a word。

为什么需要理解它呢？因为它和我们的地址息息相关：

![image-20230924140949105](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924140949105.png)

因此，对于按字编码的机器来说，我们必须要进行alignment

stack machine vs register machine

- 首先要理解这两个描述的具体内容，然后，对这两者的优点综合一下，得到我们当前使用的stack-register machine。这里一个很重要的特征在于，我们在执行计算之前和执行计算之后，stack的内容始终都是<init>，保持不变。

![image-20230924143544007](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924143544007.png)

具体到本project：

![image-20230924144233482](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924144233482.png)

能理解这里为什么要+4吗？

![image-20230924144447326](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924144447326.png)

因为mips中的stack是向低地址增长的！







![image-20230924164053372](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924164053372.png)

![image-20230924165435020](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924165435020.png)





![image-20230924170230995](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924170230995.png)

![image-20230924170241030](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924170241030.png)





![image-20230924170941534](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924170941534.png)





![image-20230924185945400](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924185945400.png)

![image-20230924190107157](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924190107157.png)

![image-20230924190542119](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924190542119.png)





!!!!!原来如此！！   takl is cheap ,show me the code

这里和我当时学习汇编时查到的关于x86的设计略有区别：x86有6个寄存器专门用来保存当前的函数的参数，多的才放到当前的stack frame上面

caller side：

![image-20230924191335991](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924191335991.png)

callee side：

- 值得注意的是，我们只有在jump and link指令执行之后才能知道caller的返回地址，这就导致了：把return address push到栈上的指令实际上是在callee中执行的

![image-20230924193402927](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924193402927.png)

1. ra寄存器的值我猜测是在caller执行jump and link指令时进行赋值的，但是push到栈上还得是在这里
2. 它和3组合在一起，作用是结束这一整次函数调用：释放整个栈帧（4n+8）
3. 这里是在结束这一次函数调用之后，重置当前的frame pointer。从这里也可以看出frame pointer是指向当前frame 的”栈顶“的。
4. 4n+8的由来：函数调用时花费4n+4（n个参数+1*记录fp），callee中花费1，记录整个函数的返回地址

目前不太理解==最开始为什么要记录fp==

你前面对fp指向的位置的理解时错误的！！！！

结合下图理解：

![image-20230924194648327](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924194648327.png)

> 请结合实例解释frame pointer的作用
>
> 
>
> ChatGPT
>
> 
>
> `frame pointer`（通常被称为`fp`）是一个寄存器，它在许多架构（如 x86 和 MIPS）中都存在。它的主要作用是为函数调用中的局部变量和参数提供一个稳定的基准点，从而使得在栈上访问这些变量和参数变得简单和一致。
>
> 在大多数情况下，当一个函数被调用时，栈指针（通常称为`sp`）会随着局部变量的分配和释放而上下移动。如果我们直接使用`sp`来访问局部变量，那么每次栈的变化都可能导致访问偏移的变化。为了避免这个问题，`frame pointer`为我们提供了一个固定的参考点。
>
> 现在让我们通过一个简单的例子来理解`frame pointer`的作用：
>
> ```
> cCopy codeint add(int a, int b) {
>     int temp = a + b;
>     return temp;
> }
> ```
>
> 当函数`add`被调用时，它的参数`a`和`b`，以及局部变量`temp`都需要在栈上分配空间。假设我们正在使用一个架构，其中每个变量占用4个字节，并且在函数调用时，返回地址也被推入栈中。
>
> 一个可能的栈布局如下：
>
> ```
> sqlCopy code+----------------+
> |  Return Address  |
> +----------------+
> |       a        |
> +----------------+
> |       b        |
> +----------------+
> |     temp      |
> +----------------+
> |   ...其他数据...   |
> +----------------+
> ^
> |
> fp
> ```
>
> 在这个布局中，我们可以使用`frame pointer`（`fp`）来访问`a`、`b`和`temp`：
>
> - `a` 位于 `fp - 8`。
> - `b` 位于 `fp - 12`。
> - `temp` 位于 `fp - 16`。
>
> 无论栈指针如何移动，这些偏移量都保持不变，因为`frame pointer`在函数的执行期间是固定的。
>
> 总之，`frame pointer`为我们提供了一个稳定的基准点，使我们能够轻松地在栈上访问函数的局部变量和参数，而不必担心栈的动态变化。





![image-20230924195716818](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924195716818.png)





番外：为什么在本项目中只需要一个临时寄存器就够了呢？

因为所有的运算最终无非就是二元运算，不涉及三元，因此只需要对acc（a0）和t1进行运算即可



妙，太妙了。这里仍然体现出了abstractoin的思想。尤其时蓝色筐处的jal指令。这里更能解释我们为什么把ra的push放在callee的汇编代码中而不是放在caller的指令序列中：因为我们对于jal指令的抽象就是：它会跳转到目标处执行相关指令，执行结束之后要能回到原处的继续执行，因此，对于fp的ra的保存和恢复3都理应是它内部的任务。

![image-20230924215316859](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924215316859.png)

除此之外，这里还值得注意的是，这个函数的返回值是什么呢？从结果来看，最终的返回值是存储在a0寄存器中的。





编译优化思路之一:减少临时变量造成的空间浪费（从上面的例子就可以看出存在不少的空间浪费）

大体思路是先按照一定的规则计算出当前的函数体执行所需要的最大的临时空间数量，按需分配。

![image-20230924222305976](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924222305976.png)

示例：

- 优化前：

![image-20230924222652964](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924222652964.png)

- 优化后：

![image-20230924222839366](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924222839366.png)

正确的，合理的，nb的，让我实现我是不情愿的。（doge





![image-20230924230644315](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924230644315.png)





object是不是都存储在heap里啊

![image-20230924231638072](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924231638072.png)

![image-20230924231945201](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924231945201.png)

】

】

在此基础上，继承就不难实现了。注意下面说的是在A的基础之上进行extend，而不是先复制一份再extend。（因为要保证属性的一致性）。

![image-20230924232138463](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924232138463.png)

呃呃，你前面的分析错了。那么既然如此，就需要注意处理公共属性的一致性了。

![image-20230924232416013](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924232416013.png)





![image-20230924233656121](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924233656121.png)

使用这个table有两方面好处：

- 首先，它是为类的继承时的新增属性提供了方便：每个子类的新增sttr的前面的结构都是完全一致的，这样便于继承。
- 其次，考虑这样一种case：对于该类，我们有1000个instace，但是这些instance的method的代码都是共享的，这无疑极大地节省了空间。

![image-20230924234604463](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924234604463.png)

![image-20230924234743541](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230924234743541.png)

###### continue	

为什么这里还需要一个store？？？有了地址不久可以解引用去访问吗

![image-20230925095750207](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925095750207.png)





![image-20230925124131754](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925124131754.png)



object的形式化表述

![](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925124301450.png)

object的特殊情况：

![image-20230925124624285](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925124624285.png)





- 这里的class是一个基于当前的形式语言新引入的“函数”

![image-20230925181402612](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925181402612.png)



![image-20230925182210184](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925182210184.png)

1. 这里是用预先设置好的默认值进行初始化
2. 这里是用赋值表达式的值进行初始化







![image-20230925124857095](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925124857095.png)





![image-20230925125228182](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925125228182.png)

1.这对于编译的实现很重要（目前猜测它可能是类似于前面哪个stack machine的作用，计算前后stack内容保持不变





分类，规则：

constant：

![image-20230925125618795](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925125618795.png)

identifier：

![image-20230925125701670](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925125701670.png)



请分析框框处为什么不是保持S不变，而是新的S1

![image-20230925130245160](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925130245160.png)





![image-20230925130405449](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925130405449.png)





6，还能递归的是吧

![image-20230925131748102](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925131748102.png)





![image-20230925132120957](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925132120957.png)





default value

![image-20230925152725403](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925152725403.png)





![image-20230925184155004](C:\Users\OrangeO_o\AppData\Roaming\Typora\typora-user-images\image-20230925184155004.png)
