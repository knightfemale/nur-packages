{
  ...
}:
let
  kernel = {
    edge = rec {
      name = "xanmod";
      version = "7.1.4";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-P6JrR8phpWiwKlz1ejShUGrfU1vMP+5qUWsdQfPPdEI=";
    };
    lts = rec {
      name = "xanmod";
      version = "6.18.39";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-xVrnnQ4IkEdWDtyhwJ4pwNCBqKmExxphRflnEM5u+HE=";
    };
    main = rec {
      name = "xanmod";
      version = "7.1.4";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-P6JrR8phpWiwKlz1ejShUGrfU1vMP+5qUWsdQfPPdEI=";
    };
    rt = rec {
      name = "rt-xanmod";
      version = "6.18.38";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-BS10HbtcOTgjsmQHTxgpRxLh25eqK4VWQnSj2XHAmqQ=";
    };
  };
in
kernel
