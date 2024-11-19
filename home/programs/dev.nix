{ pkgs, ... }: {

  home.packages = with pkgs; [
    gitflow
    orca-slicer
    openscad
  ];

  programs.git = {
    enable = true;
  };

}
