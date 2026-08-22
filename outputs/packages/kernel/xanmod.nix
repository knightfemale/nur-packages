{
  ...
}:
let
  kernel = {
    edge = rec {
      name = "xanmod";
      version = "7.2.0";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-AVdc+qvF/EI6y6M1URQRUul81cP85vAhl6pGUFTRvWs=";
    };
    lts = rec {
      name = "xanmod";
      version = "6.18.45";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-3OlPWwz8ElJCkL6nXQosZY0HLc9fDVUQhaVYK4FhVHY=";
    };
    main = rec {
      name = "xanmod";
      version = "7.1.9";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-iqXr3DZI0kVaPwOxvl6Gs86JkOMSnLGhG/uIogZ/Mtk=";
    };
    rt = rec {
      name = "rt-xanmod";
      version = "6.18.44";
      modDirVersion = "${version}-${name}1";
      url = "https://gitlab.com/xanmod/linux/-/archive/${modDirVersion}.tar.bz2";
      sha256 = "sha256-B/zuGGX4bzbDVEp+Ig6EOhT2fMhR4AZzptZnzzr7GSg=";
    };
  };
in
kernel
