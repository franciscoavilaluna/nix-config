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
    programs.firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
    };

    home.packages = with pkgs; [
        vim
        neovim
        fd
    ];

	services.ssh-agent.enable = true;
}
