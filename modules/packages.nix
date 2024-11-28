{ pkgs, ... }:
{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages =
    [
        pkgs.vim
        pkgs.mkalias
        
        pkgs.python310
        pkgs.python310Packages.virtualenv
        pkgs.python310Packages.pip
        pkgs.poetry
        pkgs.uv

        pkgs.go
        pkgs.delve
        pkgs.rustup

        pkgs.nodejs_20
        pkgs.wasm-pack
        pkgs.wasm-bindgen-cli
        pkgs.mold
        pkgs.lldb
        pkgs.clang
    
        pkgs.openvpn
        pkgs.sshfs
        pkgs.macfuse-stubs 
        pkgs.tree
        pkgs.tmux
        pkgs.btop
        pkgs.wget
        pkgs.google-chrome
        pkgs.iterm2
        pkgs.obsidian
        pkgs.vscode
        pkgs.spotify
        pkgs.zsh-powerlevel10k
    ];
}