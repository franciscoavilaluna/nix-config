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

	home.file.".config/nvim" = {
		source = config.lib.file.mkOutOfStoreSymlink /home/pacosmosis/dotfiles/nvim;
        recursive = false;
	};
}
