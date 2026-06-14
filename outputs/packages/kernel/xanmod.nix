{
  ...
}:
let
  kernel = {
    latest = rec {
      name = "xanmod";
      version = "7.0.12";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-JYwfRVeNEy6xGdshBwRrLJsAdoeYGrfZvzB+2asQAIc=";
    };
  };
in
kernel
