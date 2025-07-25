{
  home-manager,
  username,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home-manager
  ];

  home-manager = {
    users.${username} = {pkgs, ...}: {
      imports = [
        # keep-sorted start
        ../../modules/home-manager/programs/emacs.nix
        ../../modules/home-manager/programs/fonts.nix
        ../../modules/home-manager/programs/git.nix
        ../../modules/home-manager/programs/shell.nix
        # keep-sorted end
      ];
      home.stateVersion = "24.11";
      home.packages = with pkgs; [
        # keep-sorted start
        # keep-sorted end
      ];
    };
  };

  homebrew = {
    casks = [
      # keep-sorted start
      # NOTE The Dropbox cask is non-functional on this host, so I've installed
      # the package manually. (Their package installer still works.)
      # "dropbox"
      # keep-sorted end
    ];

    masApps = {
      # keep-sorted start
      # keep-sorted end
    };
  };

  system = {
    defaults = {
      dock = {
        persistent-apps = [
          {app = "/Applications/Safari.app";}
          {app = "/System/Applications/Mail.app";}
          {app = "/System/Applications/Calendar.app";}
          {app = "${pkgs.emacs}/Applications/Emacs.app";}
          {app = "/System/Applications/Utilities/Terminal.app";}
          {app = "/Applications/1Password.app";}
          {app = "/System/Applications/Utilities/Activity Monitor.app";}
        ];
      };
    };
  };
}
