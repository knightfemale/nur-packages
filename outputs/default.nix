inputs:
let
  # 从 nixpkgs 输入中获取 lib 工具库
  inherit (inputs.nixpkgs) lib;
  # 导入公共函数
  functions = import ../functions inputs;
in
inputs.flake-parts.lib.mkFlake { inherit inputs; } {
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
  perSystem =
    {
      system,
      ...
    }:
    {
      packages = import ./packages {
        inherit
          lib
          inputs
          system
          functions
          ;
      };
    };
  flake = {
    inherit functions;
    nixosModules = import ./modules { inherit lib; };
  };
}
