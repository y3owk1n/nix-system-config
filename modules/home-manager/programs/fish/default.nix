{ pkgs, ... }: {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting\n

        fzf_configure_bindings --directory=\cf --history=\cc --git_log= --git_status= --processes=\cp

        set -Ux __fish_initialized 3400
        set -Ux _tide_left_items os\x1epwd\x1egit\x1enewline\x1echaracter
        set -Ux _tide_prompt_28504 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x217\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_29994 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b92m\uf1d3\x20\x1b\x5b37m\x1b\x5b92mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x214\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_33024 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x217\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f\x1e\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b90m\uf252\x2014s\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f
        set -Ux _tide_prompt_34879 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x217\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f\x1e\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b90m\uf252\x209s\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f
        set -Ux _tide_prompt_37197 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x214\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_37721 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x214\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_38124 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x1b\x5b93m\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_39540 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x1b\x5b93m\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_40026 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x1b\x5b93m\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_40095 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x1b\x5b93m\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_40164 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x1b\x5b93m\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_40393 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x215\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_41433 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_46021 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x214\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f\x1e\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b90m\uf252\x2015s\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f
        set -Ux _tide_prompt_52675 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x215\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_53259 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b91m\u276f\x1e\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b31m\u2718\x20127\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f
        set -Ux _tide_prompt_54137 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x216\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_59121 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x216\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_prompt_7715 \x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b97m\uf179\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x40PWD\x40\x1b\x5b90m\x20\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5b35m\uf1d3\x20\x1b\x5b37m\x1b\x5b35mmain\x1b\x5b91m\x1b\x5b92m\x1b\x5b92m\x1b\x5b91m\x1b\x5b93m\x20\x2b4\x1b\x5b93m\x20\x216\x1b\x5b94m\x1b\x5bm\x0f\x1b\x5bm\x0f\x1b\x5bm\x0f\x20\x1e\x1b\x5b92m\u276f
        set -Ux _tide_right_items status\x1ecmd_duration\x1econtext\x1ejobs\x1enode\x1epython\x1ejava\x1eruby\x1ekubectl\x1enix_shell
        set -Ux fish_color_autosuggestion 555\x1ebrblack
        set -Ux fish_color_cancel \x2dr
        set -Ux fish_color_command blue
        set -Ux fish_color_comment red
        set -Ux fish_color_cwd green
        set -Ux fish_color_cwd_root red
        set -Ux fish_color_end green
        set -Ux fish_color_error brred
        set -Ux fish_color_escape brcyan
        set -Ux fish_color_history_current \x2d\x2dbold
        set -Ux fish_color_host normal
        set -Ux fish_color_host_remote yellow
        set -Ux fish_color_normal normal
        set -Ux fish_color_operator brcyan
        set -Ux fish_color_param cyan
        set -Ux fish_color_quote yellow
        set -Ux fish_color_redirection cyan\x1e\x2d\x2dbold
        set -Ux fish_color_search_match bryellow\x1e\x2d\x2dbackground\x3dbrblack
        set -Ux fish_color_selection white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
        set -Ux fish_color_status red
        set -Ux fish_color_user brgreen
        set -Ux fish_color_valid_path \x2d\x2dunderline
        set -Ux fish_key_bindings fish_vi_key_bindings
        set -Ux fish_pager_color_completion normal
        set -Ux fish_pager_color_description B3A06D\x1eyellow\x1e\x2di
        set -Ux fish_pager_color_prefix normal\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
        set -Ux fish_pager_color_progress brwhite\x1e\x2d\x2dbackground\x3dcyan
        set -Ux fish_pager_color_selected_background \x2dr
        set -Ux pisces_pairs \x28\x2c\x29\x1e\x5b\x2c\x5d\x1e\x7b\x2c\x7d\x1e\x22\x2c\x22\x1e\x27\x2c\x27
        set -Ux tide_aws_bg_color normal
        set -Ux tide_aws_color yellow
        set -Ux tide_aws_icon \uf270
        set -Ux tide_character_color brgreen
        set -Ux tide_character_color_failure brred
        set -Ux tide_character_icon \u276f
        set -Ux tide_character_vi_icon_default \u276e
        set -Ux tide_character_vi_icon_replace \u25b6
        set -Ux tide_character_vi_icon_visual V
        set -Ux tide_cmd_duration_bg_color normal
        set -Ux tide_cmd_duration_color brblack
        set -Ux tide_cmd_duration_decimals 0
        set -Ux tide_cmd_duration_icon \uf252
        set -Ux tide_cmd_duration_threshold 3000
        set -Ux tide_context_always_display false
        set -Ux tide_context_bg_color normal
        set -Ux tide_context_color_default yellow
        set -Ux tide_context_color_root bryellow
        set -Ux tide_context_color_ssh yellow
        set -Ux tide_context_hostname_parts 1
        set -Ux tide_crystal_bg_color normal
        set -Ux tide_crystal_color brwhite
        set -Ux tide_crystal_icon \ue62f
        set -Ux tide_direnv_bg_color normal
        set -Ux tide_direnv_bg_color_denied normal
        set -Ux tide_direnv_color bryellow
        set -Ux tide_direnv_color_denied brred
        set -Ux tide_direnv_icon \u25bc
        set -Ux tide_distrobox_bg_color normal
        set -Ux tide_distrobox_color brmagenta
        set -Ux tide_distrobox_icon \U000f01a7
        set -Ux tide_docker_bg_color normal
        set -Ux tide_docker_color blue
        set -Ux tide_docker_default_contexts default\x1ecolima
        set -Ux tide_docker_icon \uf308
        set -Ux tide_elixir_bg_color normal
        set -Ux tide_elixir_color magenta
        set -Ux tide_elixir_icon \ue62d
        set -Ux tide_gcloud_bg_color normal
        set -Ux tide_gcloud_color blue
        set -Ux tide_gcloud_icon \U000f02ad
        set -Ux tide_git_bg_color normal
        set -Ux tide_git_bg_color_unstable normal
        set -Ux tide_git_bg_color_urgent normal
        set -Ux tide_git_color_branch magenta
        set -Ux tide_git_color_conflicted brred
        set -Ux tide_git_color_dirty bryellow
        set -Ux tide_git_color_operation brred
        set -Ux tide_git_color_staged bryellow
        set -Ux tide_git_color_stash brgreen
        set -Ux tide_git_color_untracked brblue
        set -Ux tide_git_color_upstream brgreen
        set -Ux tide_git_icon \uf1d3
        set -Ux tide_git_truncation_length 24
        set -Ux tide_git_truncation_strategy \x1d
        set -Ux tide_go_bg_color normal
        set -Ux tide_go_color brcyan
        set -Ux tide_go_icon \ue627
        set -Ux tide_java_bg_color normal
        set -Ux tide_java_color yellow
        set -Ux tide_java_icon \ue256
        set -Ux tide_jobs_bg_color normal
        set -Ux tide_jobs_color green
        set -Ux tide_jobs_icon \uf013
        set -Ux tide_kubectl_bg_color normal
        set -Ux tide_kubectl_color blue
        set -Ux tide_kubectl_icon \U000f10fe
        set -Ux tide_left_prompt_frame_enabled false
        set -Ux tide_left_prompt_items os\x1epwd\x1egit\x1enewline\x1echaracter
        set -Ux tide_left_prompt_items context $tide_left_prompt_items
        set -Ux tide_left_prompt_prefix 
        set -Ux tide_left_prompt_separator_diff_color \x20
        set -Ux tide_left_prompt_separator_same_color \x20
        set -Ux tide_left_prompt_suffix \x20
        set -Ux tide_nix_shell_bg_color normal
        set -Ux tide_nix_shell_color brblue
        set -Ux tide_nix_shell_icon \uf313
        set -Ux tide_node_bg_color normal
        set -Ux tide_node_color green
        set -Ux tide_node_icon \ue24f
        set -Ux tide_os_bg_color normal
        set -Ux tide_os_color brwhite
        set -Ux tide_os_icon \uf179
        set -Ux tide_php_bg_color normal
        set -Ux tide_php_color blue
        set -Ux tide_php_icon \ue608
        set -Ux tide_private_mode_bg_color normal
        set -Ux tide_private_mode_color brwhite
        set -Ux tide_private_mode_icon \U000f05f9
        set -Ux tide_prompt_add_newline_before true
        set -Ux tide_prompt_color_frame_and_connection brblack
        set -Ux tide_prompt_color_separator_same_color brblack
        set -Ux tide_prompt_icon_connection \u00b7
        set -Ux tide_prompt_min_cols 34
        set -Ux tide_prompt_pad_items false
        set -Ux tide_prompt_transient_enabled false
        set -Ux tide_pulumi_bg_color normal
        set -Ux tide_pulumi_color yellow
        set -Ux tide_pulumi_icon \uf1b2
        set -Ux tide_pwd_bg_color normal
        set -Ux tide_pwd_color_anchors brcyan
        set -Ux tide_pwd_color_dirs cyan
        set -Ux tide_pwd_color_truncated_dirs magenta
        set -Ux tide_pwd_icon \uf07c
        set -Ux tide_pwd_icon_home \uf015
        set -Ux tide_pwd_icon_unwritable \uf023
        set -Ux tide_pwd_markers \x2ebzr\x1e\x2ecitc\x1e\x2egit\x1e\x2ehg\x1e\x2enode\x2dversion\x1e\x2epython\x2dversion\x1e\x2eruby\x2dversion\x1e\x2eshorten_folder_marker\x1e\x2esvn\x1e\x2eterraform\x1eCargo\x2etoml\x1ecomposer\x2ejson\x1eCVS\x1ego\x2emod\x1epackage\x2ejson
        set -Ux tide_python_bg_color normal
        set -Ux tide_python_color cyan
        set -Ux tide_python_icon \U000f0320
        set -Ux tide_right_prompt_frame_enabled false
        set -Ux tide_right_prompt_items status\x1ecmd_duration\x1econtext\x1ejobs\x1edirenv\x1enode\x1epython\x1erustc\x1ejava\x1ephp\x1epulumi\x1eruby\x1ego\x1egcloud\x1ekubectl\x1edistrobox\x1etoolbox\x1eterraform\x1eaws\x1enix_shell\x1ecrystal\x1eelixir
        set -Ux tide_right_prompt_prefix \x20
        set -Ux tide_right_prompt_separator_diff_color \x20
        set -Ux tide_right_prompt_separator_same_color \x20
        set -Ux tide_right_prompt_suffix 
        set -Ux tide_ruby_bg_color normal
        set -Ux tide_ruby_color red
        set -Ux tide_ruby_icon \ue23e
        set -Ux tide_rustc_bg_color normal
        set -Ux tide_rustc_color red
        set -Ux tide_rustc_icon \ue7a8
        set -Ux tide_shlvl_bg_color normal
        set -Ux tide_shlvl_color yellow
        set -Ux tide_shlvl_icon \uf120
        set -Ux tide_shlvl_threshold 1
        set -Ux tide_status_bg_color normal
        set -Ux tide_status_bg_color_failure normal
        set -Ux tide_status_color green
        set -Ux tide_status_color_failure red
        set -Ux tide_status_icon \u2714
        set -Ux tide_status_icon_failure \u2718
        set -Ux tide_terraform_bg_color normal
        set -Ux tide_terraform_color magenta
        set -Ux tide_terraform_icon \x1d
        set -Ux tide_time_bg_color normal
        set -Ux tide_time_color brblack
        set -Ux tide_time_format 
        set -Ux tide_toolbox_bg_color normal
        set -Ux tide_toolbox_color magenta
        set -Ux tide_toolbox_icon \ue24f
        set -Ux tide_vi_mode_bg_color_default normal
        set -Ux tide_vi_mode_bg_color_insert normal
        set -Ux tide_vi_mode_bg_color_replace normal
        set -Ux tide_vi_mode_bg_color_visual normal
        set -Ux tide_vi_mode_color_default white
        set -Ux tide_vi_mode_color_insert cyan
        set -Ux tide_vi_mode_color_replace green
        set -Ux tide_vi_mode_color_visual yellow
        set -Ux tide_vi_mode_icon_default D
        set -Ux tide_vi_mode_icon_insert I
        set -Ux tide_vi_mode_icon_replace R
        set -Ux tide_vi_mode_icon_visual V
      '';
      shellAliases = {
        c = "clear";
        x = "exit";
        vim = "nvim";
        "obs-kyle" =
          "cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Kyle/ && nvim .";
        "obs-traworld" =
          "cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Traworld/ && nvim .";
        nixswitch = "darwin-rebuild switch --flake ~/nix-system-config/.#";
        nixup = "pushd ~/nix-system-config; nix flake update; nixswitch; popd";
        nixcleanup = "bash ~/nix-system-config/cleanup.sh";
      };
      plugins = [
        {
          name = "tide";
          src = pkgs.fishPlugins.tide.src;
        }
        {
          name = "pisces";
          src = pkgs.fishPlugins.pisces.src;
        }
        {
          name = "sponge";
          src = pkgs.fishPlugins.sponge.src;
        }
        {
          name = "z";
          src = pkgs.fishPlugins.z.src;
        }
        {
          name = "plugin-git";
          src = pkgs.fishPlugins.plugin-git.src;
        }
        {
          name = "colored-man-pages";
          src = pkgs.fishPlugins.colored-man-pages.src;
        }
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
        {
          name = "fzf-fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
      ];
      functions = {
        fish_user_key_bindings = "fish_vi_key_bindings";
        mkdirx = ''
          if test -z $argv
              echo "Usage: mkdirx folder"
              return 1
          end

          mkdir $argv[1]

          cd $argv[1]
        '';
      };
      loginShellInit = ''
        if which tmux >/dev/null 2>&1
            if test "$TERM" != "screen-256color" -a "$TERM" != "screen"
                # Get the list of tmux sessions
                set sessions (tmux list-sessions 2> /dev/null)
                if test -n "$sessions"
                    # Check if "Hack" session exists in the list
                    set hack_session (echo "$sessions" | grep -o 'Hack' | head -n 1)
                    if test -n "$hack_session"
                        # If "Hack" session exists, attach to it
                        tmux attach-session -t "Hack"
                    else
                        # If "Hack" session not found, attach to the first one
                        set first_session (echo "$sessions" | awk -F: '{print $1}' | head -n 1)
                        tmux attach-session -t "$first_session"
                    end
                else
                    # If no sessions exist, create and attach to "Hack"
                    tmux new-session -s Hack
                end
            end
        end

        function __autols_hook --description "Auto ls" --on-event fish_prompt
            if test -z $__autols_initialized
                set -g __autols_initialized 1
                return
            end

            if test "$__autols_last" != (pwd)
                echo; ls
            end
            set -g __autols_last (pwd)
        end
      '';
    };
  };
}
