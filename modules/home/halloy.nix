{ osConfig, ... }:
{
  programs.halloy = {
    enable = true;

    settings = {
      buffer.buffer_separator.hide_when_all_read = true;
      buffer.text_input.auto_format = "all";

      notifications.direct_message = {
        sound = "peck";
        show_toast = true;
        show_content = true;
      };

      notifications.highlight.sound = "dong";

      servers.freenode = {
        nickname = "je";
        username = "jel";
        server = "irc.freenode.net";
        nick_password_file = osConfig.age.secrets.freenode-je-password.path;
      };
    };
  };
}
