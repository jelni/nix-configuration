{ lib, pkgs, ... }:
{
  environment.gnome.excludePackages = [ pkgs.gnome-tour ];

  programs.dconf.profiles =
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

            xkb-options = [ "shift:breaks_caps" ];
          };

          "org/gnome/desktop/interface" = {
            accent-color = "purple";
            clock-show-seconds = true;
            clock-show-weekday = true;
            cursor-theme = "Bibata-Modern-Ice";
            enable-hot-corners = false;
            font-hinting = "none";
            gtk-enable-primary-paste = false;
            show-battery-percentage = true;
          };

          "org/gnome/desktop/peripherals/keyboard".delay = lib.gvariant.mkUint16 200;
          "org/gnome/desktop/peripherals/touchpad".disable-while-typing = false;

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

          "org/gnome/nautilus/icon-view".default-zoom-level = "medium";
          "org/gnome/nautilus/list-view".default-zoom-level = "small";

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

          "org/gnome/shell".app-picker-layout = lib.gvariant.mkEmptyArray (
            lib.gvariant.type.arrayOf (
              lib.gvariant.type.dictionaryEntryOf lib.gvariant.type.string lib.gvariant.type.variant
            )
          );

          "org/gnome/shell/extensions/auto-move-windows".application-list = [
            "code.desktop:1"
            "dev.zed.Zed.desktop:1"
            "firefox-nightly.desktop:1"
            "org.telegram.desktop.desktop:2"
            "vesktop.desktop:2"
          ];

          "org/gnome/shell/extensions/azwallpaper" = {
            slideshow-directory = "${pkgs.symlinkJoin {
              name = "wallpapers";

              paths = [
                ../../wallpapers

                (pkgs.linkFarm "downloads" {
                  "gram-header-wallpaper-5k.png" = pkgs.fetchurl {
                    url = "https://gram.liten.app/wallpapers/gram-header-wallpaper-5k.png";
                    hash = "sha256-/i2c3hE/9OcNolY01kH01LGU+RbFHwK9+t9jgyBNmvA=";
                  };

                  "Hytale-Cursebreaker-Key-Art 8K.jpg" = "${
                    pkgs.fetchzip {
                      url = "https://cdn.hytale.com/8ddc303b227dd4a4809eab3be14a9d29_hytaleissaved_keyarts.zip";
                      hash = "sha256-51ycT/9Nv3KXIexBVkIZjt+uGERoSx9kEoDg/r6V3TA=";
                      stripRoot = false;
                    }
                  }/Hytale-Cursebreaker-Key-Art 8K.jpg";

                  "Niri cut.png" = pkgs.fetchurl {
                    url = "https://raw.githubusercontent.com/niri-wm/artwork/refs/heads/main/wallpapers/Niri%20cut.png";
                    hash = "sha256-NADtU49NRd7O9EYQO/80J4r46TPsi1omxm3R59PLtlQ=";
                  };

                  "Niri pool.png" = pkgs.fetchurl {
                    url = "https://raw.githubusercontent.com/niri-wm/artwork/refs/heads/main/wallpapers/Niri%20pool.png";
                    hash = "sha256-DaPoByv9c+70tBs2EeEt7TU5xNs+mXj+y/mfcoPHGD4=";
                  };
                })
              ];
            }}";

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
            clear-history = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
            clear-on-boot = false;
            confirm-clear = false;
            history-size = lib.gvariant.mkUint16 100;
            next-entry = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
            paste-on-select = true;
            prev-entry = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
            preview-size = lib.gvariant.mkUint16 64;
            private-mode-binding = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
            toggle-menu = [ "<Super>v" ];
          };

          "org/gnome/shell/extensions/system-monitor" = {
            show-download = false;
            show-swap = false;
            show-upload = false;
          };

          "org/gnome/shell/keybindings".toggle-message-tray =
            lib.gvariant.mkEmptyArray lib.gvariant.type.string;
          "org/gtk/gtk4/settings/file-chooser".show-hidden = true;
          "org/gtk/settings/file-chooser".show-hidden = true;
        };
      };
    in
    {
      user.databases = [ database ];
      gdm.databases = [ database ];
    };

  services = {
    desktopManager.gnome.enable = true;

    displayManager = {
      gdm.enable = true;
      autoLogin.user = "jel";
    };

    gnome.core-apps.enable = false;
    udev.packages = [ pkgs.gnome-settings-daemon ];
  };

  systemd.tmpfiles.rules = [
    "L /var/lib/AccountsService/icons/jel - - - - ${
      pkgs.fetchurl {
        url = "https://ipfs.jel.gay/ipfs/bafkreih2gvyh3igjgxxngd5w4jgab6tbj6mj77bcsoh7nshokbzmr2zdii";
        hash = "sha256-+jVwfaDJNe7TD7biTAD6YU+Yn/wik4/2yO5QcsjrI0I=";
      }
    }"
  ];
}
