_: {
  programs = {
    git = {
      enable = true;
      userName = "Cameron Yule";
      userEmail = "cameron@cameronyule.com";
      ignores = [".DS_Store"];
      signing = {
        format = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII20sr7+ICMFMmR6NFC2/fhHjE8kESPWchJiJ5l/ds2m";
        signByDefault = true;
        signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      extraConfig = {
        github = {
          user = "cameronyule";
        };
        pull = {
          ff = "only";
        };
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
