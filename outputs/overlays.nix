{
  lib,
  config,
  inputs,
  ...
}:
{
  flake.overlays.default =
    final: prev:
    let
      inherit (prev.stdenv.hostPlatform)
        isAarch64
        isLinux
        ;
    in
    {
      flake-show-ng = final.callPackage ./_packages/flake-show-ng { };
    }
    // lib.optionalAttrs isLinux {
      biu = final.callPackage ./_packages/biu { };
    }
    // lib.optionalAttrs (isLinux && isAarch64) {
      deviceTrees = final.callPackage ./_legacyPackages/deviceTrees { };
    };

  perSystem =
    {
      system,
      ...
    }:
    {
      _module.args.pkgs =
        (import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }).extend
          config.flake.overlays.default;
    };
}
