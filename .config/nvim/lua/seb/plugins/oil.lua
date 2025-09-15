return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
  },
  dependencies = { 'echasnovski/mini.icons' },
  lazy = false,
}
