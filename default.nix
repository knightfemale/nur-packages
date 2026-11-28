{
  pkgs,
}:

let
  overlay = import ./outputs/_overlays/default.nix;
  pkgs' = pkgs.extend overlay;

  deviceTrees = pkgs'.lib.recurseIntoPackageSets pkgs'.deviceTreesRaw;
  python314Packages = pkgs'.lib.recurseIntoPackageSets pkgs'.python314PackagesRaw;
in
{
  overlays.default = overlay;

  inherit (pkgs')
    biu
    comfyui-workflow-mcp
    flake-show-ng
    ;

  inherit
    python314Packages
    deviceTrees
    ;

  nixosModules = {
    openlist = ./outputs/_nixosModules/openlist;
  };

  homeModules = {
    comfyui-workflow-mcp = ./outputs/_homeModules/comfyui-workflow-mcp;
    lada = ./outputs/_homeModules/lada;
  };
}
