{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flatpaks.url = "github:GermanBread/declarative-flatpak/stable-v3";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

    solaar.url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
    solaar.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    firefox-gnome-theme = { url = "github:rafaelmardojai/firefox-gnome-theme"; flake = false; };
    thunderbird-gnome-theme = { url = "github:rafaelmardojai/thunderbird-gnome-theme"; flake = false; };
    skeuowaita-icon-theme = { url = "github:RusticBard/Skeuowaita"; flake = false; };
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
  };

  outputs = inputs@{ nixpkgs, home-manager, flatpaks, solaar, nix-index-database, ... }:
    let
      commonModules = [
        modules/nixos
        flatpaks.nixosModules.declarative-flatpak
        solaar.nixosModules.default
        nix-index-database.nixosModules.nix-index
        inputs.distro-grub-themes.nixosModules.x86_64-linux.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.owen = import modules/home;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        modules = commonModules ++ [ hosts/virtual.nix ];
      };

      nixosConfigurations.owen-thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        modules = commonModules ++ [ hosts/thinkpad.nix ];
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
