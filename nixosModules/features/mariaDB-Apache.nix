{
  lib,
  pkgs,
  ...
}: {
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
  systemd.services.mysql.wantedBy = lib.mkForce [];
  services.mysql.settings = {
    mysqld = {
      sql_mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
    };
  };

  services.httpd.enablePHP = true;
  services.httpd.enable = true;
  systemd.services.httpd.wantedBy = lib.mkForce [];

  # PDO und MySQL-Treiber aktivieren
  environment.systemPackages = with pkgs; [
    php84Extensions.pdo
    php84Extensions.pdo_mysql
  ];

  services.httpd.virtualHosts = {
    "example.com" = {
      documentRoot = "/var/www/";
      locations."/".extraConfig = ''
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
      '';
    };
  };
}
