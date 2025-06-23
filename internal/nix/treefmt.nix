_: {
  projectRootFile = "flake.nix";

  programs = {
    # keep-sorted start block=yes
    alejandra = {
      enable = true;
      priority = 4;
    };
    deadnix = {
      enable = true;
      excludes = [
        "flake.nix"
      ];
      priority = 0;
    };
    keep-sorted = {
      enable = true;
      priority = 3;
    };
    statix = {
      enable = true;
      priority = 1;
    };
    # keep-sorted end
  };

  settings = {
    allow-missing-formatter = false;
    on-unmatched = "fatal";
    verbose = 2;
    global.excludes = [
      ".editorconfig"
    ];
  };
}
