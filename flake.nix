{
  inputs = {
    # ==================== nixos ====================
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    # ==================== trhird-party ====================
    flake-parts = {
      url = "github:hercules-ci/flake-parts/main";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };
  outputs = inputs: import ./outputs inputs;
}
