{ config, pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    initContent = pkgs.lib.mkBefore
      ''
      cat /home/brat/.cache/wal/sequences
    . "$HOME/.cargo/env"
      '';
    initExtra =
    ''
    '';
    shellAliases = {
      update = "cd /etc/nixos && nix flake update && sudo nixos-rebuild switch && cd -";
      restic = "AWS_SECRET_ACCESS_KEY=$(pass personal/B2_SECRET_ACCESS_KEY) AWS_ACCESS_KEY_ID=$(pass personal/B2_ACCESS_KEY_ID) RESTIC_PASSWORD=$(pass personal/RESTIC_PASSWORD) RESTIC_REPOSITORY=$(pass personal/RESTIC_REPOSITORY) restic";
      backup = "restic --exclude-if-present '.nobackup' backup";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "pass" "direnv" ];
      theme = "darkblood";
    };
  };

}
