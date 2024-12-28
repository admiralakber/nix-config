{ config, ... }: {

  imports = [
    ./zsh.nix
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "brave";
    TERMINAL = "foot";
    TERM = "xterm-256color";
  };

}
