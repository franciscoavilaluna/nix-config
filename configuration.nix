{ config, lib, pkgs, ... }:

{
	imports =
	[
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "keren";

	networking.networkmanager.enable = true;

	time.timeZone = "America/Mexico_City";
	services.printing.enable = true;

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	services.libinput.enable = true;

	users.users.pacosmosis = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
	};

	environment.systemPackages = with pkgs; [
        pkgs.home-manager
		unzip
		wget
		kitty
		git
        libsecret
	hyprshot
	feh
	guvcview
        mariadb
        postgresql
        sqlite
        serve
        xdg-utils
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "25.11"; # <- Never change it OnO
}
