{ pkgs, ... }: {
  # Enable Gnome and GDM
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Remove packages
  services.xserver.excludePackages = [ pkgs.xterm ];
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    yelp
    gnome-music
    geary
    simple-scan
    gnome-connections
    gnome-contacts
    gnome-system-monitor
  ];

  # Add packages
  environment.systemPackages = with pkgs; [
    dconf-editor
    resources
    snapper-gui
  ];

  # Disable NixOS logo on login-screen
  programs.dconf.enable = true;
  programs.dconf.profiles.gdm.databases = [
    {
      settings."org/gnome/login-screen".logo = "";
    }
  ];
}