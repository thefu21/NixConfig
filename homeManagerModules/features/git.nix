{pkgs, ...}: {
  programs.git = {
    package = pkgs.gitFull;
    enable = true;
    settings = {
      user = {
        email = "theodor.fumics@gmx.net";
        name = "Theodor Fumics";
      };
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      init.defaultBranch = "main";
    };
  };
}
