# This takes us from host firmware to linux kernel
{ config, pkgs, hostName, inputs, ... }: {
  imports = [
    # this takes us from linux kernel to high level os
    ../../modules/system.nix
    ../../modules/sway.nix

    # hardware scan results
    ./hardware-configuration.nix

    # where discipline is
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking.networkmanager.enable = true;
  networking.hostName = hostName;

  # Virtualisation and Containerisation support
  virtualisation = {
    libvirtd.enable = true;
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    distrobox
    podman-compose
    virt-manager
    qemu
    quickemu
  ];

  system.stateVersion = "24.05";
}
