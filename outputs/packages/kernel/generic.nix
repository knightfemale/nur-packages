{
  ...
}:
let
  kernel = {
    latest = rec {
      name = "generic";
      version = "7.1";
      modDirVersion = "${version}";
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${modDirVersion}.tar.xz";
      sha256 = "sha256-aR9EeX++eQ3IoyFgTJJwh1Jq0nttZJkl1g+O7QolZKA=";
    };
  };
in
kernel
