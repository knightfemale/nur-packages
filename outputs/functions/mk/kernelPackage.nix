/*
  功能:
    根据指定版本和源码构建自定义 Linux 内核, 并生成完整的内核包 attrs
  输入参数 (属性集):
    pkgs: nixpkgs 包 attrs
    version: 内核版本号
    modDirVersion: 内核模块目录版本号
    url: 内核源码下载地址
    sha256: 内核源码包的 SHA256 哈希值
  返回值:
    由 recurseIntoAttrs 包裹的完整内核包 attrs
  示例:
    functions.mk.kernelPackage {
      pkgs = pkgs;
      version = "6.6";
      modDirVersion = "6.6.0";
      url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.tar.xz";
      sha256 = "sha256-...";
    }
  =>
    {
      kernel = <derivation linux-6.6.0>;
      kernelModules = <derivation>;
      ...
    }
*/
inputs:
let
  inherit (inputs.nixpkgs) lib;
  function =
    {
      pkgs,
      version,
      modDirVersion,
      url,
      sha256,
    }:
    let
      linux = pkgs.callPackage (
        { fetchurl, buildLinux, ... }@args:
        #  调用 buildLinux 函数, 传入参数并覆盖部分属性
        buildLinux (
          lib.mergeAttrsList [
            args
            {
              inherit version modDirVersion;
              src = fetchurl { inherit url sha256; };
              # 额外的内核补丁列表
              kernelPatches = [ ];
              #  添加内核包的元数据, 设置分支名便于识别
              extraMeta.branch = version;
            }
            # 允许通过 argsOverride 进一步覆盖参数
            (args.argsOverride or { })
          ]
        )
      ) { };
    in
    # 根据自定义内核生成完整的内核包集合
    # 然后使用 recurseIntoAttrs 让该属性集在 nix-env 等命令中被正确展开
    lib.recurseIntoAttrs (pkgs.linuxPackagesFor linux);
in
function
