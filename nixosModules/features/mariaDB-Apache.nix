{
  lib,
  pkgs,
  ...
}: {
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
  systemd.services.mysql.wantedBy = lib.mkForce [];

  services.httpd.enablePHP = true;
  services.httpd.enable = true;
  systemd.services.httpd.wantedBy = lib.mkForce [];

  services.httpd.virtualHosts = {
    "example.com" = {
      documentRoot = "/var/www";
      locations."/".extraConfig = ''
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
      '';
    };
  };
}
