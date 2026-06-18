/*
  功能:
    将 attrset 转成 json 字符串并打印到 stderr 然后原样返回 attrset, 便于在构建时调试输出而不改变原有逻辑
  输入参数:
    attrs: 一个具有以下限制的 attrs:
      不能包含 path
      不能包含 derivation
      不能包含函数
      不能有循环引用
  返回值:
    原输入值 attrs, 其类型和内容完全不变
  示例:
    functions.traceAttrsToJson { a = 1; b = 2; }
  =>
    trace: {"a":1,"b":1}
    { a = 1; b = 2; }
*/
inputs:
let
  function = attrs: builtins.trace (builtins.toJSON attrs) attrs;
in
function
