{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ags
    typescript
  ];

  home.file.".config/ags" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/pacosmosis/dotfiles/ags;
    recursive = false;
  };
}
