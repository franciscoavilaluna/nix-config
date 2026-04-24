{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ags
    libdbusmenu-gtk3
    gobject-introspection
  ];

  home.file.".config/ags" = {
    source = ../ags;
    recursive = true;
  };
}
