{ ... }: {
  imports = [
    ./boot.nix
    ./btrfs.nix
    ./hardware-configuration.nix
  ];

  # Networking
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Locales
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";
}