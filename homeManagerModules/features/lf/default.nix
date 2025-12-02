{pkgs, ...}: {
  programs.lf.enable = true;

  programs.lf.keybindings = {
    "." = "set hidden!";
    gn = "cd ~/Nextcloud";
    gs = "cd ~/Nextcloud/Schule/25-26";
    gd = "cd ~/Downloads";
    gD = "cd ~/Documents/";
    x = "cut";
    d = "";
    dd = "delete";

    "<enter>" = "shell";
  };

  programs.lf.commands = {
    dragon-out = ''%${pkgs.dragon-drop}/bin/dragon-drop -a -x "$fx"'';
    mkdir = ''%mkdir $1'';
    extract = ''%{{
      set -f
      output_dir=''${1:-.}
      mkdir -p "$output_dir"
      ${pkgs.unar}/bin/unar -o "$output_dir" $f
    }}'';
    tar = ''%{{
      set -f
      mkdir $1
      cp -r $fx $1
      ${pkgs.gnutar}/bin/tar czf $1.tar.gz $1
      rm -rf $1
    }}'';
    zip = ''%{{
      set -f
      mkdir $1
      cp -r $fx $1
      ${pkgs.zip}/bin/zip -r $1.zip $1
      rm -rf $1
    }}'';
  };

  programs.lf.settings = {
    preview = true;
    icons = true;
    ignorecase = true;
    promptfmt = ''\033[33m%u@%h\033[0m\033[0m:%d\033[0m\033[0m%f\033[0m'';
    statfmt = ''\033[33m%p\033[0m| %c| %u| %g| %S| %t| -> %l'';
    cursorpreviewfmt = '''';
  };

  programs.lf.extraConfig = let
    cleaner = pkgs.writeShellScriptBin "clean.sh" ''
      ${pkgs.ctpv}/bin/ctpvclear
      ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
    '';
  in ''
    set cleaner ${cleaner}/bin/clean.sh
    set previewer ${pkgs.ctpv}/bin/ctpv
  '';

  xdg.configFile."lf/icons".source = ./icons;
  xdg.configFile."lf/colors".source = ./colors;
}
