{...}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["thefu21"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
