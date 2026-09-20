{ config, ... }:
let
  IdentityAgent = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
in
{
  home.sessionVariables.SSH_AUTH_SOCK = IdentityAgent;
  programs.ssh.settings."*" = { inherit IdentityAgent; };
}
