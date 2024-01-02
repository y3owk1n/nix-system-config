{ ... }: {
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        command_timeout = 1000;
        scan_timeout = 30;
        add_newline = true;
        cmd_duration.disabled = true;
        git_metrics.disabled = false;
      };
    };
  };
}
