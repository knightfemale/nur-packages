{
  ...
}:
let
  kernel = {
    lqx = rec {
      name = "lqx";
      version = "7.2.3";
      modDirVersion = "${version}-${name}2";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-/wcUZEjODlYLbiZ7i+ij0BT5wf/Tj3iwWomTv6oAkhg=";
    };
    main = rec {
      name = "zen";
      version = "7.2.3";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-wGq5lodwr26dxfmoN/OOAk15oOPH6WuPhRVOewLSYvE=";
    };
  };
in
kernel
