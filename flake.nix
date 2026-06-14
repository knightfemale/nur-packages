{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    flake-parts = {
      url = "github:hercules-ci/flake-parts/main";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/master";
  };
  outputs = inputs: import ./outputs inputs;
}
