{
  config,
  inputs,
  ...
}:
{
  flake.overlays = {
    default = import ./_overlays/default.nix;
  };

  flake.lib = import ./_lib { lib = inputs.nixpkgs.lib; };

  perSystem =
    {
      system,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ config.flake.overlays.default ];
      };
    };
}
