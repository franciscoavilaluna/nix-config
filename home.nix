{ config, pkgs, ... }:

{
	home.username = "pacosmosis";
	home.homeDirectory = "/home/pacosmosis";
	home.stateVersion = "25.11";
	programs.bash = {
		enable = true;
		shellAliases = {
			q = "exit";
			la = "ls -la";
		};
	};
	programs.firefox.enable = true;
	services.ssh-agent.enable = true;
}
