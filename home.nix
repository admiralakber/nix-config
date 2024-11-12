{ config, pkgs, ... }:

{
  home.username = "brat";
  home.homeDirectory = "/home/brat";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    history = {
      size = 10000;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "pass" ];
      theme = "darkblood";
    };
  };

  home.packages = with pkgs; [
	  # invincible summer
    gnupg
    tmux
    pulsemixer
    pass
    tree
    gitflow
    elixir-ls
    elixir
    i3status

	  # midst of winter
    brave
    inkscape
    vscode
    inkscape
    gimp
  ];

  programs.git = {
	  enable = true;
	  userName = "Aqeel Ahmad Akber";
	  userEmail = "aqeel@aqeelakber.com";
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
