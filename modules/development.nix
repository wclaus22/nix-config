{pkgs, ...}: {
  imports = [
  ];
 
  home.packages = with pkgs; [
    nodejs_20
   
    python310
    poetry
 
    go-mockery
 
    rustup
    wasm-pack
    wasm-bindgen-cli
    mold
    lldb
    clang
  ];
 
  programs = {
    go = {
      enable = true;
    };
  };
}
