{
  pkgs,
  config,
  ...
}: 

with config.lib.stylix.colors.withHashtag;

{
  programs.wofi = {
    enable = true;

    settings = {
      allow_images = true;
      prompt = "Search";
      image_size = 20;
      insensitive = true;
    };

    style = ''
      * {
        font-family: "JetBrains Mono", "Iosevka Nerd Font", archcraft, sans-serif;
        font-size: 12px;
	font-weight: bold;
	outline: none;
      }

      #window {
      	background-color: ${base00};
      	color: ${base05};
      	border: 2px solid ${base0D};
      	border-radius: 10px;
      }
      
      #outer-box {
      	padding: 20px;
      }
      
      #input {
      	background-color: ${base00};
      	padding: 8px 12px;
	box-shadow: none;
      }
      
      #scroll {
      	margin-top: 20px;
      }
      
      #inner-box {
      }
      
      #img {
      	padding-right: 8px;
      }
      
      #text {
      	color: ${base05};
      }
      
      #text:selected {
      	color: ${base00};
      }
      
      #entry {
      	padding: 6px;
      }
      
      #entry:selected {
      	background-color: ${base0D};
      	color: ${base00};
      }
      
      #unselected {
      }
      
      #selected {
      }
      
      #input, #entry:selected {
	border-radius: 4px;
	border: none;
	outline: none;
      }

    '';
  };
}
