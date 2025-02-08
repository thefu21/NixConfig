{
  config,
  pkgs,
  ...
}:
let 
    mountdir = "${config.home.homeDirectory}/Nextcloud";
in
{
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
      After = ["network-online.target local-fs.target"];
      Wants = ["network-online.target"];
    };
    Service = {
      Type = "notify";
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone \
          --config ${config.sops.templates."rclone-nextcloud.conf".path} \
          --vfs-cache-mode writes \
          --vfs-read-wait 10s \
          --timeout 1m \
          --retries 10 \
          --ignore-checksum \
          mount "nextcloud:" ${mountdir}
      '';
      ExecStop = "/bin/fusermount -u ${mountdir}";
      Restart = "on-failure";
      Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}
