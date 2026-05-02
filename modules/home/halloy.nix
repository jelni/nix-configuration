{ osConfig, pkgs, ... }:
{
  programs.halloy = {
    enable = true;
    package = pkgs.unstable.halloy;

    settings = {
      buffer = {
        buffer_separator.hide_when_all_read = true;
        text_input.auto_format = "all";
      };

      check_for_update_on_launch = false;

      notifications = {
        direct_message = {
          sound = "peck";
          show_toast = true;
          show_content = true;
        };

        highlight.sound = "dong";
      };

      servers.soju = {
        nickname = "jel";
        server = "irc.jel.gay";

        sasl.plain = {
          username = "jel";
          password_file = osConfig.age.secrets.soju-jel-password.path;
        };
      };
    };
  };
}
