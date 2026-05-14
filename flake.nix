{
    description = "Stable Hyprland Flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        #hyprland.url = "github:hyprwm/Hyprland";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        dotfiles-nvim = { url = "github:franciscoavilaluna/nvim"; flake = false; };
        dotfiles-tmux = { url = "github:franciscoavilaluna/tmux"; flake = false; };
        #dotfiles-quickshell = { url = "github:franciscoavilaluna/quickshell"; flake = false; };
    };

    outputs = { self, nixpkgs, home-manager, dotfiles-nvim, dotfiles-tmux, ... }@inputs: 
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
    };
}
