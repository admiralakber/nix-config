{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    imv
    mpv
    spotify
    gimp
    inkscape
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [pkgs.mpvScripts.mpris];
    };
  };

  services = {
    playerctld.enable = true; # https://github.com/altdesktop/playerctl
  };

}
