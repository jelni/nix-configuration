{
  lib,
  pkgs,
  config,
  agenix,
  nix-vscode-extensions,
  ...
}:
{
  age.secrets = {
    freenode-je-password.file = ../secrets/freenode-je-password.age;
    jel-password.file = ../secrets/jel-password.age;
    wireless-networks.file = ../secrets/wireless-networks.age;
  };

  nixpkgs = {
    overlays = [ nix-vscode-extensions.overlays.default ];
    config.allowUnfree = true;
  };

  nix.package = pkgs.lixPackageSets.git.lix;

  boot = {
    initrd.systemd.enable = true;
  };

  programs = {
    fish.enable = true;
    git.enable = true;
    nix-ld.enable = true;
  };

  environment = {
    systemPackages = [
      agenix.packages.x86_64-linux.default
    ];

    shellAliases = {
      rm = "safe-rm";
      wget = "wget2";
    };

    variables.PAGER = "moor";
  };

  services = {
    openssh.enable = true;
    postgresql.enable = true;
    timesyncd.enable = false;

    xserver.xkb = {
      layout = "pl-workman";
      options = "shift:breaks_caps";

      extraLayouts.pl-workman = {
        description = "Polish (Workman)";
        languages = [ "pol" ];
        symbolsFile = ../symbols/pl-workman;
      };
    };

    chrony = {
      enable = true;

      extraConfig = ''
        minsources 3
        rtconutc
      '';
    };
  };

  documentation.nixos.enable = false;

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    settings.trusted-substituters = [
      "https://nix-community.cachix.org"
      "https://numtide.cachix.org"
      "https://cache.garnix.io"
    ];
  };

  networking = {
    nftables.enable = true;

    timeServers = [
      "0.pool.ntp.org"
      "1.pool.ntp.org"
      "2.pool.ntp.org"
      "3.pool.ntp.org"
    ];
  };

  time.timeZone = "Europe/Warsaw";

  security = {
    sudo.enable = false;

    doas = {
      enable = true;

      extraRules = [
        {
          users = [ "jel" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };

  system.stateVersion = "25.05";
}
