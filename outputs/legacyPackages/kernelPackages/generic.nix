{
  ...
}:
let
  kernel = {
    main = rec {
      name = "generic";
      version = "7.2.2";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-fQ584U+YxD7+iAz/vzVKWb5Fko/fcXDXMzw3SukcDYM=";
    };
  };
in
kernel
