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
            t = "tmux";
            ta = "tmux a";
            td = "tmux detach";
            f = "yazi";
            nrsf = "sudo nixos-rebuild switch --flake .";
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

    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                font = "BlexMono Nerd Font:size=8";
                layer = "overlay";
                width = 30;
                lines = 10;
                line-height = 10;
                horizontal-pad = 10;
                vertical-pad = 10;
                inner-pad = 0;
                show-actions = false;
                icon-theme = "none";
                icons-enabled = "no";
            };
            colors = {
                background = "000000ff";
                text = "cececeff";
                match = "ffffffff";
                selection = "333333ff";
                selection-text = "ffffffff";
                border = "333333ff";
            };
            border = {
                width = 1;
                radius = 0;
            };
        };
    };

    programs.yazi = {
        enable = true;
        shellWrapperName = "y";

        settings = {
            manager = {
                show_hidden = true;
                sort_by = "alphabetical";
                sort_dir_first = true;
                ratio = [ 1 2 4 ];
            };
            preview = {
                enabled = true;
                wrap = "yes";
                image_filter = "lanczos3"; 
                image_quality = 75; 
            };
        };

        keymap = {
            manager.prepend_keymap = [ { on = [ "q" ]; run = "quit"; desc = "Leave"; } ];
        };
    };

	home.packages = with pkgs; [
        texlive.combined.scheme-full
        nerd-fonts.blex-mono
        wl-clipboard
        cloudflared
        quickshell
        fastfetch
        guvcview
        inkscape
        hyprshot
        python3
        mariadb
        zathura
        fuzzel
        sqlite
        wtype
        kitty
        serve
        tree
        yazi
        feh
        php
        vlc

        protonup-qt
        obs-studio
        bottles
	];

	services.ssh-agent.enable = true;
}
