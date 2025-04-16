{ pkgs, inputs, ... }:
  let
  unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
  in {
  home.packages = with pkgs; [
    kdenlive
    discord
    slack
    code-cursor
    warp-terminal
  ];
  }
