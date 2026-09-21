{
  ...
}:
let
  kernel = {
    lqx = rec {
      name = "lqx";
      version = "7.2.6";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-x6y5vwiHKNxCPLJmwuouYnim7Slq88+YgQ3Deem3xLE=";
    };
    main = rec {
      name = "zen";
      version = "7.2.6";
      modDirVersion = "${version}-${name}2";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-N+V5UR8ViVg2aI2vl96Jc4O9DwYViClAMyYe3JENcjc=";
    };
  };
in
kernel
