{
  ...
}:
let
  kernel = {
    latest = rec {
      name = "xanmod";
      version = "7.1.1";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-3TIUOeHtCeqKe40/Y4iGOqmTTpzZ/9k8bfQInB9fG9I=";
    };
  };
in
kernel
