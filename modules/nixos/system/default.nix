{ lib, ... }: {
  imports = [
    ./boot.nix
    ./btrfs.nix
    ./filesystems.nix
  ];

  # Networking
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Locales
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";
}
