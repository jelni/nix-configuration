{ lib, pkgs, ... }:
{


  gnome-keybindings.gpu-screen-recorder = {
    binding = "<Control>F9";
    command = "pkill -SIGINT -f gpu-screen-recorder || ${
      lib.escapeShellArgs [
        (lib.getExe pkgs.gpu-screen-recorder)
        "-w"
        "portal"
        "-o"
        "video.mp4"
      ]
    }";
  };


  programs.gpu-screen-recorder.enable = true;
}
