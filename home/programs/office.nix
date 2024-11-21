{ lib, pkgs, ... }: {

  home.packages = with pkgs; [
    zathura
    lyx
    ispell
  ];

}
