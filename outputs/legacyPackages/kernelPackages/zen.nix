{
  ...
}:
let
  kernel = {
    lqx = rec {
      name = "lqx";
      version = "7.2.7";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-sFeqZeqzA9LBAgpXZU2DZcsb3Yi3DeUiQdUKQvD5Pvw=";
    };
    main = rec {
      name = "zen";
      version = "7.2.7";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-JzhQuxhFW+8RqlXQ9xKRDT689WQIkZLUeVLvB0xPPHY=";
    };
  };
in
kernel
