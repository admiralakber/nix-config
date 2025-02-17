{ lib, pkgs, ... }: {

  # Home user specific programs only.
  # Don't mix with what should be the desktop environment and vice versa: modules/sway.nix

  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip
    lrzip
    zstd

    # utils
    pass
    pandoc
    asciinema
    tree
    rclone
    restic
    ripgrep
    pywal
    python3
  ];

}
