{ username, config, ... }: {

  imports = [
    ./zsh.nix
  ];


  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "brave";
    TERMINAL = "foot";
    TERM = "xterm-256color";
    PKG_CONFIG_PATH =
      "/etc/profiles/per-user/${username}/lib/pkgconfig:/etc/profiles/per-user/${username}/share/pkgconfig";

  };

  home.file.".config/foot/foot.ini".source = ./foot.ini;

}
