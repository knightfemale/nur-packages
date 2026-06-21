{
  ...
}:
let
  kernel = {
    latest = rec {
      name = "generic";
      version = "7.1.1";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-UhX6NUHcfn9bzVG/flfxac7G/OUIylTj3IX97hQ3HX0=";
    };
  };
in
kernel
