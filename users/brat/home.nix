{ pkgs, userFullName, userEmail, ... }: {

  imports = [
    ../../home/core.nix
    ../../home/shell
    ../../home/emacs
    ../../home/sway
    ../../home/programs
  ];

  programs.git = {
    enable = true;
    userName = userFullName;
    userEmail = userEmail;
  };
}
