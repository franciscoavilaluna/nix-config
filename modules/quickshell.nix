{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        quickshell
    ];
    xdg.configFile."quickshell".source = inputs.dotfiles-nvim;
}
