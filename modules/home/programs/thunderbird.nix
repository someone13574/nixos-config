{ lib, config, inputs, ... }: {
  home.file.".thunderbird/default/chrome/thunderbird-gnome-theme".source = inputs.thunderbird-gnome-theme;
  home.activation = {
    addThunderbirdUserContent = lib.hm.dag.entryAfter [ "write-boundary" ] ''
      mkdir -p '${config.home.homeDirectory}/.thunderbird/default/chrome'
      rm -f '${config.home.homeDirectory}/.thunderbird/default/chrome/userContent.css'
      echo '@import "thunderbird-gnome-theme/userContent.css";' > '${config.home.homeDirectory}/.thunderbird/default/chrome/userContent.css'
    '';
  };

  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
      extraConfig = lib.readFile "${inputs.thunderbird-gnome-theme}/configuration/user.js";
      userChrome = ''
        @import "thunderbird-gnome-theme/userChrome.css";
      '';
    };
  };

  accounts.email.accounts = {
    "owenlaw222@gmail.com" = {
      realName = "Owen Law";
      userName = "owenlaw222@gmail.com";
      address = "owenlaw222@gmail.com";
      imap = {
        host = "imap.gmail.com";
        port = 993;
      };
      thunderbird = {
        enable = true;
        profiles = [ "default" ];
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
        };
      };
    };
    "owen.law@icloud.com" = {
      realName = "Owen Law";
      userName = "owen.law";
      address = "owen.law@icloud.com";
      imap = {
        host = "imap.mail.me.com";
        port = 993;
      };
      thunderbird = {
        enable = true;
        profiles = [ "default" ];
      };
    };
    "owenlaw@cmail.carleton.ca" = {
      primary = true;
      realName = "Owen Law";
      userName = "owenlaw@cmail.carleton.ca";
      address = "owenlaw@cmail.carleton.ca";
      imap = {
        host = "outlook.office365.com";
        port = 993;
      };
      thunderbird = {
        enable = true;
        profiles = [ "default" ];
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
        };
      };
    };
  };
}
