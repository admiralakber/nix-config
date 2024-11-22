{ pkgs, inputs, ... }:
  let
  unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
  in {
  home.packages = with pkgs; [
    # 3d printing
    unstablePkgs.orca-slicer
    #openscad
    #openscad-unstable
    unstablePkgs.openscad-unstable

    # env
    direnv

    # coding
    gitflow
    koji
    git-cliff

    # artificial intelligence
    unstablePkgs.ollama
  ];

  programs.git = {
    enable = true;
  };
  }
