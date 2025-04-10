{ pkgs, inputs, ... }:

{
  # Declare the user that will be running `nix-darwin`.
  users.users.cameronyule = {
    name = "cameronyule";
    home = "/Users/cameronyule";
  };

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
            app = "/System/Applications/Utilities/Terminal.app";
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

      # TODO: https://github.com/nix-darwin/nix-darwin/issues/1111#issuecomment-2575999820
      # CustomUserPreferences = {
      #   "com.apple.Safari" = {
      #     pShowOverlayStatusBar = true;
      #   };
      # };
    };

    # https://daiderd.com/nix-darwin/manual/index.html#opt-system.keyboard.enableKeyMapping
    # https://githug.xyz/xenia/home/src/branch/main/darwin.nix#L63
    # TODO: Limit the key mapping to a specific keyboard/device (e.g., my CTRL keyboard)
    # hidutil list --matching '{"ProductID":0x9,"VendorID":0x359b,"Product":"CTRL v2"}'
    keyboard = {
      enableKeyMapping = true;

      # https://developer.apple.com/library/archive/technotes/tn2450/_index.html
      userKeyMapping = let
        lcmd   = 30064771299; # 0x7000000e3
        lopt   = 30064771298; # 0x7000000e2
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
