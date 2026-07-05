{
  ...
}:
let
  kernel = {
    main = rec {
      name = "generic";
      version = "7.1.3";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-vkHAaOiPUkKhm8zb/74HexjEe0X2J+IyVQS0+red0dw=";
    };
  };
in
kernel
