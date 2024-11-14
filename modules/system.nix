{pkgs, lib, username, userFullName, userEmail, ...}: {
  # Shells
  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];
  environment.shells = with pkgs; [ zsh ];

  # Users
  users.users.${username} = {
    isNormalUser = true;
    description = userFullName;
    extraGroups = ["networkmanager" "wheel" "video"];
    shell = pkgs.zsh;
  };

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = [username];
  };
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Locale
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
  console = {
    keyMap = "colemak";
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };


  # Printing
  services.printing.enable = false;

  # Sound
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Networking
  programs.nm-applet.enable = false;
  networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = false;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

  # Fonts
  fonts = {
    packages = with pkgs; [
      material-design-icons
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono" "Inconsolata"]; })
    ];
    enableDefaultPackages = false; # set to false for user specified fonts
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  # Security
  security.rtkit.enable = true;
  security.polkit.enable = true;

  # Laptop
  programs.light.enable = true;
  services.power-profiles-daemon = {
    enable = true;
  };

  # Core System Applications
  environment.systemPackages = with pkgs; [
    # text
    git
    vim
    nano
    emacs
    # network
    wget
    curl
    # media
    pulsemixer
    # encryption
    cryptsetup
    tomb
    gfshare
    gnupg
    # monitoring
    sysstat
    lm_sensors
    htop
  ];

}
