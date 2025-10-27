return {
  'supermaven-inc/supermaven-nvim',
  event = 'InsertEnter',
  config = function()
    require('supermaven-nvim').setup {
      -- Supermaven has no panel; inline suggestions only
      keymaps = {
        -- Match previous Copilot keybindings
        accept_suggestion = '<C-f>',
        accept_word = "<C-'>",
        clear_suggestion = '<C-\\>',
      },
      -- Enable everywhere by default, ignore specific filetypes
      ignore_filetypes = {
        markdown = true,
        -- go = true,
        env = true,
      },
      -- Keep inline suggestions enabled (similar to Copilot's auto_trigger)
      disable_inline_completion = false,
      -- Use built-in keymaps defined above
      disable_keymaps = false,
    }
  end,
}
