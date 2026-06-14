{
  ...
}:
let
  kernel = {
    latest = rec {
      name = "generic";
      version = "7.0.12";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-V+3JpB78HKa3l6+o9KWHow2ir2vKc1brVuHhpK2iZdo=";
    };
  };
in
kernel
