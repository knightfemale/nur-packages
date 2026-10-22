{
  perSystem =
    {
      lib,
      self',
      ...
    }:
    {
      apps =
        lib.mapAttrs
          (name: _: {
            type = "app";
            program = lib.getExe self'.packages.${name};
          })
          (
            builtins.intersectAttrs (lib.genAttrs [
              "biu"
              "flake-show-ng"
            ] (_: null)) self'.packages
          );
    };
}
