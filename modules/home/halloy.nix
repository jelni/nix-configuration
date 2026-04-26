{ osConfig, pkgs, ... }:
{
  programs.halloy = {
    enable = true;
    package = pkgs.unstable.halloy;

    settings = {
      buffer.buffer_separator.hide_when_all_read = true;
      buffer.text_input.auto_format = "all";

      notifications.direct_message = {
        sound = "peck";
        show_toast = true;
        show_content = true;
      };

      notifications.highlight.sound = "dong";

      servers.soju = {
        nickname = "jel";
        server = "192.168.1.50";
        port = 6667;
        use_tls = false;

        sasl.plain = {
          username = "jel";
          password_file = osConfig.age.secrets.soju-jel-password.path;
        };
      };
    };
  };
}
