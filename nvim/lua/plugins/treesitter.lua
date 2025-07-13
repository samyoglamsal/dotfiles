return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  init = function ()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "javascript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go", "python" },
      ignore_install = {},
      modules = {},
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,

      highlight = {
        enable = true,
      },
    })
  end,
}
