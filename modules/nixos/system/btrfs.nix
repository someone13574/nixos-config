{ ... }: {
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  services.snapper = {
    snapshotInterval = "hourly";
    cleanupInterval = "1d";
    configs.home = {
      SUBVOLUME = "/home";
      TIMELINE_CREATE = true;
      TIMELINE_CLEANUP = true;
      TIMELINE_LIMIT_HOURLY = "12";
      TIMELINE_LIMIT_DAILY = "7";
      TIMELINE_LIMIT_WEEKLY = "0";
      TIMELINE_LIMIT_MONTHLY = "3";
      TIMELINE_LIMIT_YEARLY = "1";
      ALLOW_USERS = [ "owen" ];
    };
  };
}