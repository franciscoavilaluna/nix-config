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

    nixpkgs.config.allowUnfree = true;

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
    boot.supportedFilesystems = [ "exfat" "ntfs" ];

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

	networking.hostName = "keren";

	networking.networkmanager.enable = true;

	time.timeZone = "America/Mexico_City";

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
    };

    programs.gamemode.enable = true;

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
        protonup-qt
        
        kdePackages.kdenlive
        kdePackages.qtwayland
        kdePackages.kio-extras
        glib
        vlc

        ipe
        texlive.combined.scheme-full
        zathura
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

    security.pam.services.login.enableGnomeKeyring = true;

	system.stateVersion = "25.11"; # <- Never change it OnO
}
