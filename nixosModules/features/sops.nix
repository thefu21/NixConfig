{ config, inputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ./../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.sshKeyPaths = [ "/home/thefu21/.ssh/id_ed25519" ];
  sops.age.generateKey = true;

}
