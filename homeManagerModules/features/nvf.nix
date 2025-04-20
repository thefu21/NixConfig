{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    options = {
      tabstop = 2;
      shiftwidth = 2;
    };

    statusline.lualine = {
      enable = true;
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
      php.lsp.enable = true;

      markdown.enable = true;
      ts.enable = true;
      html.enable = true;
      bash.enable = true;
      css.enable = true;
    };

    lsp.otter-nvim = {
      enable = true;
      setupOpts.buffers.set_filetype = true;
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
      {
        key = "<C-s>";
        mode = "n";
        action = ":if &list | set nolist | else | set list listchars=tab:>-,lead:. | endif<CR>";
        silent = true;
        desc = "Toggle leading tabs/spaces";
      }
    ];
  };
}
