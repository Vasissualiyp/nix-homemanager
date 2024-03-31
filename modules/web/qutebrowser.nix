{ pkgs, config, ... }:

{
  programs.qutebrowser = {
    enable = true;
	settings = {
	  content.pdfjs = true;

      keyMappings = {
		normal = {
		  ",p" = "spawn --userscript qute-pass";
		  ",P" = "spawn --userscript qute-pass --password-only";
		};
      };

      colors = {
	    webpage.darkmode.enabled = true;

		# Prefer dark or light browser theme
        webpage.preferred_color_scheme = "${config.colorScheme.variant}";

		# Text color of the completion widget. May be a single color to use for
        # all columns or a list of three colors, one for each column.
        completion.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of the completion widget for odd rows.
        completion.odd.bg = "#${config.colorScheme.palette.base01}";
        
        # Background color of the completion widget for even rows.
        completion.even.bg = "#${config.colorScheme.palette.base00}";
        
        # Foreground color of completion widget category headers.
        completion.category.fg = "#${config.colorScheme.palette.base0A}";
        
        # Background color of the completion widget category headers.
        completion.category.bg = "#${config.colorScheme.palette.base00}";
        
        # Top border color of the completion widget category headers.
        completion.category.border.top = "#${config.colorScheme.palette.base00}";
        
        # Bottom border color of the completion widget category headers.
        completion.category.border.bottom = "#${config.colorScheme.palette.base00}";
        
        # Foreground color of the selected completion item.
        completion.item.selected.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of the selected completion item.
        completion.item.selected.bg = "#${config.colorScheme.palette.base02}";
        
        # Top border color of the selected completion item.
        completion.item.selected.border.top = "#${config.colorScheme.palette.base02}";
        
        # Bottom border color of the selected completion item.
        completion.item.selected.border.bottom = "#${config.colorScheme.palette.base02}";
        
        # Foreground color of the matched text in the selected completion item.
        completion.item.selected.match.fg = "#${config.colorScheme.palette.base0B}";
        
        # Foreground color of the matched text in the completion.
        completion.match.fg = "#${config.colorScheme.palette.base0B}";
        
        # Color of the scrollbar handle in the completion view.
        completion.scrollbar.fg = "#${config.colorScheme.palette.base05}";
        
        # Color of the scrollbar in the completion view.
        completion.scrollbar.bg = "#${config.colorScheme.palette.base00}";
        
        # Background color of disabled items in the context menu.
        contextmenu.disabled.bg = "#${config.colorScheme.palette.base01}";
        
        # Foreground color of disabled items in the context menu.
        contextmenu.disabled.fg = "#${config.colorScheme.palette.base04}";
        
        # Background color of the context menu. If set to null, the Qt default is used.
        contextmenu.menu.bg = "#${config.colorScheme.palette.base00}";
        
        # Foreground color of the context menu. If set to null, the Qt default is used.
        contextmenu.menu.fg =  "#${config.colorScheme.palette.base05}";
        
        # Background color of the context menu’s selected item. If set to null, the Qt default is used.
        contextmenu.selected.bg = "#${config.colorScheme.palette.base02}";
        
        #Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
        contextmenu.selected.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color for the download bar.
        downloads.bar.bg = "#${config.colorScheme.palette.base00}";
        
        # Color gradient start for download text.
        downloads.start.fg = "#${config.colorScheme.palette.base00}";
        
        # Color gradient start for download backgrounds.
        downloads.start.bg = "#${config.colorScheme.palette.base0D}";
        
        # Color gradient end for download text.
        downloads.stop.fg = "#${config.colorScheme.palette.base00}";
        
        # Color gradient stop for download backgrounds.
        downloads.stop.bg = "#${config.colorScheme.palette.base0C}";
        
        # Foreground color for downloads with errors.
        downloads.error.fg = "#${config.colorScheme.palette.base08}";
        
        # Font color for hints.
        hints.fg = "#${config.colorScheme.palette.base00}";
        
        # Background color for hints. Note that you can use a `rgba(...)` value
        # for transparency.
        hints.bg = "#${config.colorScheme.palette.base0A}";
        
        # Font color for the matched part of hints.
        hints.match.fg = "#${config.colorScheme.palette.base05}";
        
        # Text color for the keyhint widget.
        keyhint.fg = "#${config.colorScheme.palette.base05}";
        
        # Highlight color for keys to complete the current keychain.
        keyhint.suffix.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of the keyhint widget.
        keyhint.bg = "#${config.colorScheme.palette.base00}";
        
        # Foreground color of an error message.
        messages.error.fg = "#${config.colorScheme.palette.base00}";
        
        # Background color of an error message.
        messages.error.bg = "#${config.colorScheme.palette.base08}";
        
        # Border color of an error message.
        messages.error.border = "#${config.colorScheme.palette.base08}";
        
        # Foreground color of a warning message.
        messages.warning.fg = "#${config.colorScheme.palette.base00}";
        
        # Background color of a warning message.
        messages.warning.bg = "#${config.colorScheme.palette.base0E}";
        
        # Border color of a warning message.
        messages.warning.border = "#${config.colorScheme.palette.base0E}";
        
        # Foreground color of an info message.
        messages.info.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of an info message.
        messages.info.bg = "#${config.colorScheme.palette.base00}";
        
        # Border color of an info message.
        messages.info.border = "#${config.colorScheme.palette.base00}";
        
        # Foreground color for prompts.
        prompts.fg = "#${config.colorScheme.palette.base05}";
        
        # Border used around UI elements in prompts.
        prompts.border = "#${config.colorScheme.palette.base00}";
        
        # Background color for prompts.
        prompts.bg = "#${config.colorScheme.palette.base00}";
        
        # Background color for the selected item in filename prompts.
        prompts.selected.bg = "#${config.colorScheme.palette.base02}";
        
        # Foreground color for the selected item in filename prompts.
        prompts.selected.fg = "#${config.colorScheme.palette.base05}";
        
        # Foreground color of the statusbar.
        statusbar.normal.fg = "#${config.colorScheme.palette.base0B}";
        
        # Background color of the statusbar.
        statusbar.normal.bg = "#${config.colorScheme.palette.base00}";
        
        # Foreground color of the statusbar in insert mode.
        statusbar.insert.fg = "#${config.colorScheme.palette.base00}";
        
        # Background color of the statusbar in insert mode.
        statusbar.insert.bg = "#${config.colorScheme.palette.base0D}";
        
        # Foreground color of the statusbar in passthrough mode.
        statusbar.passthrough.fg = "#${config.colorScheme.palette.base00}";
        
        # Background color of the statusbar in passthrough mode.
        statusbar.passthrough.bg = "#${config.colorScheme.palette.base0C}";
        
        # Foreground color of the statusbar in private browsing mode.
        statusbar.private.fg = "#${config.colorScheme.palette.base00}";
        
        # Background color of the statusbar in private browsing mode.
        statusbar.private.bg = "#${config.colorScheme.palette.base01}";
        
        # Foreground color of the statusbar in command mode.
        statusbar.command.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of the statusbar in command mode.
        statusbar.command.bg = "#${config.colorScheme.palette.base00}";
        
        # Foreground color of the statusbar in private browsing + command mode.
        statusbar.command.private.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of the statusbar in private browsing + command mode.
        statusbar.command.private.bg = "#${config.colorScheme.palette.base00}";
        
        # Foreground color of the statusbar in caret mode.
        statusbar.caret.fg = "#${config.colorScheme.palette.base00}";
        
        # Background color of the statusbar in caret mode.
        statusbar.caret.bg = "#${config.colorScheme.palette.base0E}";
        
        # Foreground color of the statusbar in caret mode with a selection.
        statusbar.caret.selection.fg = "#${config.colorScheme.palette.base00}";
        
        # Background color of the statusbar in caret mode with a selection.
        statusbar.caret.selection.bg = "#${config.colorScheme.palette.base0D}";
        
        # Background color of the progress bar.
        statusbar.progress.bg = "#${config.colorScheme.palette.base0D}";
        
        # Default foreground color of the URL in the statusbar.
        statusbar.url.fg = "#${config.colorScheme.palette.base05}";
        
        # Foreground color of the URL in the statusbar on error.
        statusbar.url.error.fg = "#${config.colorScheme.palette.base08}";
        
        # Foreground color of the URL in the statusbar for hovered links.
        statusbar.url.hover.fg = "#${config.colorScheme.palette.base05}";
        
        # Foreground color of the URL in the statusbar on successful load
        # (http).
        statusbar.url.success.http.fg = "#${config.colorScheme.palette.base0C}";
        
        # Foreground color of the URL in the statusbar on successful load
        # (https).
        statusbar.url.success.https.fg = "#${config.colorScheme.palette.base0B}";
        
        # Foreground color of the URL in the statusbar when there's a warning.
        statusbar.url.warn.fg = "#${config.colorScheme.palette.base0E}";
        
        # Background color of the tab bar.
        tabs.bar.bg = "#${config.colorScheme.palette.base00}";
        
        # Color gradient start for the tab indicator.
        tabs.indicator.start = "#${config.colorScheme.palette.base0D}";
        
        # Color gradient end for the tab indicator.
        tabs.indicator.stop = "#${config.colorScheme.palette.base0C}";
        
        # Color for the tab indicator on errors.
        tabs.indicator.error = "#${config.colorScheme.palette.base08}";
        
        # Foreground color of unselected odd tabs.
        tabs.odd.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of unselected odd tabs.
        tabs.odd.bg = "#${config.colorScheme.palette.base01}";
        
        # Foreground color of unselected even tabs.
        tabs.even.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of unselected even tabs.
        tabs.even.bg = "#${config.colorScheme.palette.base00}";
        
        # Background color of pinned unselected even tabs.
        tabs.pinned.even.bg = "#${config.colorScheme.palette.base0C}";
        
        # Foreground color of pinned unselected even tabs.
        tabs.pinned.even.fg = "#${config.colorScheme.palette.base07}";
        
        # Background color of pinned unselected odd tabs.
        tabs.pinned.odd.bg = "#${config.colorScheme.palette.base0B}";
        
        # Foreground color of pinned unselected odd tabs.
        tabs.pinned.odd.fg = "#${config.colorScheme.palette.base07}";
        
        # Background color of pinned selected even tabs.
        tabs.pinned.selected.even.bg = "#${config.colorScheme.palette.base02}";
        
        # Foreground color of pinned selected even tabs.
        tabs.pinned.selected.even.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of pinned selected odd tabs.
        tabs.pinned.selected.odd.bg = "#${config.colorScheme.palette.base02}";
        
        # Foreground color of pinned selected odd tabs.
        tabs.pinned.selected.odd.fg = "#${config.colorScheme.palette.base05}";
        
        # Foreground color of selected odd tabs.
        tabs.selected.odd.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of selected odd tabs.
        tabs.selected.odd.bg = "#${config.colorScheme.palette.base02}";
        
        # Foreground color of selected even tabs.
        tabs.selected.even.fg = "#${config.colorScheme.palette.base05}";
        
        # Background color of selected even tabs.
        tabs.selected.even.bg = "#${config.colorScheme.palette.base02}";

      };
    };
  };
}
