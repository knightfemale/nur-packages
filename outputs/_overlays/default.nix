final: prev:

let
  inherit (prev.stdenv.hostPlatform)
    isAarch64
    isLinux
    ;

  deviceTreesRaw = final.callPackage ../_legacyPackages/deviceTrees { };
  python314PackagesRaw = prev.callPackage ../_legacyPackages/python314Packages { };
in
{
  lib = import ../_lib { lib = prev.lib; };

  inherit
    deviceTreesRaw
    python314PackagesRaw
    ;

  biu = if isLinux then final.callPackage ../_packages/biu { } else null;

  comfyui-workflow-mcp = final.callPackage ../_packages/comfyui-workflow-mcp { };

  deviceTrees = if (isLinux && isAarch64) then deviceTreesRaw else null;

  flake-show-ng = final.callPackage ../_packages/flake-show-ng { };

  python314Packages = prev.python314Packages.override {
    overrides = _pyFinal: _pyPrev: python314PackagesRaw;
  };
}
