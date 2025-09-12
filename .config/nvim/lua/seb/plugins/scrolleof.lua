return {
  'Aasim-A/scrollEOF.nvim',
  event = { 'CursorMoved', 'WinScrolled' },
  opts = {
    pattern = '*',
    insert_mode = true, -- Enable in insert mode so you have padding while typing
    floating = true,
    disabled_filetypes = { 'terminal', 'help', 'nofile' },
    disabled_modes = { 't' },
  },
}