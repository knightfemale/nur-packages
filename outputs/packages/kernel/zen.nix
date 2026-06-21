{
  ...
}:
let
  kernel = {
    latest = rec {
      name = "zen";
      version = "7.0.12";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-eA8QTmh0Fs94hu5ZM3BZmfvnp6uc+PtAOrXW7j6CtsE=";
    };
    lqx-latest = rec {
      name = "lqx";
      version = "7.0.13";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-ZL1UM6t+WJpFUg7+Lzwb3GEHVaGUZylkBFD7LYUmCfk=";
    };
  };
in
kernel
