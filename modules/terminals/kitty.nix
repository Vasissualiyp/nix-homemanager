{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Frappe";
    shellIntegration.enableBashIntegration = true;
	settings = {
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      cursor = "#${config.colorScheme.palette.base01}";
	};
    extraConfig = ''
    enable_audio_bell no
    cursor #d9d9d9
    cursor_text_color  #cccccc
    map ctrl+pageup previous_tab
    map ctrl+pagedown next_tab
    tab_bar_edge top
    tab_bar_stule powerline
    tab_powerline_style round
    background_opacity 0.9
    '';
  };
}

