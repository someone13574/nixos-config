{ pkgs, ... }: {
  boot = {
    # Bootloader
    loader.systemd-boot.enable = true;
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
}