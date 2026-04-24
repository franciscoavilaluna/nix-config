{ config, pkgs, inputs, ... }:

{
	home.packages = with pkgs; [
		ags
		typescript
	];
	xdg.configFile."ags".source = inputs.dotfiles-ags;
}
