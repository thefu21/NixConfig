{pkgs, ...}: {
  programs.lf.enable = true;

  programs.lf.commands = {
    dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
    mkdir = ''%mkdir $1'';
  };

  programs.lf.settings = {
    preview = true;
    icons = true;
    ignorecase = true;
  };

  programs.lf.extraConfig = let
    previewer = pkgs.writeShellScriptBin "pv.sh" ''
      file=$1
      w=$2
      h=$3
      x=$4
      y=$5

      if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
          ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
          exit 1
      fi

      ${pkgs.pistol}/bin/pistol "$file"
    '';
    cleaner = pkgs.writeShellScriptBin "clean.sh" ''
      ${pkgs.ctpv}/bin/ctpvclear
      ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
    '';
  in ''
    # set cleaner ''${pkgs.ctpv}/bin/ctpvclear
    set cleaner ${cleaner}/bin/clean.sh
    set previewer ${pkgs.ctpv}/bin/ctpv
    cmd stripspace %stripspace "$f"
    setlocal ~/Projects sortby time
    setlocal ~/Projects/* sortby time
    setlocal ~/Downloads/ sortby time
  '';

  xdg.configFile."lf/icons".source = ./icons;
}
