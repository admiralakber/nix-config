{ pkgs, userFullName, userEmail, ... }: {

  imports = [
    ../../home/core.nix

  ];

  programs.git = {
    enable = true;
    userName = userFullName;
    userEmail = userEmail;
  };
}
