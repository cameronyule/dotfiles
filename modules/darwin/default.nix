{
  pkgs,
  inputs,
  ...
}:

{
  # Entrypoint for nix-darwin configuration.
  # https://nix-darwin.github.io/nix-darwin/manual/

  # Declare the user that will be running `nix-darwin`.
  users.users.cameronyule = {
    name = "cameronyule";
    home = "/Users/cameronyule";
  };

  # https://github.com/nix-darwin/nix-darwin/blob/43975d782b418ebf4969e9ccba82466728c2851b/modules/services/karabiner-elements/default.nix
  # services = {
  #   karabiner-elements.enable = false;
  # };

  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;

    # https://nix-darwin.github.io/nix-darwin/manual/index.html
    # https://macos-defaults.com
    defaults = {
      ActivityMonitor = {
        # Show CPU Usage in the dock icon
        IconType = 5;
        # Show all processes
        ShowCategory = 100;
      };
      dock = {
        autohide = true;
        persistent-apps = [
          {
            app = "/System/Cryptexes/App/System/Applications/Safari.app";
          }
          {
            app = "${pkgs.emacs}/Applications/Emacs.app";
          }
          {
            app = "/Applications/Ghostty.app";
          }
          {
            app = "/Applications/1Password.app";
          }
          {
            app = "/System/Applications/Utilities/Activity Monitor.app";
          }
        ];
        show-recents = false;
      };
      finder = {
        FXPreferredViewStyle = "clmv";
        NewWindowTarget = "Home";
        ShowPathbar = true;
      };
      NSGlobalDomain = {
        AppleKeyboardUIMode = 3;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
      };

      CustomUserPreferences = {
        # https://www.reddit.com/r/MacOSBeta/comments/1dsbdf0/comment/lb2s1q4/
        # https://gist.github.com/David-Elizondo/45d95701c65551427be707fa991d9716
        # https://apple.stackexchange.com/questions/87619/where-are-keyboard-shortcuts-stored-for-backup-and-sync-purposes
        # NSGlobalDomain = {
        #   NSUserKeyEquivalents = {
        #     "Left" = "@$\\U2190";
        #     "Right" = "@$\\U2192";
        #   };
        # };

        # TODO https://github.com/nix-darwin/nix-darwin/issues/1111#issuecomment-2575999820
        # "com.apple.Safari" = {
        #   ShowOverlayStatusBar = true;
        # };

        # TODO https://gist.github.com/avillafiorita/9e626ce370e1da6c6373
        # "com.apple.Terminal" = {
        #   "Default Window Settings" = "Basic";
        #   "Startup Window Settings" = "Basic";
        # };

        "com.knollsoft.Rectangle" = {
          "gapSize" = 15;
          "launchOnLogin" = 1;
        };

        "com.mysticalbits.lookaway" = {
          "longBreakTime" = 60;
        };
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
      userKeyMapping =
        let
          lcmd = 30064771299; # 0x7000000e3
          lopt = 30064771298; # 0x7000000e2
        in
        [
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
