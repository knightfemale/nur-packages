{
  ...
}:
let
  kernel = {
    main = rec {
      name = "zen";
      version = "7.1.2";
      modDirVersion = "${version}-${name}2";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-Vk62dxJ4gEod6XwJit8GaNX6EVgEx6fiZkroPhPuL2s=";
    };
    lqx = rec {
      name = "lqx";
      version = "7.0.14";
      modDirVersion = "${version}-${name}2";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-K4C44JWUVtX+I5hO90phlG7ghoassrz1cMuRZSInoHo=";
    };
  };
in
kernel
