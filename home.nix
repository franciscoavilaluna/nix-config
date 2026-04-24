{ config, pkgs, ... }:

{
	home.username = "pacosmosis";
	home.homeDirectory = "/home/pacosmosis";
	home.stateVersion = "25.11";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use nix, btw";
		};
	};
	programs.firefox.enable = true;
	services.ssh-agent.enable = true;
}
