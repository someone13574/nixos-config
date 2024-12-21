{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
      garbage = "sudo nix-collect-garbage -d";
    };

    oh-my-zsh = {
      enable = true;
      theme = "essembeh";
    };
  };
}