{ config, lib, ... }:
{
  networking.networkmanager = {
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
}
