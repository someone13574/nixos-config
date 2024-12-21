{ lib, config, pkgs, inputs, ... }: {
  home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme".source = inputs.firefox-gnome-theme;
  home.activation = {
    addFirefoxUserContent = lib.hm.dag.entryAfter [ "write-boundary" ] ''
      mkdir -p '${config.home.homeDirectory}/.mozilla/firefox/default/chrome'
      rm -f '${config.home.homeDirectory}/.mozilla/firefox/default/chrome/userContent.css'
      echo '@import "firefox-gnome-theme/userContent.css";' > '${config.home.homeDirectory}/.mozilla/firefox/default/chrome/userContent.css'
    '';
  };

  programs.firefox = {
    enable = true;

    policies = {
      DisableAccounts = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableProfileImport = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "newtab";
      DisplayMenuBar = "default-off";
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = true;
      };
      NoDefaultBookmarks = true;
      SearchBar = "unified";
    };

    profiles.default = {
      name = "Default";
      settings = {
        "mousewheel.system_scroll_override" = true;
      };
      extraConfig = lib.readFile "${inputs.firefox-gnome-theme}/configuration/user.js";
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
      '';
    };
  };
}
