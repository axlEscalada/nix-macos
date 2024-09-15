{
  pkgs,
  nixvim,
  zls-flake,
  ...
}: {
  imports = [
    ./programs
  ];
  home = {
    stateVersion = "23.11";
    username = "axel.escalada";
    homeDirectory = "/Users/axel.escalada";
    packages = with pkgs; [
      bun
      wget
      zls-flake.packages.${pkgs.system}.zls
      zigpkgs.master
      libllvm
      libclang
      clang
      nixvim.packages.${pkgs.system}.default
      git
      obsidian
      zellij
    ];
  };
  xdg.enable = true;
  programs.home-manager.enable = true;
  programs.fish.enable = true;
}
