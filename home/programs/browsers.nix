{ config, pkgs, username, ... }: {

  programs = {
    chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation,UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    };

    brave = {
      enable = true;
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation,UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    };

    firefox = {
      enable = true;
      profiles.${username} = {};
    };

    qutebrowser = {
     enable = true;
   };
  };
}
