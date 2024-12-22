{ pkgs, ... }: {
  programs.zsh.enable = true;

  users.users.owen = {
    isNormalUser = true;
    extraGroups = [ "docker" "wheel" ];
    initialPassword = "password";
    shell = pkgs.zsh;
  };
}
