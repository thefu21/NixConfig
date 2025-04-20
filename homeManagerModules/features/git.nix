{inputs, pkgs, ...}: {
  programs.git = {
    package = pkgs.gitFull;
    enable = true;
    userEmail = "theodor.fumics@gmx.net";
    userName = "Theodor Fumics";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      init.defaultBranch = "main";
    };
  };
}
