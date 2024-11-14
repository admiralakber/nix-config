{ config, lib, pkgs, ... }:

{
  users.users.brat = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB+/HfuySXO9jga3DhI+Wc1Te+SGuUwUa4TvykT1VsTS aqeel@empathy"
    ];
  };
}
