{
  ...
}:
let
  kernel = {
    main = rec {
      name = "generic";
      version = "7.2";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-+f7z0UwN9TgZAm9L50RZg1wqCw3L9bW72eoZ8IKUArM=";
    };
  };
in
kernel
