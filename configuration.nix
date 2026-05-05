{ config, lib, pkgs, ... }:

{
	imports =
	[
		./hardware-configuration.nix
	];

    xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-hyprland
            pkgs.xdg-desktop-portal-gtk
        ];
        config.common.default = "*";
    };

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
    boot.supportedFilesystems = [ "exfat" "ntfs" ];

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

	networking.hostName = "keren";

	networking.networkmanager.enable = true;

	time.timeZone = "America/Mexico_City";

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};
	services.mysql = {
		enable = true;
		package = pkgs.mariadb;
	};
    services.postgresql = {
        enable = false;
        enableTCPIP = false;
        package = pkgs.postgresql_15;
    };

    services.printing.enable = true;
	services.libinput.enable = true;
    services.gnome.gnome-keyring.enable = true;

	users.users.pacosmosis = {
		isNormalUser = true;
		extraGroups = [ "wheel" "input" "video" "networkmanager" ];
	};

	environment.systemPackages = with pkgs; [
        pkgs.home-manager
		unzip
		wget
		git
        libsecret
        mariadb
        postgresql
        php
        sqlite
        serve
        xdg-utils
        hyprshot
        psmisc
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

    security.pam.services.login.enableGnomeKeyring = true;

	system.stateVersion = "25.11"; # <- Never change it OnO
}
