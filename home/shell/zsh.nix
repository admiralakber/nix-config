{ config, pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      restic = "AWS_SECRET_ACCESS_KEY=$(pass personal/B2_SECRET_ACCESS_KEY) AWS_ACCESS_KEY_ID=$(pass personal/B2_ACCESS_KEY_ID) RESTIC_PASSWORD=$(pass personal/RESTIC_PASSWORD) RESTIC_REPOSITORY=$(pass personal/RESTIC_REPOSITORY) restic";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "pass" "direnv" ];
      theme = "darkblood";
    };
  };

}
