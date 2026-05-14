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
    nixpkgs.overlays = [
        (final: prev: {
            openldap = prev.openldap.overrideAttrs (old: {
                doCheck = false;
            });
        })
    ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
    boot.supportedFilesystems = [ "exfat" "ntfs" ];

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
            intel-media-driver
            libva-utils
        ];
    };

	networking.hostName = "keren";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Mexico_City";

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

    security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
		pulse.enable = true;
        jack.enable = true;
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
        git
        wget
        unzip
        psmisc
        blueman
        xdg-utils
        libsecret
        brightnessctl
        #pkgs.home-manager
	];

    environment.sessionVariables = {
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        LIBVA_DRIVER_NAME = "iHD";
    };

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

    security.pam.services.login.enableGnomeKeyring = true;

	system.stateVersion = "25.11"; # <- Never change it!
}
