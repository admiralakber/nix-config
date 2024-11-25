{ config, pkgs, ... }: {
  home.file.".config/sway/config".source = ./config;
  home.file.".config/mako/config".source = ./mako/config;
}
