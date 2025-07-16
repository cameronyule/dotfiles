{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home-manager
  ];

  home-manager = {
    users.${username} = {pkgs, ...}: {
      imports = [
        # keep-sorted start
        ../../modules/home-manager/programs/aider.nix
        ../../modules/home-manager/programs/emacs.nix
        ../../modules/home-manager/programs/fonts.nix
        ../../modules/home-manager/programs/ghostty.nix
        ../../modules/home-manager/programs/git.nix
        ../../modules/home-manager/programs/shell.nix
        # keep-sorted end
      ];
      home.packages = with pkgs; [
        # keep-sorted start
        ice-bar
        rectangle
        signal-desktop-bin
        spotify
        zoom-us
        # keep-sorted end
      ];
      home.stateVersion = "24.11";
    };
  };

  homebrew = {
    # TODO Migrate to Nix packages where possible.
    casks = [
      # keep-sorted start
      "1password" # https://github.com/NixOS/nixpkgs/issues/254944
      "1password-cli"
      "dropbox"
      "ghostty" # https://github.com/NixOS/nixpkgs/issues/388984#issuecomment-2715508998
      "little-snitch"
      "lookaway"
      "meetingbar"
      # keep-sorted end
    ];

    masApps = {
      # keep-sorted start
      "1Password for Safari" = 1569813296;
      "AdGuard for Safari" = 1440147259;
      "Pins for Pinboard" = 1547106997;
      Headspace = 493145008;
      WhatsApp = 310633997;
      Xcode = 497799835;
      # keep-sorted end
    };
  };

  system = {
    defaults = {
      CustomUserPreferences = {
        "com.knollsoft.Rectangle" = {
          "gapSize" = 15;
          "hideMenubarIcon" = 0;
          "launchOnLogin" = 1;
        };

        "com.mysticalbits.lookaway" = {
          "focusTime" = 1800; # focus duration between breaks (seconds)
          "breakTime" = 20; # duration of a 'short' break (seconds)
          "longBreakThreshold" = 3; # count of 'short' breaks before a 'long' break
          "longBreakTime" = 60; # duration of a 'long' break (seconds)
          "postureReminderEnabled" = 0; # disable posture reminders
        };

        # https://github.com/pstadler/keybase-gpg-github/issues/19#issuecomment-1096733733
        "org.gpgtools.pinentry-mac" = {
          "DisableKeychain" = false;
        };
      };
      dock = {
        persistent-apps = [
          {app = "/System/Cryptexes/App/System/Applications/Safari.app";}
          {app = "/System/Applications/Mail.app";}
          {app = "/System/Applications/Calendar.app";}
          {app = "${pkgs.emacs}/Applications/Emacs.app";}
          {app = "/Applications/Ghostty.app";}
          {app = "/Applications/1Password.app";}
          {app = "/System/Applications/Utilities/Activity Monitor.app";}
        ];
      };
    };

    # https://daiderd.com/nix-darwin/manual/index.html#opt-system.keyboard.enableKeyMapping
    # https://githug.xyz/xenia/home/src/branch/main/darwin.nix#L63
    # TODO: Limit the key mapping to a specific keyboard/device (e.g., my CTRL keyboard)
    # hidutil list --matching '{"ProductID":0x9,"VendorID":0x359b,"Product":"CTRL v2"}'
    # https://drop.com/talk/9382/how-to-configure-your-drop-keyboard
    keyboard = {
      enableKeyMapping = true;

      # https://developer.apple.com/library/archive/technotes/tn2450/_index.html
      userKeyMapping = let
        lcmd = 30064771299; # 0x7000000e3
        lopt = 30064771298; # 0x7000000e2
      in [
        {
          HIDKeyboardModifierMappingSrc = lcmd;
          HIDKeyboardModifierMappingDst = lopt;
        }
        {
          HIDKeyboardModifierMappingSrc = lopt;
          HIDKeyboardModifierMappingDst = lcmd;
        }
      ];
    };
  };
}
