{ pkgs, ... }: {

  home.packages = with pkgs; [
    gitflow
  ];

  programs.git = {
    enable = true;
  };

}
