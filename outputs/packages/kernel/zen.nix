{
  ...
}:
let
  kernel = {
    main = rec {
      name = "zen";
      version = "7.1.2";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-vyN0VQhyZVEQSTC5hmv++kbc63KqhlHesec36397hPU=";
    };
    lqx = rec {
      name = "lqx";
      version = "7.0.13";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-ZL1UM6t+WJpFUg7+Lzwb3GEHVaGUZylkBFD7LYUmCfk=";
    };
  };
in
kernel
