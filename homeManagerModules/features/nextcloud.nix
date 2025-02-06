{
  config,
  pkgs,
  ...
}: {
  sops.templates."rclone-nextcloud.conf".content = ''
    [nextcloud]
      type = webdav
      url = https://nextcloud.thefu21.net/remote.php/dav/files/thefu21
      vendor = nextcloud
      user = thefu21
      pass = ${config.sops.placeholder."rclone/nextcloud/thefu21-passwd"}
  '';

  systemd.user.services.rclone-nextcloud = {
    Unit = {
      Description = "Rclone Nextcloud Mount";
      After = ["network-online.target"];
      Wants = ["network-online.target"];
    };
    Service = {
      Type = "notify";
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone \
          --config ${config.sops.templates."rclone-nextcloud.conf".path} \
          --vfs-cache-mode writes \
          --ignore-checksum \
          mount "nextcloud:" "%h/Nextcloud"
      '';
      ExecStop = "/bin/fusermount -u %h/Nextcloud";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}
