{ pkgs, ... }: {

  home.packages = with pkgs; [
    # 3d printing
    orca-slicer
    openscad

    # env
    direnv

    # coding
    gitflow
    koji
    git-cliff

    # artificial intelligence
    ollama
  ];

  programs.git = {
    enable = true;
  };

}
