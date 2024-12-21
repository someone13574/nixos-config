{ config, inputs, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    adw-gtk3
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.rounded-window-corners-reborn
  ];

  home.file."${config.xdg.dataHome}/icons/Skeuowaita".source = inputs.skeuowaita-icon-theme;

  dconf = {
    settings = {
      "org/gnome/nautilus/icon-view".default-zoom-level = "small-plus";
      "org/gtk/settings/file-chooser".clock-format = "12h";
      "org/gnome/desktop/interface" = {
        clock-format = "12h";
        color-scheme = "prefer-dark";
        gtk-theme = "adw-gtk3-dark";
      };
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
        picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.jxl";
        primary-color = "#000000";
        secondary-color = "#000000";
      };
      "org/gnome/desktop/screensaver" = {
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
        primary-color = "#000000";
        secondary-color = "#000000";
      };
      "org/gnome/desktop/interface".icon-theme = "Skeuowaita";
      "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
      "org/gnome/desktop/peripherals/keyboard".delay = lib.hm.gvariant.mkUint32 300;
      "org/gnome/desktop/wm/keybindings".close = [ "<Alt>q" ];
      "org/gnome/mutter" = {
        edge-tiling = true;
        dynamic-workspaces = true;
        workspaces-only-on-primary = true;
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [ "rounded-window-corners@fxgn" "AlphabeticalAppGrid@stuarthayhurst" ];
        favorite-apps = [ "firefox.desktop" "org.gnome.Nautilus.desktop" "code.desktop" "org.gnome.Settings.desktop" "org.gnome.Console.desktop" ];
      };
    };
  };
}