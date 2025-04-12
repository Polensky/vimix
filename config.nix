{
  pkgs,
  lib,
  ...
}: {
  vim = {
    theme.enable = true;
    extraPlugins = with pkgs.vimPlugins; {
      everforest = {
        package = everforest;
        setup = "vim.cmd('colorscheme everforest')";
      };
      telescope-fzf-native = {
        package = telescope-fzf-native-nvim;
        setup = ''
          require('telescope').load_extension('fzf')
        '';
      };
    };
    luaConfigRC.everforest_settings = ''
      vim.g.everforest_enable_italic = 1
    '';
    statusline.lualine = {
      enable = true;
      theme = "everforest";
    };

    globals.mapleader = " ";
    useSystemClipboard = true;
    options = {
      tabstop = 2;
      shiftwidth = 2;
    };
    mini.surround.enable = true;

    treesitter = {
      enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        heex
      ];
    };

    telescope = {
      enable = true;
      mappings = {
        findFiles = "<leader><leader>";
      };
    };
    luaConfigRC.telescope_mappings = ''
      require('telescope').setup({
      	defaults = {
      		mappings = {
      			i = {
      				["<C-j>"] = require('telescope.actions').move_selection_next,
      				["<C-k>"] = require('telescope.actions').move_selection_previous,
      			},
      			n = {
      				["<C-j>"] = require('telescope.actions').move_selection_next,
      				["<C-k>"] = require('telescope.actions').move_selection_previous,
      			}
      		}
      	}
      })
    '';

    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        next = "<C-j>";
        previous = "<C-k>";
      };
    };

    assistant.copilot = {
      enable = true;
      cmp.enable = true;
    };

    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      elixir.enable = true;
      elixir.format.enable = false;
    };

    keymaps = [
      {
        action = "<cmd>:w<CR>";
        key = "<leader>fs";
        mode = "n";
        desc = "Save current buffer";
      }
      # Split action
      {
        action = "<cmd>vsplit<CR>";
        key = "<leader>wv";
        mode = "n";
        desc = "Split window vertically";
      }
      {
        action = "<cmd>split<CR>";
        key = "<leader>ws";
        mode = "n";
        desc = "Split window horizontally";
      }
      {
        action = "<cmd>vsplit<CR>";
        key = "<leader>wd";
        mode = "n";
        desc = "Close current window";
      }
      # Split navigation
      {
        action = "<C-w>l";
        key = "<leader>wl";
        mode = "n";
      }
      {
        action = "<C-w>h";
        key = "<leader>wh";
        mode = "n";
      }
      {
        action = "<C-w>k";
        key = "<leader>wk";
        mode = "n";
      }
      {
        action = "<C-w>j";
        key = "<leader>wj";
        mode = "n";
      }
    ];
  };
}
