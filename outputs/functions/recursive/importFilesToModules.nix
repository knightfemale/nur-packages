/*
  功能:
    收集指定目录下除 default.nix 自身的所有 .nix 文件, 导入为模块值
    返回已求值的模块 list
  输入参数:
    dir: 目标目录路径 (string 或 path)
  返回值:
    模块值 list, 可直接用于 imports 属性
  示例:
    functions.recursive.importFilesToModules ./.
  =>
    [ <模块值> <模块值> ... ]
*/
inputs:
let
  function =
    dir:
    let
      allFiles = (import ./collectFilesToList.nix inputs) (name: true) dir;
      selfDefault = toString dir + "/default.nix";
      paths = builtins.filter (p: p != selfDefault) allFiles;
    in
    map (path: import path) paths;
in
function
