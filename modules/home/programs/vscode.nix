{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}