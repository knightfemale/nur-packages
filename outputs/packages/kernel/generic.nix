{
  ...
}:
let
  kernel = {
    main = rec {
      name = "generic";
      version = "7.1.4";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-HGOSKhGWddOOOuD49u4H8VxBp4arntZlY3SbuMmgji4=";
    };
  };
in
kernel
