{ config, lib, pkgs, ... }:

{
  users.users.brat = {
    isNormalUser = true;
    home = "/home/brat";
    group = "users";
    extraGroups = [
      "wheel"
      "podman"
      "libvirtd"
    ];
    subUidRanges = [
      { startUid = 100000; count = 65536; }
    ];
    subGidRanges = [
      { startGid = 100000; count = 65536; }
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB+/HfuySXO9jga3DhI+Wc1Te+SGuUwUa4TvykT1VsTS aqeel@empathy"
    ];
  };
}
