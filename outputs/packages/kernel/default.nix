/*
  功能:
    扫描本目录下所有 .nix 变体文件 (排除 default.nix 自身),
    解析每个文件定义的内核变体 (variants), 生成对应的 derivation,
    以 "kernel-<文件名>-<变体名>" 的命名规则注册到 flake 输出
  变体文件协议:
    每个文件返回属性集, 键为变体名, 值支持两种类型:
    - 源码构建型:  { version, modDirVersion, url, sha256 }
      通过 functions.mk.kernelPackage 从源码编译
    - 外部包引用型: { name, packages = <linuxPackages> }
      直接取 packages.kernel, 如 cachyos 使用外部 flake 提供的内核
  输入参数:
    接收 { lib, pkgs, inputs, system, functions }
  返回值:
    属性集 { kernel-<文件名>-<变体名> = derivation; ... }
*/
{
  lib,
  pkgs,
  inputs,
  system,
  functions,
}:
let
  # 扫描目录取出所有变体定义文件
  variantFiles = functions.getDirNixFiles ./.;
  # 将单个 .nix 文件展开为 { name, value } 记录列表
  fileToPkgRecords =
    file:
    let
      # 取文件名 (如 "zen.nix" → "zen") 作为包名前缀
      baseName = lib.removeSuffix ".nix" (baseNameOf file);
      # 导入变体定义, 只传递元数据相关参数, 不含 pkgs
      variants = import file {
        inherit lib inputs system;
      };
    in
    lib.mapAttrsToList (
      variantType: variantData:
      let
        pkgName = "kernel-${baseName}-${variantType}";
        # 类型 B (外部包引用型): 使用已有 packages.kernel
        # 类型 A (源码构建型): 通过 mk.kernelPackage 编译
        pkgValue =
          if variantData ? packages then
            variantData.packages.kernel
          else
            (functions.mk.kernelPackage {
              inherit pkgs;
              version = variantData.version;
              modDirVersion = variantData.modDirVersion;
              url = variantData.url;
              sha256 = variantData.sha256;
            }).kernel;
      in
      {
        name = pkgName;
        value = pkgValue;
      }
    ) variants;
  allRecords = builtins.concatLists (map fileToPkgRecords variantFiles);
in
builtins.listToAttrs allRecords
