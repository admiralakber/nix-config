{ lib, pkgs, ... }: {

  home.packages = with pkgs; [
    zathura
    ispell
    libreoffice-fresh
  ];

}
