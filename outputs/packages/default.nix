/*
  功能:
    扫描 packages/ 下所有子目录, 导入每个子目录的 default.nix,
    将所有返回的包属性集深度合并为 flake 的 packages 输出
  子目录协议:
    每个 <name>/default.nix 需返回属性集, 键为包名, 值为 derivation
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
in
functions.importSubdirs ./. { inherit lib pkgs inputs system functions; }
