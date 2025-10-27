return {
  { -- you can easily change to a different colorscheme.
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        transparent = true,
        styles = {
          comments = { italic = false }, -- disable italics in comments
          sidebars = 'transparent',
          floats = 'transparent',
        },
      }

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
