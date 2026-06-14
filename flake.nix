{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    flake-parts = {
      url = "github:hercules-ci/flake-parts/main";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };
  outputs = inputs: import ./outputs inputs;
}
