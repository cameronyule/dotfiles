{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    pkgs.aider-chat
  ];

  home.file = {
    # NOTE Aider does not currently support the XDG specification hence `homeDirectory`.
    # See https://github.com/Aider-AI/aider/issues/216
    "${config.home.homeDirectory}/.aider.conf.yml" = {
      text = ''
        # https://github.com/Aider-AI/aider/blob/main/aider/website/assets/sample.aider.conf.yml

        light-mode: true
        code-theme: solarized-light

        attribute-author: false
        attribute-committer: false
        attribute-co-authored-by: false
        git-commit-verify: false
      '';
    };
  };
}
