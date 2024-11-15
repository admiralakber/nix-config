{ pkgs, ... }: {

  home.packages = with pkgs; [
    gitflow
    orca-slicer
  ];

  programs.git = {
    enable = true;
  };

}
