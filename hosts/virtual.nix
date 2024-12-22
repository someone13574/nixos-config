{ ... }: {
  networking.hostName = "nixos";

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;

  system.stateVersion = "24.11";
}
