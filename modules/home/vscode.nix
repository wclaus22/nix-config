{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    # package defaults to pkgs.vscode (patched by the overlay in modules/overlays.nix).

    # Let extensions installed/updated through the VS Code UI (and the claude CLI)
    # coexist with the nix-declared set below, instead of a locked read-only dir.
    mutableExtensionsDir = true;

    # Declarative core. Everything else (gitlens, latex-workshop, jupyter extras,
    # datawrangler, anthropic.claude-code, ...) stays UI-managed and self-updating.
    # settings.json / keybindings.json are intentionally left unmanaged (mutable).
    profiles.default.extensions =
      (with pkgs.vscode-extensions; [
        gitlab.gitlab-workflow
        humao.rest-client
        ms-vscode-remote.remote-containers
        ms-vsliveshare.vsliveshare
        streetsidesoftware.code-spell-checker
        usernamehw.errorlens
        vadimcn.vscode-lldb
        bbenoist.nix
        ms-python.python
        ms-python.vscode-pylance
        ms-python.debugpy
        charliermarsh.ruff
        github.copilot
        github.copilot-chat
        golang.go
        ms-toolsai.jupyter
        zainchen.json
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        rust-lang.rust-analyzer
        vscode-icons-team.vscode-icons
        redhat.vscode-yaml
      ])
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-filesize";
          publisher = "mkxml";
          version = "3.2.1";
          sha256 = "sha256-xy/JTtGfT5Kc6tDQzQCgTGib7TqJY/g7ix8FDbMJiH8=";
        }
      ];
  };
}
