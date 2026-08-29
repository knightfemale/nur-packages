{
  ...
}:
let
  kernel = {
    lqx = rec {
      name = "lqx";
      version = "7.1.11";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-ZwHDw/0b9Mvcb8+R5SJU2rOW4q5EIqzSelki62YMdKI=";
    };
    main = rec {
      name = "zen";
      version = "7.2.2";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-U23JSTlElo1QiOFJEgTYQEP8q0X8swzj+wxtvw4/Hl4=";
    };
  };
in
kernel
