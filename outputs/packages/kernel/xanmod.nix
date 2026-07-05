{
  ...
}:
let
  kernel = {
    edge = rec {
      name = "xanmod";
      version = "7.1.3";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-aZonpggTOW3F336NPPFnmEaZLvl0qdg4bJ/+iKcZtHg=";
    };
    main = rec {
      name = "xanmod";
      version = "7.1.3";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-aZonpggTOW3F336NPPFnmEaZLvl0qdg4bJ/+iKcZtHg=";
    };
    lts = rec {
      name = "xanmod";
      version = "6.18.38";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-aU893DOsT9V0wNAkwBpVjDAj8GbTP5EoOlUyHJMz2Hs=";
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
