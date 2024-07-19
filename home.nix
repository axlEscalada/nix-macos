{
  pkgs,
  nixvim,
  ...
}: {
  imports = [
    ./programs
  ];
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "axel.escalada";
    homeDirectory = "/Users/axel.escalada";
    packages = with pkgs; [
      # zigpkgs."0.13.0"
      libllvm
      libclang
      clang
      nixvim.packages.${pkgs.system}.default
      git
      kotlin-native
    ];
  };
  xdg.enable = true;
  programs.home-manager.enable = true;
  programs.fish.enable = true;
}
