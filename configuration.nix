{
  lib,
  pkgs,
  config,
  agenix,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];
  age.secrets.jel-password.file = "/etc/nixos/secrets/jel-password.age";

  boot = {
    supportedFilesystems = [ "zfs" ];
    zfs.forceImportRoot = false;

    loader.limine = {
      enable = true;
      efiSupport = true;
      extraConfig = "timeout: 1";
    };

  };

  system.autoUpgrade = {
    enable = true;
    channel = "https://channels.nixos.org/nixos-unstable";
  };

  programs = {
    _1password-gui.enable = true;
    _1password.enable = true;
    bat.enable = true;
    firefox.enable = true;
    fish.enable = true;
    steam.enable = true;
    less.envVariables.LESS = "-R --mouse";

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

    vscode = {
      enable = true;
      defaultEditor = true;
    };

    dconf.profiles =
      let
        database = {
          lockAll = true;

          settings = {
            "org/gnome/desktop/a11y/interface".show-status-shapes = true;

            "org/gnome/desktop/background" = {
              picture-options = "scaled";
              picture-uri = "/etc/nixos/assets/TAPETA.png";
              picture-uri-dark = "/etc/nixos/assets/TAPETA.png";
            };

            "org/gnome/desktop/calendar".show-weekdate = true;
            "org/gnome/desktop/input-sources".show-all-sources = true;

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
              switch-windows = "['<Alt>Tab']";
              switch-windows-backward = "['<Alt><Shift>Tab']";
            };

            "org/gnome/login-screen".enable-fingerprint-authentication = false;

            "org/gnome/mutter" = {
              experimental-features = [ "variable-refresh-rate" ];
              workspaces-only-on-primary = false;
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

            "org/gnome/SessionManager".logout-prompt = false;

            "org/gnome/shell" = {
              enabled-extensions = [
                "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
                "clipboard-history@alexsaveau.dev"
                "drive-menu@gnome-shell-extensions.gcampax.github.com"
                "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
                "status-icons@gnome-shell-extensions.gcampax.github.com"
                "steal-my-focus-window@steal-my-focus-window"
                "system-monitor@gnome-shell-extensions.gcampax.github.com"
              ];

              favorite-apps = [
                "firefox-nightly.desktop"
                "org.gnome.Nautilus.desktop"
                "com.mitchellh.ghostty.desktop"
                "org.telegram.desktop.desktop"
                "vesktop.desktop"
              ];
            };

            "org/gnome/shell/app-switcher".current-workspace-only = true;

            "org/gnome/shell/extensions/auto-move-windows".application-list = [
              "firefox-nightly.desktop:1"
              "org.telegram.desktop.desktop:2"
              "vesktop.desktop:3"
            ];

            "org/gnome/shell/extensions/clipboard-history" = {
              cache-only-favorites = true;
              confirm-clear = false;
              history-size = lib.gvariant.mkUint16 100;
            };

            "org/gnome/shell/extensions/system-monitor" = {
              show-download = false;
              show-swap = false;
              show-upload = false;
            };

            "org/gtk/settings/file-chooser".show-hidden = true;
          };
        };
      in
      {
        user.databases = [ database ];
        gdm.databases = [ database ];
      };
  };

  environment = {
    systemPackages = with pkgs; [
      agenix.packages.x86_64-linux.default

      agenix-cli
      aria2
      audacity
      # bambu-studio
      baobab
      bibata-cursors
      binwalk
      bottom
      claude-code
      davinci-resolve-studio
      deno
      dig
      doas-sudo-shim
      electrum-ltc
      espeak
      exiftool
      famistudio
      feather
      ffmpeg-full
      file
      fira-code
      gcc
      gh
      ghostty
      gimp3
      git
      gnome-calculator
      gnome-characters
      gnome-logs
      gnome-system-monitor
      google-cloud-sdk
      gparted
      halloy
      handbrake
      heroic
      httptoolkit
      imagemagick
      inkscape
      insomnia
      inter
      iosevka-bin
      jujutsu
      keybase-gui
      languagetool
      libreoffice-fresh
      loupe
      lucida-downloader
      magic-wormhole-rs
      mpv
      mullvad-vpn
      nautilus
      nil
      nixfmt
      nodejs
      nushell
      olympus
      p7zip
      parsec-bin
      parted
      pinta
      prismlauncher
      prusa-slicer
      pv
      qbittorrent
      reaper
      ripgrep
      rquickshare
      rustup
      safe-rm
      slack
      snapshot
      sparrow
      sqlitebrowser
      stripe-cli
      telegram-desktop
      tlrc
      tor
      tor-browser
      tutanota-desktop
      udiskie
      usbutils
      uutils-coreutils-noprefix
      uv
      vesktop
      vmware-workstation
      vscode
      wget2
      yt-dlp
      yubikey-manager

      nvtopPackages.amd

      gnomeExtensions.auto-move-windows
      gnomeExtensions.clipboard-history
      gnomeExtensions.launch-new-instance
      gnomeExtensions.removable-drive-menu
      gnomeExtensions.status-icons
      gnomeExtensions.steal-my-focus-window
      gnomeExtensions.system-monitor
    ];

    shellAliases = {
      cat = "bat";
      rm = "safe-rm";
      wget = "wget2";
    };

    gnome.excludePackages = [ pkgs.gnome-tour ];
  };

  nixpkgs.config = {
    allowUnfree = true;

    # permittedInsecurePackages = lib.warn "insecure libsoup is required for bambu-studio" [
    #   "libsoup-2.74.3"
    # ];
  };

  services = {
    desktopManager.gnome.enable = true;
    fwupd.enable = true;
    gnome.core-apps.enable = false;
    gvfs.enable = true;
    kubo.enable = true;
    openssh.enable = true;
    postgresql.enable = true;
    printing.enable = true;
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
      layout = "us";
      variant = "workman";
      options = "caps:shift";
    };

    resolved = {
      enable = true;
      dnsovertls = "opportunistic";
      dnssec = "allow-downgrade";
      fallbackDns = [ ];
    };

    chrony = {
      enable = true;
      enableNTS = true;

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

    users.jel = {
      isNormalUser = true;
      home = "/home/jel";
      hashedPasswordFile = config.age.secrets.jel-password.path;
      shell = pkgs.fish;

      extraGroups = [
        "docker"
        "networkmanager"
        "wheel"
      ];
    };
  };

  networking = {
    hostName = "hydromechanizator";
    hostId = "d0eca1a0";

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

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  virtualisation.docker.enable = true;

  system.stateVersion = "25.05";
}
