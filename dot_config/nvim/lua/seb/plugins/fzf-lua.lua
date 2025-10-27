return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { 'nvim-mini/mini.icons' },
  opts = {
    'hide',
    oldfiles = {
      include_current_session = true,
    },
  },
  keys = {
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      desc = '[F]ind [F]iles in Project Directory',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = '[F]ind by [G]rep in Project Directory',
    },
    {
      '<leader><leader>',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'Find existing buffers',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[F]ind [R]esume last fzf-lua picker',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').lgrep_curbuf()
      end,
      desc = '[/] Live grep the current buffer',
    },
    {
      '<leader>fo',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[F]ind [O]ld Files',
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').helptags()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = '[F]ind [K]eymaps',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[F]ind [B]uiltin FZF',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = '[F]ind current [W]ord',
    },
    {
      '<leader>fW',
      function()
        require('fzf-lua').grep_cWORD()
      end,
      desc = '[F]ind current [W]ORD',
    },
    {
      '<leader>fn',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind in [N]eo[V]im configuration',
    },
    {
      '<leader>fd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      desc = '[F]ind [D]iagnostics',
    },
    {
      '<leader>fm',
      function()
        require('fzf-lua').marks()
      end,
      desc = '[F]ind [M]arks',
    },
  },
}
