{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ags
		typescript
	];

	xdg.configFile."ags" = {
		source = builtins.path {
			path = /home/pacosmosis/dotfiles/ags;
			name = "ags-config";
		};
	};
}
