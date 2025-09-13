{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd = {
    systemd.enable = true;
    luks.devices."luks-b3d4cac9-572b-4fa4-b9cc-21944d6dd0d8" = {
      fido2.passwordLess = true;
      device = "/dev/disk/by-uuid/b3d4cac9-572b-4fa4-b9cc-21944d6dd0d8";
      crypttabExtraOpts = ["fido2-device=auto"]; # cryptenroll
    };
  };
  boot.initrd.luks.fido2Support = false;

  networking.hostName = "nixos"; # Define your hostname.
  nix.settings.experimental-features = ["nix-command" "flakes"];
  networking.networkmanager = {
    enable = true;
    plugins = [ pkgs.networkmanager-openvpn ];
  };

  networking.firewall = {
    enable = true;
    checkReversePath = "loose";
  };

  time.timeZone = "Europe/Vienna";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  myNixOS = {
    bundles.general-desktop.enable = true;
    bundles.gaming.enable = true;
    virt-manager.enable = true;
    mariaDB-Apache.enable = false;
    platformio.enable = true;
    docker.enable = true;
    wireshark.enable = true;
    ssh.enable = true;
    gnome.enable = true;
    vmware-workstation.enable = true;
  };

  services.logind.extraConfig = ''
    HandlePowerKey=suspend
    HandlePowerKeyLongPress=poweroff
  '';

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  console = {
    earlySetup = true;
    keyMap = "de";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.thefu21 = {
    isNormalUser = true;
    description = "Theodor Fumics";
    extraGroups = ["wireshark" "networkmanager" "wheel" "docker"];
  };

  programs.dconf.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
