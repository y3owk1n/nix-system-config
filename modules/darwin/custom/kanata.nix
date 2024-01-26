let

  pkgs = import <nixpkgs> { };

  kanata_bin = pkgs.fetchurl {
    url =
      "https://github.com/jtroo/kanata/releases/download/v1.5.0/kanata_macos_cmd_allowed";
    sha256 = "eb722e05c464fabf3fd31c46efbe41d218e7b88764e861e19db84f31b1405b28";
  };
in pkgs.runCommand "kanata" { nativeBuildInputs = [ pkgs.makeWrapper ]; } ''
  mkdir -p $out/bin
  cp ${kanata_bin} $out/bin/kanata
  chmod +x $out/bin/*
  # Optionally, you can create a symlink to make it accessible without specifying the path
  # ln -s $out/bin/kanata $out/bin/kanata

  # Create a wrapper script to add the desired flags
  # echo '#!${pkgs.stdenv.shell}' > $out/bin/kanata-wrapper
  # echo '$out/bin/kanata --cfg ~/.config/kanata/config.kbd "$@"' >> $out/bin/kanata-wrapper
  # chmod +x $out/bin/kanata-wrapper
''
