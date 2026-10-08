{
  programs.claude-code = {
    enable = true;

    settings = {
      model = "opus";
      outputStyle = "Concise";
      permissions.deny = [ "Bash" ];
      switchModelsOnFlag = false;
    };
  };
}
