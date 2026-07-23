{ ... }:
{
  nixpkgs.overlays = [
    # Workaround for a nixpkgs packaging bug in vscode 1.129.1 on darwin:
    # postPatch chmods node_modules/@vscode/ripgrep-universal/... but the binary
    # actually lives under node_modules.asar.unpacked/. Rewrite just that path in
    # the generated postPatch. Applied via overlay so both the Dock's `pkgs.vscode`
    # (modules/darwin.nix) and home-manager's programs.vscode share one patched
    # derivation. Drop this once nixpkgs fixes the path upstream.
    (final: prev: {
      vscode = prev.vscode.overrideAttrs (old: {
        postPatch = builtins.replaceStrings
          [ "node_modules/@vscode/ripgrep-universal" ]
          [ "node_modules.asar.unpacked/@vscode/ripgrep-universal" ]
          old.postPatch;
      });
    })
  ];
}
