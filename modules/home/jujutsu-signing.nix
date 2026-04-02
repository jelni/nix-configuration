{
  programs.jujutsu.settings = {
    signing = {
      behavior = "force";
      backend = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeyqBh/je0A8dMXB0m9jxZ0nBWHc5Hj+dFmFBiT5Mdw";
    };

    git.sign-on-push = true;
  };
}
