{ pkgs, config, ... }:

{
  programs.tmux = {
    enable = true;
	terminal = "tmux-256color";
    plugins = with pkgs;
	[
	  {
	    plugin = tmuxPlugins.continuum;
        extraConfig = "set -g @continuum-restore 'on'";
      }
	  tmuxPlugins.sensible
	  tmuxPlugins.yank
	  {
	    plugin = tmuxPlugins.resurrect;
		extraConfig = ''
	    set -g @continuum-restore 'on'
	    set -g @resurrect-strategy-vim 'session'
        set -g @resurrect-strategy-nvim 'session'
        set -g @resurrect-capture-pane-contents 'on'
        resurrect_dir="$HOME/.tmux/resurrect"
        set -g @resurrect-dir $resurrect_dir
        set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/home/$USER/.nix-profile/bin/||g" $target | sponge $target'
		'';
	  }
	  tmuxPlugins.continuum
	  tmuxPlugins.tmux-fzf
	  tmuxPlugins.vim-tmux-navigator
	];
	extraConfig = ''
      # Your original tmux configuration goes here
      set-option -sa terminal-overrides ",xterm*:Tc"
      set-option -ga terminal-overrides ",xterm-256color:Tc"
      set -g mouse on

      #unbind C-b
      #set -g prefix C-q
      #bind C-q send-prefix
      
      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      
      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      
      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      
      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window
      
      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window
      
      set -g @sessionx-zoxide-mode 'on'
      
      bind-key b send-prefix # Requirement for remote sessions
      
      run '~/.tmux/plugins/tpm/tpm'
      
      set -g status-bg default
      set -g status-style bg=default
      
      # set vi-mode
      set-window-option -g mode-keys vi
      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # DESIGN TWEAKS
      
      # don't do anything when a 'bell' rings
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      setw -g monitor-activity off
      set -g bell-action none
      
      # clock mode
      setw -g clock-mode-colour colour1
      
      # copy mode
      setw -g mode-style 'fg=colour1 bg=colour18 bold'
      
      # pane borders
      set -g pane-border-style 'fg=colour1'
      set -g pane-active-border-style 'fg=colour3'
      
      # statusbar
      set -g status-position top
      set -g status-justify left
      set -g status-style 'fg=colour1'
      set -g status-left '#[fg=colour2,bg=colour0,bold] #S '
      set -g status-right '%Y-%m-%d %H:%M '
      set -g status-right-length 50
      set -g status-left-length 10
      
      setw -g window-status-current-style 'fg=colour3 bg=colour0 bold'
      setw -g window-status-current-format ' #I #W #F '
      
      setw -g window-status-style 'fg=colour1 dim'
      setw -g window-status-format ' #I #[fg=colour7]#W #[fg=colour1]#F '
      
      setw -g window-status-bell-style 'fg=colour2 bg=colour1 bold'
      
      # messages
      set -g message-style 'fg=colour2 bg=colour0 bold'
	'';
  };
}

