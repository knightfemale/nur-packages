{
  ...
}:
let
  kernel = {
    edge = rec {
      name = "xanmod";
      version = "7.2.6";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-ZJE+vsWyAsZ0MzZ9ahimSPFGpL+goCiV+MsVHgpeqoA=";
    };
    lts = rec {
      name = "xanmod";
      version = "6.18.52";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-/CYiJTg9tBopkWNbNHgPbWoqMfbb+eZZNYN8uJYJQyY=";
    };
    main = rec {
      name = "xanmod";
      version = "7.2.6";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-ZJE+vsWyAsZ0MzZ9ahimSPFGpL+goCiV+MsVHgpeqoA=";
    };
    rt = rec {
      name = "rt-xanmod";
      version = "6.18.52";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-q5SQs5C5tdJZV4x6clrzzvzmx0NipDkTiW4sC4UQuJ0=";
    };
  };
in
kernel
