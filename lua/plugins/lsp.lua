return {
  -- Mason: handles LSP/DAP/tool installations
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Bridge between Mason and LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer"}, -- add more here if needed
        automatic_installation = true,
      })
    end,
  },

  -- nvim-lspconfig: core LSP support
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.rust_analyzer.setup({})
    end,
  },
}

