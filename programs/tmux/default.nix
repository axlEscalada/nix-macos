{ ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
      # changing prefix from 'Ctrl+b' to 'Alt+b'
      unbind C-b

      set-option -g prefix C-b
      set -g mouse on
      # Start windows and panes at 1, not 0
      set -g base-index 1
      setw -g pane-base-index 1
      # Ensure window index numbers get reordered on delete.
      set-option -g renumber-windows on

      set -g status-style ""
      set -g message-style ""

      set -g default-terminal "screen"

      set-option -g default-shell /bin/zsh
      set-option -g default-command /bin/zsh

      bind-key C-b send-prefix

      bind-key -n M-t new-window
      bind-key -n M-w kill-window
      bind-key -n M-Right next-window
      bind-key -n M-Left previous-window

      # Use cmd-<number> to switch to tab
      bind-key -n M-1 select-window -t 1
      bind-key -n M-2 select-window -t 2
      bind-key -n M-3 select-window -t 3
      bind-key -n M-4 select-window -t 4
      bind-key -n M-5 select-window -t 5
      bind-key -n M-6 select-window -t 6
      bind-key -n M-7 select-window -t 7
      bind-key -n M-8 select-window -t 8
      bind-key -n M-9 select-window -t 9

      bind h select-pane -L                           # Select pane to the left
      bind j select-pane -D                           # Select pane below
      bind k select-pane -U                           # Select pane above
      bind l select-pane -R                           # Select pane to the right
      bind t new-window -c "#{pane_current_path}"     # New window
      bind w kill-pane                                # Close current pane

      set -sg escape-time 0
    '';
  };
}
