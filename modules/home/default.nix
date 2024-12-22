{ ... }: {
  imports = [
    ./environment
    ./programs
  ];

  home.username = "owen";
  home.homeDirectory = "/home/owen";

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
