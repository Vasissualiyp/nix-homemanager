{ pkgs, config, ... }:

{
  programs.zathura = {
    enable = true;
	options = {
      # One page per row by default;
      pages-per-row = 1;
     
      #stop = at page boundries;
      scroll-page-aware = "true";
      #smooth-scroll = "true";
      scroll-full-overlap = "0.01";
      scroll-step = 100;
     
      #zoom = settings;
      zoom-min = 10;
      #guioptions = "";
     
      # zathurarc-dark;
     
      font = "inconsolata 20";

      highlight-transparency = "1.0";
      recolor = "true";
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
