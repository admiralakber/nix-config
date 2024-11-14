{ config, pkgs, ... }: {

  home.file."config/doom" = {
    source = ./doom;
    recursive = true;
    };

}
