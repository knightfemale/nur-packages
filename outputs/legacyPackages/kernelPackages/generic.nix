{
  ...
}:
let
  kernel = {
    main = rec {
      name = "generic";
      version = "7.2.7";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-SsNMR9slQP+ycTlD+NiR/xcC4LppNFJaSTt9HK1DFFo=";
    };
  };
in
kernel
