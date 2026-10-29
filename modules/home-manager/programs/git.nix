_: {
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Cameron Yule";
          email = "cameron@cameronyule.com";
        };
        github = {
          user = "cameronyule";
        };
        pull = {
          ff = "only";
        };
      };
      ignores = [".DS_Store"];
      signing = {
        format = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII20sr7+ICMFMmR6NFC2/fhHjE8kESPWchJiJ5l/ds2m";
        signByDefault = true;
        signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
    };
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "*" = {
          IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
        };
      };
    };
  };
}
