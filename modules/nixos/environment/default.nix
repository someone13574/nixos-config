{ inputs, pkgs, ... }: {
  imports = [
    ./desktop.nix
    ./flatpak.nix
    ./sound.nix
    ./users.nix
  ];

  services.printing.enable = true;
  services.solaar.enable = true;
  programs.nix-index-database.comma.enable = true;

  nixpkgs.overlays = [
    inputs.rust-overlay.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    btop
    cmake
    gcc
    git
    gnumake
    mailutils
    meson
    neofetch
    rust-bin.stable.latest.default
    tree
    vim
    wget
  ];
}
