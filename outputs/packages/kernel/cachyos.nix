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
  bore-lto-v2 = {
    name = "cachyos-bore-lto-v2";
    packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-x86_64-v2;
  };
  bore-lto-v3 = {
    name = "cachyos-bore-lto-v3";
    packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-x86_64-v3;
  };
  bore-lto-v4 = {
    name = "cachyos-bore-lto-v4";
    packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-x86_64-v4;
  };
  bore-lto-zen4 = {
    name = "cachyos-bore-lto-zen4";
    packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-zen4;
  };
  server-lto = {
    name = "cachyos-server-lto";
    packages = cachyos-kernel.linuxPackages-cachyos-server-lto;
  };
}
