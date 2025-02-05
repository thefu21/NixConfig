{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      #      base16-colors = config.stylix.base16Scheme;
    };
    statusline.lualine = {
      enable = true;
      theme = "catppuccin";
    };

    spellcheck = {
      enable = true;
      languages = ["en" "de"];
    };

    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    snippets.luasnip.enable = true;

    filetree.neo-tree.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      sql.enable = true;
      php.enable = true;
      markdown.enable = true;
      ts.enable = true;
      html.enable = true;
      bash.enable = true;
      css.enable = true;
    };

    binds = {
      cheatsheet.enable = true;
      whichKey.enable = true;
    };
    
    comments.comment-nvim.enable = true;

    keymaps = [
      {
        key = "<C-b>";
        mode = "n";
        action = ":Neotree<CR>";
        silent = true;
      }
    ];
  };
}
