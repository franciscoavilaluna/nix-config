{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		
		withRuby = true;
		withPython3 = true;

		extraPackages = with pkgs; [
			lua-language-server
			fd
		];
	};
	xdg.configFile."nvim" = {
		source = builtins.path {
			path = /home/pacosmosis/dotfiles/nvim/;
			name = "nvim-config";
		};
	};
}
