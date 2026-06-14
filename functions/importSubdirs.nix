/*
  功能:
    发现指定目录下的所有子目录, 导入每个子目录中的 default.nix,
    并将所有导入结果深度合并为一个属性集
  输入参数:
    dir: 目标目录路径 (字符串或路径类型)
    extraArgs: 传递给每个子目录 default.nix 的属性集
  返回值:
    深度合并后的属性集
*/
inputs:
let
  inherit (inputs.nixpkgs) lib;
  importSubdirs =
    dir: extraArgs:
    let
      # 读取目录内容, 筛选出子目录名列表
      content = builtins.readDir dir;
      subdirs = builtins.attrNames (
        lib.filterAttrs (_name: type: type == "directory") content
      );
      # 导入每个子目录的 default.nix (Nix 自动解析为 <dir>/<name>/default.nix)
      imported = map (name: import (dir + "/${name}") extraArgs) subdirs;
    in
    # 深度合并所有导入结果
    builtins.foldl' lib.recursiveUpdate { } imported;
in
importSubdirs
