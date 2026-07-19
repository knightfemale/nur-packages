{
  ...
}:
let
  kernel = {
    lqx = rec {
      name = "lqx";
      version = "7.1.3";
      modDirVersion = "${version}-${name}3";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-osqTNdCgcfkAiq646RJ1dS5VkJuEFPFv4tDVlHU6pQA=";
    };
    main = rec {
      name = "zen";
      version = "7.1.4";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-/0JUnH9Uo7pc0XPtuhaOVpQh3ejjKwtlLHC/btP492M=";
    };
  };
in
kernel
