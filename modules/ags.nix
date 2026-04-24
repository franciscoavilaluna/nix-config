{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ags
		typescript
	];
    xdg.configFile."ags".source = config.lib.file.mkOutOfStoreSymlink /home/pacosmosis/dotfiles/nix-config/ags;
}
