{ config, pkgs, ... }:

{
	imports = [
		./modules/neovim.nix
		./modules/tmux.nix
	];
	home.username = "pacosmosis";
	home.homeDirectory = "/home/pacosmosis";
	home.stateVersion = "25.11";

    gtk.gtk4.theme = config.gtk.theme;
    gtk = {
        enable = true;
        theme = {
            name = "WhiteSur-Dark";
            package = pkgs.whitesur-gtk-theme;
        };
        iconTheme = {
            name = "WhiteSur-dark";
            package = pkgs.whitesur-icon-theme;
        };
        gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = 1;
        };
        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = 1;
        };
    };

    dconf = {
        enable = true;
        settings = {
            "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
                gtk-theme = "WhiteSur-Dark";
                icon-theme = "WhiteSur-dark";
            };
        };
    };

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
    };

    home.sessionVariables = {
        HYPRCURSOR_THEME = "Bibata-Modern-Classic";
        HYPRCURSOR_SIZE = "24";
        XCURSOR_THEME = "Bibata-Modern-Classic";
        XCURSOR_SIZE = "24";
    };

	programs.bash = {
		enable = true;
		shellAliases = {
			q = "exit";
			la = "ls -la";
			hp = "start-hyprland";
		};
	};

	programs.firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
    };

    programs.kitty = {
        enable = true;
        settings = {
            font_family = "BlexMono Nerd Font";
            font_size = 12;
        };
    };

	home.packages = with pkgs; [
		vim
		fastfetch
        cloudflared
        quickshell
        tree
        kitty
        hyprshot
        feh
        guvcview
        nerd-fonts.blex-mono
	];

	services.ssh-agent.enable = true;
}
