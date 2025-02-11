{pkgs, ...}: {
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  services.httpd.enablePHP = true;
  services.httpd.enable = true;

}
