{ config, lib, ... }:
{
  age.secrets.wireless-networks.file = ../../secrets/wireless-networks.age;

  networking.networkmanager = {
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
          map
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

    ethernet.macAddress = "stable";

    wifi = {
      backend = "iwd";
      macAddress = "stable-ssid";
    };
  };
}
