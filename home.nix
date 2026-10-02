{ config, pkgs, ... }:

{
  home.username = "setthename";
  home.homeDirectory = "/home/your home.username";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch

    htop

    nautilus

    slurp

    openssh

    gcc
    gnumake

    btop

    grim
    ripgrep

    fd
    pywal16

  ];


  programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    catppuccin-nvim
    oil-nvim
    nvim-web-devicons

    telescope-nvim
    plenary-nvim

    lualine-nvim
    noice-nvim
    nui-nvim
    dashboard-nvim

    nvim-cmp
    cmp-buffer
    cmp-path
    cmp-nvim-lsp
    cmp_luasnip
    luasnip

    (nvim-treesitter.withPlugins (p: [
      p.tree-sitter-nix
      p.tree-sitter-lua
      p.tree-sitter-vim
      p.tree-sitter-python
      p.tree-sitter-bash
    ]))
  ];

  extraLuaConfig = ''
    vim.g.mapleader = " "

    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.termguicolors = true
    vim.opt.cursorline = true
    vim.opt.signcolumn = "yes"

    vim.opt.background = "light"

    require("catppuccin").setup({
      flavour = "mocha",
    })
    vim.cmd.colorscheme("catppuccin")

    require("oil").setup()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          local status, luasnip = pcall(require, "luasnip")
          if status then
            luasnip.lsp_expand(args.body)
          end
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
      }),
    })


    require("lualine").setup({
      options = {
        theme = "catppuccin",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = {
          function()
            return os.date("%H:%M")
          end,
        },
      },
    })

    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
      },
    })


    local logo ={


      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
      [[  ::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::: ]],
      [[  :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+ ]],
      [[  :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ ]],
      [[  +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+ ]],
      [[  +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+ ]],
      [[  #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+# ]],
      [[  ###    #### ########## ########      ###     ########### ###       ### ]],
      [[                                                        ]],
      [[                                                        ]],
      [[                         N I X O S   E D I T I O N                      ]],
      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
    }


      require("dashboard").setup({
      theme = "doom",
      config = {
        header = logo,
        center = {
          {
            icon = "󰈞 ",
            desc = "Find File           ",
            key = "f",
            action = "Telescope find_files",
          },
          {
            icon = "󰝒 ",
            desc = "New File            ",
            key = "n",
            action = "ene | startinsert",
          },
          {
            icon = "󰏇 ",
            desc = "Open File Tree (Oil)",
            key = "e",
            action = "Oil",
          },
          {
            icon = "󰋚 ",
            desc = "Recent Files        ",
            key = "r",
            action = "Telescope oldfiles",
          },
          {
            icon = "󰍉 ",
            desc = "Find Text (Grep)    ",
            key = "g",
            action = "Telescope live_grep",
          },
          {
            icon = "󰈆 ",
            desc = "Quit Neovim         ",
            key = "q",
            action = "qa",
          },
        },
        footer = { "nyanvim / nixos / dmitrj;3333" },
      },
    })


  '';
};

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
