{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    corefonts
    fira-code
    inter
    iosevka
    ocr-a
  ];
}
