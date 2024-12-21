{ ... }: {
  programs.git = {
    enable = true;
    userName = "Owen Law";
    userEmail = "owenlaw222@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };
}