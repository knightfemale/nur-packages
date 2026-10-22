{
  perSystem =
    {
      lib,
      pkgs,
      ...
    }:
    {
      packages = builtins.intersectAttrs (lib.genAttrs [
        "biu"
        "flake-show-ng"
      ] (_: null)) pkgs;
    };
}
