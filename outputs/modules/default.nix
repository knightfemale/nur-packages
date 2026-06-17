{
  lib,
  ...
}:
let
  # 递归扫描所有子目录, 导入各子目录的 default.nix
  # 命名规则: services/foo/default.nix → nixosModules.foo
  scanDir =
    dir:
    let
      content = builtins.readDir dir;
      subdirs = builtins.attrNames (lib.filterAttrs (_: type: type == "directory") content);
      processDir =
        name:
        let
          subPath = dir + "/${name}";
        in
        lib.recursiveUpdate (lib.optionalAttrs (builtins.pathExists (subPath + "/default.nix")) {
          ${name} = import subPath;
        }) (scanDir subPath);
    in
    builtins.foldl' lib.recursiveUpdate { } (map processDir subdirs);
in
scanDir ./.
