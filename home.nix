{
  pkgs,
  nixvim,
  ...
}: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "axel.escalada";
    homeDirectory = "/Users/axel.escalada";
    packages = [
      nixvim.packages.${pkgs.system}.default
      pkgs.git
      pkgs.kotlin-native
    ];
  };
  xdg.enable = true;
  programs.home-manager.enable = true;
  programs.fish.enable = true;
}
