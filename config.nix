{pkgs, lib, ...}:

{
  vim = {
    theme.enable = true;
		theme.extraConfig = ''
			vim.cmd.colorscheme("everforest")
		'';
		startPlugins = [pkgs.vimPlugins.everforest];

    treesitter.enable = true;
		statusline.lualine = {
			enable = true;
			theme = "everforest";
		};
		telescope.enable = true;
		autocomplete.nvim-cmp.enable = true;

		languages = {
			enableLSP = true;
			enableTreesitter = true;
			enableFormat = true;

			nix.enable = true;
			elixir.enable = true;
		};
  };
}
