{ config, pkgs, username, ... }: {

  home.packages = with pkgs; [
    python312Packages.adblock
  ];

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

    # qutebroser
    qutebrowser = {
      enable = true;
      settings = {
        "colors.webpage.darkmode.enabled" = true;
        "auto_save.session" = true;
        "content.blocking.method" = "both";
        "content.blocking.adblock.lists" = [
          "https://easylist.to/easylist/easylist.txt"
          "https://easylist.to/easylist/easyprivacy.txt"
          "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt"
        ];
      };
    };
  };
}
