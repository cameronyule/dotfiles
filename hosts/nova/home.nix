{home-manager, username, pkgs, ... }:
{
  imports = [
    ../../modules/home-manager
  ];

  home-manager = {
    users.${username} = { pkgs, ... }: {
      imports = [
        ../../modules/home-manager/programs/emacs.nix
        ../../modules/home-manager/programs/fonts.nix
        ../../modules/home-manager/programs/git.nix
        ../../modules/home-manager/programs/shell.nix
      ];
      home.stateVersion = "24.11";
      home.packages  = with pkgs; [

      ];
    };
  };

  homebrew = {
    casks = [
      # NOTE The Dropbox cask is non-functional on this host, so I've installed
      # the package manually. (Their package installer still works.)
      # "dropbox"
    ];

    masApps = {

    };
  };

  system = {
    defaults = {
      dock = {
        persistent-apps = [
          { app = "/Applications/Safari.app"; }
          { app = "/System/Applications/Mail.app"; }
          { app = "/System/Applications/Calendar.app"; }
          { app = "${pkgs.emacs}/Applications/Emacs.app"; }
          { app = "/System/Applications/Utilities/Terminal.app"; }
          { app = "/Applications/1Password.app"; }
          { app = "/System/Applications/Utilities/Activity Monitor.app"; }
        ];
      };
    };
  };
}
