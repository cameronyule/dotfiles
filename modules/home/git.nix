{ config, pkgs, ... }:
{
  programs = {
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.git.enable
    git = {
      enable = true;
      userName = "Cameron Yule";
      userEmail = "cameron@cameronyule.com";
      ignores = [ ".DS_Store" ];
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
      };
    };
  };
}
