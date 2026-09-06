{
  lib,
  pkgs,
  functions,
  ...
}:
let
  # 收集本目录下所有设备定义文件 (排除 default.nix 自身)
  deviceFiles = functions.recursive.collectFilesToList (name: name != "default.nix") ./.;
in
builtins.listToAttrs (
  lib.concatMap (
    file:
    let
      # 厂商目录名
      vendorDir = lib.removeSuffix ".nix" (baseNameOf file);
      # 导入设备定义文件
      devices = import file;
    in
    lib.mapAttrsToList (
      deviceName: meta:
      let
        # dtb 文件名由设备名派生: <设备名>.dtb
        fileName = "${deviceName}.dtb";
        # hardware.deviceTree.name: 相对 dtbSource 的路径 <厂商>/<文件名>
        name = "${vendorDir}/${fileName}";
        # 原始 dtb 文件
        dtbFile = pkgs.fetchurl {
          name = fileName;
          inherit (meta) url hash;
        };
        # hardware.deviceTree.dtbSource: 组装成 dtb 目录 (${dir}/<厂商>/<文件名>)
        dtbSource = pkgs.runCommand "${vendorDir}-${deviceName}-dtbs" { } ''
          mkdir -p $out/${vendorDir}
          cp ${dtbFile} $out/${name}
        '';
      in
      {
        name = deviceName;
        value = {
          inherit name dtbSource;
        };
      }
    ) devices
  ) deviceFiles
)
