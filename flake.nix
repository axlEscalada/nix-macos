{
  description = "Axel's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:axlEscalada/nixvim";
    zig.url = "github:mitchellh/zig-overlay";
    zls-flake = {
      url = "github:zigtools/zls";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.zig-overlay.follows = "zig";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , home-manager
    , nixvim
    , zls-flake
    , ...
    } @ inputs:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
            "obsidian"
          ];
        };
        overlays = [
          inputs.zig.overlays.default
          # (final: prev: {
          #   zls = zls-flake.packages.${system}.default;
          # })
        ];
      };
    in
    {
      homeConfigurations = {
        "axel.escalada" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
          extraSpecialArgs = {
            inherit nixvim zls-flake;
          };
        };
      };
    };
}
