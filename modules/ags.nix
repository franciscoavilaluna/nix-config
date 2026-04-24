{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ags
		typescript
	];
	xdg.configFile."ags" = {
		source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/ags";
	};
}
