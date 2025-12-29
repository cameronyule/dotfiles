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
    difftastic = {
      enable = true;
      git = {
        enable = true;
        diffToolMode = true;
      };
      options = {
        display = "inline";
      };
    };
    ssh = {
      enable = true;
      matchBlocks = {
        "*".extraOptions = {
          # https://developer.1password.com/docs/ssh/get-started/#step-4-configure-your-ssh-or-git-client
          identityAgent = ''"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"'';
        };
      };
    };
  };
}
