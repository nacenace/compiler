# Pascal-S compiler

## 编译运行

在 docker 环境下装配好对应环境且进入程序目录后，输入如下命令

```
mkdir build
cd build
cmake ..
make
```

## 可执行程序使用方式

```
USAGE: exp <option> <source.pas>
OPTION:
  -l            Emit LLVM IR code (.ll)
  -S            Emit assembly code (.s)
  -c            Emit object code (.o)
  -ast          puts ast tree
  -o des        name output file as des
  -O            IR optimize
```

- 对于生成的 LLVM IR 文件，输入 `lli output.ll` 可以执行编译后的程序
- 对于生成的对应平台的 `.s` 和 `.o` 文件，输入 `cc output.s` 或 `cc output.o` 可以得到对应平台的可执行文件

## 特性

- 简单的数据类型：布尔型，字符型，整型，实数型，字符串型
- 一维数组，结构体类型
- 控制流：if-else，case-of，while-do，repeat-until，for
- 定义：常量（const），类型（type），变量（var），子程序（routine）部分
- 子程序（函数和过程）定义和调用
    - 包括一些系统函数：read(ln)（读取），write(ln)（输出），abs（绝对值），sqrt（平方根），chr（字符），ord（顺序），pred（前驱），succ（后继）
- 运算符：+ - * / div（整除）mod（取模）and（与）or（或）xor（异或）not（非）以及比较运算符
- 类型检查，从整型到实数型的隐式类型转换

## TBD

- 错误恢复
- 闭包函数
- 二维数组，复杂的结构体
