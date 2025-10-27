return {
  'akinsho/bufferline.nvim',
  lazy = false,
  config = function()
    require('bufferline').setup {
      options = {
        diagnostics = false, -- Disable diagnostics
        separator_style = 'thin',
        modified_icon = '●', -- Show dot for modified files
        show_buffer_close_icons = true,
        close_command = function(bufnum)
          Snacks.bufdelete.delete(bufnum)
        end,
        right_mouse_command = function(bufnum)
          Snacks.bufdelete.delete(bufnum)
        end,
      },
    }
    
    -- Keymaps for buffer navigation
    vim.keymap.set('n', 'H', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    vim.keymap.set('n', 'L', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
  end,
}