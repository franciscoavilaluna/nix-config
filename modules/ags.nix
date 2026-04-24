{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ags
    typescript
  ];

  home.file.".config/ags" = {
    source = ../ags;
    recursive = true;
  };
}
