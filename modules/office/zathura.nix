{ pkgs, config, ... }:

{
  programs.zathura = {
    enable = true;
	options = {
      # One page per row by default;
      pages-per-row = 1;
     
      #stop = at page boundries;
      scroll-page-aware = "true";
      smooth-scroll = "true";
      scroll-full-overlap = "0.01";
      scroll-step = 100;
     
      #zoom = settings;
      zoom-min = 10;
      #guioptions = "";
     
      # zathurarc-dark;
     
      font = "inconsolata 15";
      default-bg = "#${config.colorScheme.palette.base00}"; #00
      default-fg = "#${config.colorScheme.palette.base01}"; #01
     
      statusbar-fg = "#${config.colorScheme.palette.base04}"; #04
      statusbar-bg = "#${config.colorScheme.palette.base01}"; #01
     
      inputbar-bg = "#${config.colorScheme.palette.base00}"; #00 
      inputbar-fg = "#${config.colorScheme.palette.base02}"; #02
     
      notification-error-bg = "#${config.colorScheme.palette.base08}"; #08
      notification-error-fg = "#${config.colorScheme.palette.base00}"; #00
     
      notification-warning-bg = "#${config.colorScheme.palette.base08}"; #08
      notification-warning-fg = "#${config.colorScheme.palette.base00}"; #00
     
      highlight-color = "#${config.colorScheme.palette.base0A}"; #0A
      highlight-active-color = "#${config.colorScheme.palette.base0D}"; #0D
      highlight-transparency = "1";
     
      completion-highlight-fg = "#${config.colorScheme.palette.base02}"; #02
      completion-highlight-bg = "#${config.colorScheme.palette.base0C}"; #0C
     
      completion-bg = "#${config.colorScheme.palette.base02}"; #02
      completion-fg = "#${config.colorScheme.palette.base0C}"; #0C
     
      notification-bg = "#${config.colorScheme.palette.base0B}"; #0B
      notification-fg = "#${config.colorScheme.palette.base00}"; #00
     
      recolor = "true";
      recolor-lightcolor = "#${config.colorScheme.palette.base00}"; #00
      recolor-darkcolor = "#${config.colorScheme.palette.base06}"; #06
      recolor-reverse-video = "true";
      recolor-keephue = "true";
     
      render-loading = "false";
	};

	mappings = {
      gr = "set recolor";
	};

    extraConfig = ''
    #unmap f
    #map f toggle_fullscreen
    #map [fullscreen] f toggle_fullscreen
    '';

  };
}
