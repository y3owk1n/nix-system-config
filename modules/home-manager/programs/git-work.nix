{ pkgs, ... }: {
  programs = {
    git = {
      enable = true;
      userName = "mtraworld";
      userEmail = "marketing@traworld.com";
      extraConfig = {
        github.user = "mtraworld";
        # color.ui = true;
        pull.rebase = true;
        merge.conflictstyle = "diff3";
        init.defaultBranch = "main";
        http.sslVerify = true;
        # commit.verbose = true;
        # diff.algorithm = "patience";
        protocol.version = "2";
        # core.commitGraph = true;
        # gc.writeCommitGraph = true;
        # push.autoSetupRemote = true;
      } // pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
        # these should speed up vim nvim-tree and other things that watch git repos but
        # only works on mac. see https://github.com/nvim-tree/nvim-tree.lua/wiki/Troubleshooting#git-fsmonitor-daemon
        core.fsmonitor = true;
        core.untrackedcache = true;
        feature.manyFiles = true;
      };
    };
  };
}
