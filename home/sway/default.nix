{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    picom
  ];

  home.file.".config/sway/wallpaper.jpg".source = ./wallpaper.jpg;
  home.file.".config/sway/config".source = ./config;
  home.file.".config/picom/picom.conf".source = ./picom.conf;
}
