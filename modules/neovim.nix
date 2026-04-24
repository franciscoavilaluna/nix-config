{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      fd
    ];
  };

  home.file.".config/nvim" = {
    source = ../nvim; 
    recursive = true;
  };
}
