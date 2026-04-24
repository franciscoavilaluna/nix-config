{
  description = "Stable Hyprland Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles-nvim = { url = "path:/home/pacosmosis/dotfiles/nvim"; flake = false; };
  };

  outputs = { self, nixpkgs, home-manager, dotfiles-nvim, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.keren = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.pacosmosis = import ./home.nix;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };

    # Entorno de desarrollo para AGS y compilación de tipos
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        ags
        astal
        nodejs_24
        gobject-introspection
        gtk3
      ];
      
      shellHook = ''
        export GI_TYPELIB_PATH=$GI_TYPELIB_PATH:${pkgs.gtk3}/lib/girepository-1.0:${pkgs.astal}/lib/girepository-1.0
      '';
    };
  };
}
