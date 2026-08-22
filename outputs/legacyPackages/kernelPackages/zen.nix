{
  ...
}:
let
  kernel = {
    lqx = rec {
      name = "lqx";
      version = "7.1.9";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-BkRuB5etMm7wKAqqHPtQIw63FD66R+WrkDvfqpVsuXg=";
    };
    main = rec {
      name = "zen";
      version = "7.1.9";
      modDirVersion = "${version}-${name}1";
      url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v${modDirVersion}.tar.gz";
      sha256 = "sha256-WtFYSG7tRMLAnZSMJc32DKsvhRXy79bfguuGLV22etE=";
    };
  };
in
kernel
