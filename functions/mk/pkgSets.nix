/*
  功能:
    从 inputs 中提取所有含 nixpkgs 的输入, 实例化为包集合
    并将 key 命名为 pkgs-* 形式
  输入参数:
    system: 目标平台字符串 (如 "x86_64-linux", "aarch64-darwin")
  返回值:
    包含多个对应平台的包集合属性集
  示例:
    functions.mk.PkgSets "x86_64-linux"
  输出:
    {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    }
*/
inputs:
let
  inherit (inputs.nixpkgs) lib;
  buildPkgSets =
    system: mainInputs:
    let
      nixpkgsInputs = lib.filterAttrs (n: _: lib.hasPrefix "nixpkgs" n) mainInputs;
    in
    builtins.listToAttrs (
      lib.mapAttrsToList (name: value: {
        name = "pkgs${lib.removePrefix "nixpkgs" name}";
        value = import value {
          inherit system;
          config.allowUnfree = true;
        };
      }) nixpkgsInputs
    );
in
buildPkgSets
