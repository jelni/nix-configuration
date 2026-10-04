{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    corefonts
    fira-code
    inter
    iosevka
    noto-fonts
    ocr-a
    vista-fonts
  ];
}
