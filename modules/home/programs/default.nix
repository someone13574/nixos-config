{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./git.nix
    ./vscode.nix
    ./zsh.nix
  ];
  
  home.packages = with pkgs; [
    obsidian
    zed-editor
  ];

  home.sessionVariables = {
    ZED_ALLOW_EMULATED_GPU = 1;
  };
}