{
  ...
}:
let
  kernel = {
    edge = rec {
      name = "xanmod";
      version = "7.1.2";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-84IrLkWolh76zo+cLoVRZF45UE5wCu3/8LRAT4bHIzo=";
    };
    main = rec {
      name = "xanmod";
      version = "7.0.14";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-ZxmpxVYcT5xXE+FmKESRXsc7PjncrcqtBNMyOVBFYLo=";
    };
    lts = rec {
      name = "xanmod";
      version = "6.18.37";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-Idp69FqWkTOro522Deddbpt5Eo9SAN4KiXe8rhgn5YM=";
    };
    rt = rec {
      name = "rt-xanmod";
      version = "6.18.35";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-L4il1t0KKXPNFEi8uG7Eloumo3v8RR83/Y144IzehVc=";
    };
  };
in
kernel
