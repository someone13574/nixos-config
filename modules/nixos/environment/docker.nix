{ config, inputs, pkgs, ... }: {
  # Enable Docker
  virtualisation.docker.enable = true;

  # Add the container
  virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers.WinApps = {
    image = "ghcr.io/dockur/windows:latest";
    extraOptions = [ "--privileged" ];
    ports = [
      "8006:8006"
      "3389:3389"
    ];
    volumes = [
      "data:/storage"
      "${config.users.users.owen.home}:/shared"
    ];
    environment = {
      VERSION = "11";
      RAM_SIZE = "4G";
      CPU_CORES = "4";
      DISK_SIZE = "64G";
      USERNAME = "Docker";
      PASSWORD = "password";
    };
  };
}