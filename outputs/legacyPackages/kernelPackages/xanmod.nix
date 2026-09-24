{
  ...
}:
let
  kernel = {
    edge = rec {
      name = "xanmod";
      version = "7.2.7";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-KRxHXKpQx1bMXIO2R6p3D7NYbetIKpMEl+td4zImBq0=";
    };
    lts = rec {
      name = "xanmod";
      version = "6.18.53";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-jhAL987XEqaipsgeP6Hiev+jLew6VCi3rtQjvGjEBmo=";
    };
    main = rec {
      name = "xanmod";
      version = "7.2.7";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-KRxHXKpQx1bMXIO2R6p3D7NYbetIKpMEl+td4zImBq0=";
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
