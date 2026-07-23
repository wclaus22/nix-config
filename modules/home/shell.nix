{ config, ... }:
{
  # Environment variables (migrated from the old ~/.zshrc).
  home.sessionVariables = {
    NVM_DIR = "${config.home.homeDirectory}/.nvm";
    JAVA_HOME = "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home";
    BUN_INSTALL = "${config.home.homeDirectory}/.bun";
  };

  # Extra PATH entries (migrated from the old ~/.zshrc), highest priority first.
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "/opt/homebrew/bin"
    "/opt/homebrew/opt/openjdk@17/bin"
    "/Library/TeX/texbin"
    "/usr/local/texlive/2025/bin/universal-darwin"
    "${config.home.homeDirectory}/.bun/bin"
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreAllDups = true;
      share = true;
      extended = true;
    };

    shellAliases = {
      # navigation
      ".." = "cd ..";
      "..." = "cd ../..";

      # ls / grep (BSD/macOS flags: -G colorizes, not GNU --color)
      ll = "ls -lhG";
      la = "ls -lhaG";
      grep = "grep --color=auto";

      # git
      gs = "git status";
      gd = "git diff";
      gl = "git log --oneline --graph --decorate";

      # tools
      cc = "claude --dangerously-skip-permissions";
      nvmload = "source $NVM_DIR/nvm.sh";
    };

    initContent = ''
      bindkey '^f' autosuggest-accept

      # Machine-local secrets — untracked, never managed by nix. See secrets.zsh.
      [ -f "$HOME/.config/zsh/secrets.zsh" ] && source "$HOME/.config/zsh/secrets.zsh"

      # Tool completions.
      command -v uv >/dev/null && eval "$(uv generate-shell-completion zsh)"
      [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };
      cmd_duration.format = "[$duration]($style) ";
    };
  };
}
