{
  ...
}:
let
  kernel = {
    main = rec {
      name = "generic";
      version = "7.1.2";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-NxmMk3J74kfJ+1MJu4bNXklsYeUyLNjE7KlHa7C1iD8=";
    };
  };
in
kernel
