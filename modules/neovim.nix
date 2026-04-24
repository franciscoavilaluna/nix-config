{ config, pkgs, inputs, ... }:

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
	xdg.configFile."nvim".source = inputs.dotfiles-nvim;
}
