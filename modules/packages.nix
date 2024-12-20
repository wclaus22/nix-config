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
	
	pkgs.wasm-pack
        pkgs.wasm-bindgen-cli
	
	(pkgs.yarn.override {
          nodejs = null;
        })
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
        pkgs.spotify
        pkgs.zsh-powerlevel10k
    ];
}
