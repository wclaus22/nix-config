{pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        gitlab.gitlab-workflow
        humao.rest-client
        ms-vscode-remote.remote-containers
        ms-vsliveshare.vsliveshare
        streetsidesoftware.code-spell-checker
        usernamehw.errorlens
        dbaeumer.vscode-eslint
        vadimcn.vscode-lldb
        bbenoist.nix
        ms-python.black-formatter
        ms-python.python
        github.copilot
        github.copilot-chat
        golang.go
        ms-toolsai.jupyter
        zainchen.json
        ms-python.vscode-pylance
        ms-python.pylint
        ms-python.debugpy
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        #ms-vscode.remote-server
        #ms-vscode.remote-explorer
        rust-lang.rust-analyzer
        vscode-icons-team.vscode-icons
        redhat.vscode-yaml
        octref.vetur
        vue.volar
        #vuetifyjs.vuetify-vscode
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-filesize";
          publisher = "mkxml";
          version = "3.2.1";
          sha256 = "sha256-xy/JTtGfT5Kc6tDQzQCgTGib7TqJY/g7ix8FDbMJiH8=";
        }
      ];
    })
  ];
}
# {
#   programs.vscode = {
#     enable = true;
#     enableUpdateCheck = false;
#     mutableExtensionsDir = false;
#     enableExtensionUpdateCheck = false;
#     extensions = with pkgs.vscode-extensions;
#       [
          # gitlab.gitlab-workflow
          # humao.rest-client
          # ms-vscode-remote.remote-containers
          # ms-vsliveshare.vsliveshare
          # streetsidesoftware.code-spell-checker
          # usernamehw.errorlens
          # dbaeumer.vscode-eslint
          # vadimcn.vscode-lldb
          # bbenoist.nix
          # ms-python.black-formatter
          # ms-python.python
          # mkxml.vscode-filesize
          # github.copilot
          # github.copilot-chat
          # golang.go
          # ms-toolsai.jupyter
          # zainchen.json
          # ms-python.vscode-pylance
          # ms-python.pylint
          # ms-python.debugpy
          # ms-vscode-remote.remote-ssh
          # ms-vscode-remote.remote-ssh-edit
          # ms-vscode.remote-server
          # ms-vscode.remote-explorer
          # rust-lang.rust-analyzer
          # vscode-icons-team.vscode-icons
          # redhat.vscode-yaml
          # octref.vetur
          # vue.volar
          # vuetifyjs.vuetify-vscode
#       ];
#     userSettings = {
#       "[json]" = {
#         "editor.defaultFormatter" = "vscode.json-language-features";
#       };
#       "[jsonc]" = {
#         "editor.defaultFormatter" = "vscode.json-language-features";
#       };
#       "[vue]" = {
#         "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
#       };
#       "[typescript]" = {
#         "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
#       };
#       "[javascript]" = {
#         "editor.defaultFormatter" = "vscode.typescript-language-features";
#       };
#       "[javascript][typescript][vue]" = {
#         "editor.codeActionsOnSave" = {
#           "source.organizeImports" = "never";
#           "source.fixAll" = "explicit";
#           "source.fixAll.eslint" = "explicit";
#         };
#       };
#       "workbench.iconTheme" = "vscode-icons";
#       "workbench.colorTheme" = "Default Dark+";
#       "explorer.confirmDelete" = false;
#       "explorer.confirmDragAndDrop" = false;
#       "editor.inlineSuggest.enabled" = true;
#       "redhat.telemetry.enabled" = false;
#       "jupyter.askForKernelRestart" = false;
#       "github.copilot.editor.enableAutoCompletions" = true;
#       "pylint.args" = [
#         "--disable=E0015,E1101"
#       ];
#       "github.copilot.enable" = {
#         "*" = true;
#         "plaintext" = false;
#         "markdown" = false;
#         "scminput" = false;
#       };
#       "[python]" = {
#         "editor.defaultFormatter" = "ms-python.black-formatter";
#       };
#       "editor.codeActionsOnSave" = {
#         "source.fixAll" = "explicit";
#         "source.fixAll.eslint" = "explicit";
#       };
#       "editor.formatOnSave" = true;
#       "eslint.format.enable" = true;
#       "eslint.validate" = [
#         "javascript"
#         "typescript"
#         "javascriptreact"
#         "vue"
#       ];
#       "eslint.workingDirectories" = [
#         {
#           "mode" = "auto";
#         }
#       ];
#       "eslint.lintTask.enable" = true;
#       "editor.fontLigatures" = true;
#       "editor.bracketPairColorization.enabled" = true;
#       "git.autofetch" = true;
#       "git.enableSmartCommit" = true;
#       "git.mergeEditor" = true;
#       "liveshare.authenticationProvider" = "Microsoft";
#       "terminal.integrated.inheritEnv" = false;
#       "typescript.updateImportsOnFileMove.enabled" = "always";
#       "javascript.updateImportsOnFileMove.enabled" = "always";
#       "liveshare.launcherClient" = "visualStudioCode";
#       "settingsSync.ignoredExtensions" = [
#         "ms-vsliveshare.vsliveshare"
#       ];
#       "errorLens.excludeBySource" = [
#         "cSpell"
#       ];
#       "banner-comments.h1" = "Standard";
#       "editor.renderWhitespace" = "trailing";
#       "workbench.editor.empty.hint" = "hidden";
#       "workbench.startupEditor" = "none";
#       "vim.leader" = "<space>";
#     };
#   };
# }
