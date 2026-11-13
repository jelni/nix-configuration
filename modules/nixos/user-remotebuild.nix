{pkgs,...}:let name = "remotebuild"; in {
  nix.settings.trusted-users = [ name ];

  users = {
    groups.${name} = { };

    users.${name} = {
      group = name;
      isSystemUser = true;
      shell = pkgs.bashInteractive;
    };
  };
}
