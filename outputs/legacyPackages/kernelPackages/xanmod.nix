{
  ...
}:
let
  kernel = {
    edge = rec {
      name = "xanmod";
      version = "7.2.3";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-Yw0mOXBlKJJEm7hohukkBIwqnq3Jn/z18+orXkJHaig=";
    };
    lts = rec {
      name = "xanmod";
      version = "6.18.49";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-9MQXQQQguCi+pzbcLbJDbpVteykR3U6vAPNOa002MAo=";
    };
    main = rec {
      name = "xanmod";
      version = "7.1.13";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-ID4BAkoa6/BL1KtqGBG1HqIyyXPU/mlBIpqK/QAPxBU=";
    };
    rt = rec {
      name = "rt-xanmod";
      version = "6.18.49";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-5o38g0oZBM/7ueLwTXV3F6HM6/+CFvNsO4F/5090OTQ=";
    };
  };
in
kernel
