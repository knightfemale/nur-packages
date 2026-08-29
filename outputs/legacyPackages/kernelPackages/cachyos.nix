{
  lib,
  inputs,
  system,
  ...
}:
let
  cachyos-kernel = inputs.nix-cachyos-kernel.legacyPackages.${system} or null;
  kernel = lib.optionalAttrs (cachyos-kernel != null) {
    # Latest kernel, provides all LTO/CPU arch variants
    latest.packages = cachyos-kernel.linuxPackages-cachyos-latest;
    latest-v2.packages = cachyos-kernel.linuxPackages-cachyos-latest-x86_64-v2;
    latest-v3.packages = cachyos-kernel.linuxPackages-cachyos-latest-x86_64-v3;
    latest-v4.packages = cachyos-kernel.linuxPackages-cachyos-latest-x86_64-v4;
    latest-zen4.packages = cachyos-kernel.linuxPackages-cachyos-latest-zen4;
    latest-lto.packages = cachyos-kernel.linuxPackages-cachyos-latest-lto;
    latest-lto-v2.packages = cachyos-kernel.linuxPackages-cachyos-latest-lto-x86_64-v2;
    latest-lto-v3.packages = cachyos-kernel.linuxPackages-cachyos-latest-lto-x86_64-v3;
    latest-lto-v4.packages = cachyos-kernel.linuxPackages-cachyos-latest-lto-x86_64-v4;
    latest-lto-zen4.packages = cachyos-kernel.linuxPackages-cachyos-latest-lto-zen4;
    # LTS kernel, provides all LTO/CPU arch variants
    lts.packages = cachyos-kernel.linuxPackages-cachyos-lts;
    lts-v2.packages = cachyos-kernel.linuxPackages-cachyos-lts-x86_64-v2;
    lts-v3.packages = cachyos-kernel.linuxPackages-cachyos-lts-x86_64-v3;
    lts-v4.packages = cachyos-kernel.linuxPackages-cachyos-lts-x86_64-v4;
    lts-zen4.packages = cachyos-kernel.linuxPackages-cachyos-lts-zen4;
    lts-lto.packages = cachyos-kernel.linuxPackages-cachyos-lts-lto;
    lts-lto-v2.packages = cachyos-kernel.linuxPackages-cachyos-lts-lto-x86_64-v2;
    lts-lto-v3.packages = cachyos-kernel.linuxPackages-cachyos-lts-lto-x86_64-v3;
    lts-lto-v4.packages = cachyos-kernel.linuxPackages-cachyos-lts-lto-x86_64-v4;
    lts-lto-zen4.packages = cachyos-kernel.linuxPackages-cachyos-lts-lto-zen4;
    # Latest kernel with BORE scheduler, all LTO/CPU arch variants
    bore.packages = cachyos-kernel.linuxPackages-cachyos-bore;
    bore-v2.packages = cachyos-kernel.linuxPackages-cachyos-bore-x86_64-v2;
    bore-v3.packages = cachyos-kernel.linuxPackages-cachyos-bore-x86_64-v3;
    bore-v4.packages = cachyos-kernel.linuxPackages-cachyos-bore-x86_64-v4;
    bore-zen4.packages = cachyos-kernel.linuxPackages-cachyos-bore-zen4;
    bore-lto.packages = cachyos-kernel.linuxPackages-cachyos-bore-lto;
    bore-lto-v2.packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-x86_64-v2;
    bore-lto-v3.packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-x86_64-v3;
    bore-lto-v4.packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-x86_64-v4;
    bore-lto-zen4.packages = cachyos-kernel.linuxPackages-cachyos-bore-lto-zen4;
    # Additional CachyOS kernel variants
    bmq.packages = cachyos-kernel.linuxPackages-cachyos-bmq;
    bmq-lto.packages = cachyos-kernel.linuxPackages-cachyos-bmq-lto;
    deckify.packages = cachyos-kernel.linuxPackages-cachyos-deckify;
    deckify-lto.packages = cachyos-kernel.linuxPackages-cachyos-deckify-lto;
    eevdf.packages = cachyos-kernel.linuxPackages-cachyos-eevdf;
    eevdf-lto.packages = cachyos-kernel.linuxPackages-cachyos-eevdf-lto;
    hardened.packages = cachyos-kernel.linuxPackages-cachyos-hardened;
    hardened-lto.packages = cachyos-kernel.linuxPackages-cachyos-hardened-lto;
    rc.packages = cachyos-kernel.linuxPackages-cachyos-rc;
    rc-lto.packages = cachyos-kernel.linuxPackages-cachyos-rc-lto;
    rt-bore.packages = cachyos-kernel.linuxPackages-cachyos-rt-bore;
    rt-bore-lto.packages = cachyos-kernel.linuxPackages-cachyos-rt-bore-lto;
    server.packages = cachyos-kernel.linuxPackages-cachyos-server;
    server-lto.packages = cachyos-kernel.linuxPackages-cachyos-server-lto;
  };
in
kernel
