{pkgs, ...}: {

  # Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  # Window Manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      foot # fast wayland term
      grim # wayland screenies
      slurp # wayland select area
      wl-clipboard # wayland cli clipboard
      wl-recorder # wayland screen recording
      mako # wayland notification manager
      i3status # good enough batteries included
      udisks # udisksctl
    ];
  };

  # Desktop Environment
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  services.udisks2.enable = true;

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
