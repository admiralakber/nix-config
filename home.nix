{ config, pkgs, ... }:

{
  home.username = "brat";
  home.homeDirectory = "/home/brat";

  home.packages = with pkgs; [
	  # invincible summer
	  emacs
	  gnupg
	  tmux
    pulsemixer

	  # midst of winter
    brave
  ];

  programs.git = {
	  enable = true;
	  userName = "Aqeel Ahmad Akber";
	  userEmail = "aqeel@aqeelakber.com";
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
