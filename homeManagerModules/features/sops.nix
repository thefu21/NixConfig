{ config, inputs, ... }: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ./../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "/home/thefu21/.ssh/id_ed25519" ];
    age.generateKey = true;

    secrets."rclone/nextcloud/thefu21-passwd" = { };
  };
}
