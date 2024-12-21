{ ... }: {
  imports = [
    ./boot.nix
    ./btrfs.nix
    ./hardware-configuration.nix
  ];

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Locales
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";
}