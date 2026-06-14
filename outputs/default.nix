inputs:
let
  inherit (inputs.nixpkgs) lib;
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
          ;
      };
    };
}
