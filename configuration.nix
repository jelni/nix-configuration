{
  lib,
  pkgs,
  config,
  agenix,
  nix-vscode-extensions,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  age.secrets = {
    freenode-je-password.file = ./secrets/freenode-je-password.age;
    jel-password.file = ./secrets/jel-password.age;
    wireless-networks.file = ./secrets/wireless-networks.age;
  };

  nixpkgs = {
    overlays = [ nix-vscode-extensions.overlays.default ];
    config.allowUnfree = true;
  };

  nix.package = pkgs.lixPackageSets.git.lix;

  boot = {
    supportedFilesystems = [ "zfs" ];
    zfs.forceImportRoot = false;
    initrd.systemd.enable = true;

    loader.limine = {
      enable = true;
      efiSupport = true;
      extraConfig = "timeout: 1";
    };

    plymouth = {
      enable = true;
      logo = ./assets/hackerspace-zyrardow.png;
    };
  };

  programs = {
    _1password.enable = true;

    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "jel" ];
    };

    dconf.profiles =
      let
        database = {
          lockAll = true;

          settings = {
            "org/gnome/desktop/a11y/interface".show-status-shapes = true;
            "org/gnome/desktop/calendar".show-weekdate = true;

            "org/gnome/desktop/input-sources" = {
              show-all-sources = true;

              sources = [
                (lib.gvariant.mkTuple [
                  "xkb"
                  "pl-workman"
                ])
                (lib.gvariant.mkTuple [
                  "xkb"
                  "pl"
                ])
              ];
            };

            "org/gnome/desktop/interface" = {
              clock-show-seconds = true;
              clock-show-weekday = true;
              color-scheme = "prefer-dark";
              cursor-theme = "Bibata-Modern-Ice";
              document-font-name = "Inter 11";
              enable-hot-corners = false;
              font-hinting = "none";
              font-name = "Inter 11";
              gtk-enable-primary-paste = false;
              monospace-font-name = "Fira Code 11 @wght=400";
              show-battery-percentage = true;
            };

            "org/gnome/desktop/peripherals/keyboard".delay = lib.gvariant.mkUint16 200;

            "org/gnome/desktop/privacy" = {
              old-files-age = lib.gvariant.mkUint16 7;
              remember-recent-files = false;
              remove-old-temp-files = true;
              remove-old-trash-files = true;
            };

            "org/gnome/desktop/screen-time-limits".history-enabled = false;
            "org/gnome/desktop/screensaver".lock-delay = lib.gvariant.mkUint16 30;
            "org/gnome/desktop/session".idle-delay = lib.gvariant.mkUint16 180;

            "org/gnome/desktop/sound" = {
              allow-volume-above-100-percent = true;
              event-sounds = false;
            };

            "org/gnome/desktop/wm/keybindings" = {
              switch-to-workspace-down = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
              switch-to-workspace-up = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
              switch-windows = [ "<Alt>Tab" ];
              switch-windows-backward = [ "<Shift><Alt>Tab" ];
            };

            "org/gnome/gnome-session".logout-prompt = false;
            "org/gnome/login-screen".enable-fingerprint-authentication = false;
            "org/gnome/mutter".experimental-features = [ "variable-refresh-rate" ];

            "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            ];

            "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
              binding = "<Shift><Control>space";
              command = "1password --quick-access";
            };

            "org/gnome/settings-daemon/plugins/color" = {
              night-light-enabled = true;
              night-light-schedule-from = 22.0;
            };

            "org/gnome/settings-daemon/plugins/power" = {
              ambient-enabled = false;
              idle-dim = false;
              sleep-inactive-ac-type = "nothing";
              sleep-inactive-battery-timeout = lib.gvariant.mkUint16 1800;
            };

            "org/gnome/shell".favorite-apps = [
              "firefox-nightly.desktop"
              "org.gnome.Nautilus.desktop"
              "com.mitchellh.ghostty.desktop"
              "org.telegram.desktop.desktop"
              "vesktop.desktop"
            ];

            "org/gnome/shell/app-switcher".current-workspace-only = true;

            "org/gnome/shell/extensions/auto-move-windows".application-list = [
              "code.desktop:1"
              "firefox-nightly.desktop:1"
              "org.telegram.desktop.desktop:2"
              "vesktop.desktop:3"
            ];

            "org/gnome/shell/extensions/azwallpaper" = {
              slideshow-directory = "${./wallpapers}";

              slideshow-slide-duration = lib.gvariant.mkTuple (
                map lib.gvariant.mkInt32 [
                  1
                  0
                  0
                ]
              );

              slideshow-use-absolute-time-for-duration = true;
            };

            "org/gnome/shell/extensions/clipboard-indicator" = {
              cache-only-favorites = true;
              confirm-clear = false;
              history-size = lib.gvariant.mkUint16 100;
              preview-size = lib.gvariant.mkUint16 64;
              toggle-menu = [ "<Super>v" ];
              private-mode-binding = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
              clear-history = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
              prev-entry = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
              next-entry = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
            };

            "org/gnome/shell/extensions/system-monitor" = {
              show-download = false;
              show-swap = false;
              show-upload = false;
            };

            "org/gnome/shell/keybindings".toggle-message-tray =
              lib.gvariant.mkEmptyArray lib.gvariant.type.string;
            "org/gtk/settings/file-chooser".show-hidden = true;
          };
        };
      in
      {
        user.databases = [ database ];
        gdm.databases = [ database ];
      };

    fish.enable = true;
    git.enable = true;
    nix-ld.enable = true;

    obs-studio = {
      enable = true;
      enableVirtualCamera = true;

      plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
        obs-gstreamer
        obs-pipewire-audio-capture
        obs-vaapi
        obs-vkcapture
        wlrobs
      ];
    };

    steam.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      agenix.packages.x86_64-linux.default

      _7zz
      audacity
      bambu-studio
      baobab
      bibata-cursors
      binwalk
      comaps
      davinci-resolve-studio
      deno
      dig
      doas-sudo-shim
      dust
      espeak
      exiftool
      famistudio
      feather
      ffmpeg-full
      file
      fira-code
      framework-tool-tui
      gimp3
      gnome-calculator
      gnome-characters
      gnome-logs
      gnome-system-monitor
      google-cloud-sdk
      gparted
      handbrake
      heroic
      httptoolkit
      imagemagick
      inkscape
      insomnia
      inter
      iosevka-bin
      keybase-gui
      languagetool
      libreoffice-fresh
      loupe
      lucida-downloader
      magic-wormhole-rs
      moor
      nautilus
      nil
      nixd
      nixfmt
      nodejs
      nvtopPackages.amd
      olympus
      parsec-bin
      parted
      pinta
      prettier
      prismlauncher
      prusa-slicer
      pv
      python314
      qbittorrent
      quodlibet-full
      reaper
      rquickshare
      rustup
      safe-rm
      slack
      snapshot
      sparrow
      sqlitebrowser
      stripe-cli
      superTuxKart
      telegram-desktop
      tlrc
      tor
      tor-browser
      trezor-suite
      tutanota-desktop
      usbutils
      uutils-coreutils-noprefix
      vmware-workstation
      wget2
      yubikey-manager
    ];

    shellAliases = {
      rm = "safe-rm";
      wget = "wget2";
    };

    gnome.excludePackages = [ pkgs.gnome-tour ];
    variables.PAGER = "moor";

    etc."1password/custom_allowed_browsers" = {
      text = "firefox-nightly-bin";
      mode = "0755";
    };
  };

  services = {
    desktopManager.gnome.enable = true;
    flatpak.enable = true;
    fwupd.enable = true;
    gnome.core-apps.enable = false;
    gvfs.enable = true;
    openssh.enable = true;
    postgresql.enable = true;
    printing.enable = true;
    snowflake-proxy.enable = true;
    timesyncd.enable = false;
    tlp.enable = false;
    tuned.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    xserver.excludePackages = [ pkgs.xterm ];
    udev.packages = [ pkgs.gnome-settings-daemon ];

    zfs = {
      autoScrub.enable = true;

      autoSnapshot = {
        enable = true;
        flags = "-pu";
        monthly = 0;
      };
    };

    displayManager = {
      gdm.enable = true;
      autoLogin.user = "jel";
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    xserver.xkb = {
      layout = "pl-workman";
      options = "shift:breaks_caps";

      extraLayouts.pl-workman = {
        description = "Polish (Workman)";
        languages = [ "pol" ];
        symbolsFile = ./symbols/pl-workman;
      };
    };

    resolved = {
      enable = true;
      dnsovertls = "opportunistic";
      dnssec = "allow-downgrade";
      fallbackDns = [ ];
    };

    chrony = {
      enable = true;

      extraConfig = ''
        minsources 3
        rtconutc
      '';
    };

    ollama = {
      enable = true;
      acceleration = "rocm";
      rocmOverrideGfx = "11.0.0";
    };

    kubo = {
      enable = true;
      enableGC = true;
      startWhenNeeded = true;
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

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;

    users = {
      jel = {
        isNormalUser = true;
        hashedPasswordFile = config.age.secrets.jel-password.path;

        extraGroups = [
          "docker"
          "ipfs"
          "networkmanager"
          "wheel"
        ];
      };

      guest = {
        isNormalUser = true;
        hashedPassword = "";
      };
    };
  };

  networking = {
    hostName = "hydromechanizator";
    hostId = "d0eca1a0";
    nftables.enable = true;

    nameservers = [
      "194.242.2.4#base.dns.mullvad.net"
      "2a07:e340::4#base.dns.mullvad.net"
    ];

    timeServers = [
      "0.pool.ntp.org"
      "1.pool.ntp.org"
      "2.pool.ntp.org"
      "3.pool.ntp.org"
    ];

    firewall = {
      allowedTCPPorts = [
        80
        443
      ];
    };

    networkmanager = {
      wifi.macAddress = "stable-ssid";
      ethernet.macAddress = "stable";

      ensureProfiles = {
        environmentFiles = [ config.age.secrets.wireless-networks.path ];

        profiles =
          let
            profile = name: {
              connection = {
                id = "\$${name}_SSID";
                type = "wifi";
              };

              wifi.ssid = "\$${name}_SSID";

              wifi-security = {
                key-mgmt = "\$${name}_SECURITY";
                psk = "\$${name}_PASS";
              };
            };
          in
          builtins.listToAttrs (
            builtins.map
              (name: {
                inherit name;
                value = profile (lib.toUpper name);
              })
              # thank you https://t.me/totalnie_zmyslone_slowa
              [
                "grawideon"
                "gidflugh"
                "kataplaster"
                "alfabetyzator"
                "genetication"
                "adoment"
                "abstrulich"
                "wpajpowac"
                "siekieralt"
                "technokokarda"
              ]
          );
      };
    };
  };

  time.timeZone = "Europe/Warsaw";
  location.provider = "geoclue2";

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

  virtualisation.docker.enable = true;
  system.stateVersion = "25.05";
}
