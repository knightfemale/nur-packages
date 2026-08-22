/*
  功能:
    扫描 legacyPackages/ 下所有子目录, 导入每个子目录的 default.nix,
    将所有返回的包属性集深度合并, 作为 flake 的 legacyPackages 输出
  子目录协议:
    每个 <name>/default.nix 需返回属性集, 键为根名, 值为包属性集
  依赖注入:
    子目录会收到 { lib, pkgs, inputs, system, functions }, 按需所取
*/
{
  lib,
  inputs,
  system,
  functions,
}:
let
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  # 收集各子目录的 default.nix (排除本文件自身)
  subDirs = builtins.filter (p: p != (toString ./. + "/default.nix")) (
    functions.recursive.collectFilesToList (name: name == "default.nix") ./.
  );
in
builtins.listToAttrs (
  map (
    path:
    let
      # 子目录名 (default.nix 的父目录) 作为包组根名
      name = lib.baseNameOf (lib.removeSuffix "/default.nix" path);
    in
    {
      inherit name;
      value = import path {
        inherit
          lib
          pkgs
          inputs
          system
          functions
          ;
      };
    }
  ) subDirs
)
