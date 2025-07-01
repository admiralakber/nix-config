{ username, ... }: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    extraOutputsToInstall = [ "dev" ];
  };

  programs.home-manager.enable = true;
}
