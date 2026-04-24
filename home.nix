{ config, pkgs, ... }:

{

	imports = [
		./modules/neovim.nix
	];

	home.username = "pacosmosis";
	home.homeDirectory = "/home/pacosmosis";
	home.stateVersion = "25.11";
	programs.bash = {
		enable = true;
		shellAliases = {
			q = "exit";
			la = "ls -la";
            hp = "hyprland";
		};
	};
    programs.firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
    };

    home.packages = with pkgs; [
        vim
        fastfetch
    ];

	services.ssh-agent.enable = true;
}
