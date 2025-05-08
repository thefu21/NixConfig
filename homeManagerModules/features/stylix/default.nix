{
  config,
  lib,
  myLib,
  inputs,
  ...
}: let
  cfg = config.myHomeManager;

  stylix =
    myLib.extendModules
    (name: {
      extraOptions = {
        myHomeManager.themes.${name}.enable = lib.mkEnableOption "enable my ${name} theme";
      };

      configExtension = config: (lib.mkIf cfg.themes.${name}.enable config);
    })
    (myLib.filesIn ./themes);
in {
  imports =
    [
      inputs.stylix.homeManagerModules.stylix
    ]
    ++ stylix;
}
