{
  self,
  username,
  ...
}: {
  # Declare the user that will be running `nix-darwin`.
  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
  };

  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

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
      };
    };
  };
}
