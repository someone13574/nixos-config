{ pkgs, ... }: {
  boot = {
    # Bootloader
    loader.systemd-boot.enable = false;
    loader.grub.enable = true;
    loader.grub.devices = [ "nodev" ];
    loader.grub.configurationLimit = 10;
    loader.grub.efiSupport = true;
    loader.grub.extraEntries = ''
        menuentry "Reboot" {
            reboot
        }
        menuentry "Poweroff" {
            halt
        }
    '';
    loader.efi.canTouchEfiVariables = true;

    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;

    # Silent boot
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    # Plymouth
    plymouth = {
      enable = true;
      theme = "spinner";
      logo = data/empty.png;
    };
  };

  # Grub theme
  distro-grub-themes = {
    enable = true;
    theme = "nixos";
  };
}