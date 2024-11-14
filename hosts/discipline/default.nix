# This takes us from host firmware to linux kernel
{ config, pkgs, hostName, ... }: {
  imports = [
    # this takes us from linux kernel to high level os
    ../../modules/system.nix
    ../../modules/sway.nix

    # hardware scan results
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking.networkmanager.enable = true;
  networking.hostName = hostName;

  system.stateVersion = "24.05";
}
