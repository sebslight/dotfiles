return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<C-f>',
          dismiss = '<C-\\>',
        },
      },
      filetypes = {
        -- Enable for most filetypes by default
        ['*'] = true,
        -- Disable for specific filetypes
        markdown = false,
        env = false,
        -- Examples to disable if desired:
        -- help = false,
        -- TelescopePrompt = false,
      },
    }
  end,
}
