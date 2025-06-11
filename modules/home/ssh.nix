{ config, pkgs, ... }:
{
  programs = {
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
