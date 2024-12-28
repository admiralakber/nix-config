{ config, pkgs, ... }: {

  home.file.".config/sway/wallpaper.jpg".source = ./wallpaper.jpg;
  home.file.".config/sway/config".source = ./config;
}
