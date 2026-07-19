{
  lib,
  pkgs,
  inputs,
  system,
  functions,
}:
let
  # 收集本目录下所有变体定义文件 (排除 default.nix 自身)
  # 每个文件返回 { 变体名 = variantData; ... }, 见下方注释
  kernelFiles = functions.recursive.collectFilesToList (name: name != "default.nix") ./.;
  # 展开为 { linux-<文件名>-<变体名> = derivation; ... }
  packages = builtins.listToAttrs (
    lib.concatMap (
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
        variantName: variantData:
        let
          pname = "linux-${baseName}-${variantName}";
          package =
            # 外部包引用型: { name, packages = <linuxPackages> }
            # 直接取 packages.kernel 提供的内核
            if variantData ? packages then
              variantData.packages.kernel
            # 源码构建型: { version, modDirVersion, url, sha256 }
            # 通过 mk.kernelPackage 从源码编译
            else
              (functions.mk.kernelPackage {
                inherit pkgs pname;
                inherit (variantData)
                  version
                  modDirVersion
                  url
                  sha256
                  ;
              }).kernel;
        in
        {
          name = pname;
          value = package;
        }
      ) variants
    ) kernelFiles
  );
in
packages
