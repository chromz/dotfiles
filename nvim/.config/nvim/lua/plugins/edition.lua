return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require('lspconfig')
      nvim_lsp.gopls.setup{
        cmd = {"gopls", "serve"},
      }
      nvim_lsp.tsserver.setup{}
      nvim_lsp.pyright.setup{}
      nvim_lsp.rust_analyzer.setup{}

      local bufopts = { noremap = true, silent = true }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

    end
  },
  "sheerun/vim-polyglot",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
      },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require'cmp'

      cmp.setup({
          preselect = cmp.PreselectMode.None,
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
              ['<C-u>'] = cmp.mapping.scroll_docs(-4),
              ['<C-d>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
              ['<C-y>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), {'i', 'c'}),
              ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
              ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
            }),
          sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
              { name = 'path' },
              { name = 'buffer' },
            })
        })

      cmp.setup.cmdline('/', {
          sources = {
            { name = 'buffer'}
          }
        })

      cmp.setup.cmdline(':', {
          sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            })
        })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
    end
  },
}
