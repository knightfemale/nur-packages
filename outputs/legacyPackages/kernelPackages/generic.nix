{
  ...
}:
let
  kernel = {
    main = rec {
      name = "generic";
      version = "7.2.3";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-i6JZ6OexPsbvCUHIo5rZCyS9Sk1sABC6a6+3lFUOzQM=";
    };
  };
in
kernel
