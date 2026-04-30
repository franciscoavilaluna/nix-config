{ config, pkgs, inputs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "t"; 
    terminal = "xterm-256color";
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 10000;
    mouse = true;
  };

  xdg.configFile."tmux/tmux.conf".source = "${inputs.dotfiles-tmux}/tmux.conf";
}
