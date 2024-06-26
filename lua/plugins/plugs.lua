return {
  {
    "tpope/vim-surround",
  },
  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
  },
  { "onsails/lspkind-nvim" },
  {
    "bkad/CamelCaseMotion",
  },
  {
    "ggandor/leap.nvim",
    enabled = true,
  },
  -- EasyMotion
  {
    "easymotion/vim-easymotion",
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
      vim.g.indent_blankline_show_current_context = true
      vim.g.indent_blankline_show_current_context_start = true
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    opts = {
      error_sign = "",
      warn_sign = "",
      hint_sign = "",
      infor_sign = "",
      border_style = "round",
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      lspkind.init({
        symbol_map = {
          Copilot = "",
        },
      })

      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

      opts.completion = {
        autocomplete = false,
      }

      opts.sources = {
        -- Copilot Source
        { name = "copilot", group_index = 2 },
        -- Other Sources
        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "luasnip", group_index = 2 },
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.formatting = {
        fields = { "abbr", "kind", "menu" },
        expandable_indicator = true,
        format = lspkind.cmp_format({
          mode = "symbol",
          with_text = false,
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
        }),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-i>"] = cmp.mapping(function(fallback)
          if not cmp.visible() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-Space"] = cmp.mapping(function(fallback)
          cmp.complete({
            config = {
              sources = {
                { name = "copilot" },
              },
            },
          })
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  -- Toggle Term
  {
    "akinsho/toggleterm.nvim",
    config = true,
  },

  -- Undo-Tree
  {
    "jiaoshijie/undotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    lazy = true,
  },
  {
    "neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_by_name = {
            ".github",
            "package-lock.json",
          },
          never_show = { ".git" },
        },
      },
    },
  },
}
