{ config, pkgs, inputs, ... }:

{
    home.packages = with pkgs; [
        quickshell
    ];
    xdg.configFile."quickshell".source = inputs.dotfiles-quickshell;
}
