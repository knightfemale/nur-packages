{
  lib,
  inputs,
  system,
  ...
}:
let
  cachyos-kernel = inputs.nix-cachyos-kernel.legacyPackages.${system} or null;
in
lib.optionalAttrs (cachyos-kernel != null) {
  bmq-lto = {
    name = "cachyos-bmq-lto";
    packages = cachyos-kernel.linuxPackages-cachyos-bmq-lto;
  };
  server-lto = {
    name = "cachyos-server-lto";
    packages = cachyos-kernel.linuxPackages-cachyos-server-lto;
  };
  bore-lto-v3 = {
    name = "cachyos-bore-lto-v3";
    packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-x86_64-v3;
  };
}
