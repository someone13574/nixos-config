{ config, inputs, pkgs, ... }: {
  home.packages = [
    pkgs.freerdp3
    inputs.winapps.packages.x86_64-linux.winapps
    inputs.winapps.packages.x86_64-linux.winapps-launcher
  ];

  home.file."${config.xdg.configHome}/winapps/winapps.conf".text = ''
    RDP_USER="Docker"
    RDP_PASS="password"

    WAFLAVOR="docker"
    RDP_SCALE="100"
  '';
}