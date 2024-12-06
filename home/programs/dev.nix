{ pkgs, inputs, ... }:
  let
  unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
  in {
  home.packages = with pkgs; [
    # 3d printing
    orca-slicer
    #openscad
    #openscad-unstable
    unstablePkgs.openscad-unstable
    unstablePkgs.freecad-wayland

    # env
    direnv

    # coding
    gitflow
    koji
    git-cliff

    # artificial intelligence
    #unstablePkgs.ollama
    unstablePkgs.ollama-rocm
    unstablePkgs.amdgpu_top
  ];

  programs.git = {
    enable = true;
  };

  }
