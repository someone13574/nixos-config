{ pkgs, ... }: {
  programs.zsh.enable = true;

  users.users.owen = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "password";
    shell = pkgs.zsh;
  };
}