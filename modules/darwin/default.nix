{
  pkgs,
  inputs,
  username,
  hostname,
  ...
}:

{
  # Entrypoint for nix-darwin configuration.
  # https://nix-darwin.github.io/nix-darwin/manual/

  # Declare the user that will be running `nix-darwin`.
  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
  };

  networking.hostName = hostname;
  networking.computerName = hostname;

  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;

    # https://github.com/nix-darwin/nix-darwin/blob/b9b927dd1f24094b271e8ec5277a672dc4fc860d/CHANGELOG#L11
    primaryUser = "${username}";

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
            app = "/System/Applications/Mail.app";
          }
          {
            app = "/System/Applications/Calendar.app";
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
        # TODO https://github.com/nix-darwin/nix-darwin/issues/1111#issuecomment-2575999820
        # "com.apple.Safari" = {
        #   ShowOverlayStatusBar = true;
        # };

        "com.knollsoft.Rectangle" = {
          "gapSize" = 15;
          "launchOnLogin" = 1;
        };

        "com.mysticalbits.lookaway" = {
          "focusTime" = 1800; # focus duration between breaks (seconds)
          "breakTime" = 20; # duration of a 'short' break (seconds)
          "longBreakThreshold" = 3; # count of 'short' breaks before a 'long' break
          "longBreakTime" = 60; # duration of a 'long' break (seconds)
          "postureReminderEnabled" = 0; # disable posture reminders
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

    # Enable macOS Screen Sharing
    # https://github.com/nix-darwin/nix-darwin/issues/797
    activationScripts.extraActivation.text = ''
    if [[ ! $(launchctl print system/com.apple.screensharing 2>/dev/null) ]]; then
       defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.screensharing \
         -dict Disabled -bool false
       launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
    fi
    '';
  };
}
