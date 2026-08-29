{
  ...
}:
let
  kernel = {
    edge = rec {
      name = "xanmod";
      version = "7.2.1";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-OX3r62TW+lbK7SQ5TW4+xcvOGqxVf7ZVJFI+WevJcz8=";
    };
    lts = rec {
      name = "xanmod";
      version = "6.18.47";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-fuY6WmZe0EFLPqHRHBJqEgKHP42socmzmAEqozu3L7o=";
    };
    main = rec {
      name = "xanmod";
      version = "7.1.11";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-jq5dyPkkQyI/yNiG9tLP7RYZdvHWtXwK5NM2hPfzMlo=";
    };
    rt = rec {
      name = "rt-xanmod";
      version = "6.18.47";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-44U45XmKTl05gdif9+IjAS8QGfuPZq6jIwZP3IdBf1E=";
    };
  };
in
kernel
