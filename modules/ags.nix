{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ags
		typescript
	];
	xdg.configFile."ags".source = ../ags;
}
