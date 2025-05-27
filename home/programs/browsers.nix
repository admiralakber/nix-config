{ config, pkgs, username, inputs, ... }:
let
  unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in {
  home.packages = with pkgs; [
    python312Packages.adblock
  ];

  programs = {
    chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation,UseOzonePlatform,WebRTCPipeWireCapturer"
        "--ozone-platform=wayland"
        "--use-pipewire-for-audio"
      ];
    };

    brave = {
      enable = true;
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation,UseOzonePlatform,WebRTCPipeWireCapturer"
        "--ozone-platform=wayland"
        "--use-pipewire-for-audio"
      ];
    };

    firefox = {
      enable = true;
      profiles.${username} = {};
    };

    qutebrowser = {
      enable = true;
      package = unstablePkgs.qutebrowser;
      settings = {
        "zoom.default" = "100%";
        "colors.webpage.darkmode.enabled" = false;
        "auto_save.session" = true;
        "qt.args" = [
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=wayland"
        ];
        #"content.headers.user_agent" = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.92 Safari/537.36";
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
