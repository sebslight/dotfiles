-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
--

-- Close side panels and helper buffers with q or <Esc>
-- Inspired by LazyVim's behavior
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('close-with-q-esc', { clear = true }),
  pattern = {
    'PlenaryTestPopup',
    'checkhealth',
    'dbout',
    'gitsigns-blame',
    'grug-far',
    'help',
    'lspinfo',
    'man',
    'neotest-output',
    'neotest-output-panel',
    'neotest-summary',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    -- Extras you use
    'neo-tree',
    'oil',
    'dap-float',
    'dap-repl',
    'dapui_watches',
    'dapui_breakpoints',
    'dapui_stacks',
    'dapui_scopes',
    'noice',
    'lazy',
    'mason',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    local opts = { buffer = event.buf, silent = true, nowait = true, desc = 'Close window' }
    vim.keymap.set('n', 'q', function()
      pcall(vim.cmd.close)
      pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
    end, opts)
    vim.keymap.set('n', '<esc>', function()
      pcall(vim.cmd.close)
    end, opts)
  end,
})

-- Close any floating window with <Esc> or q (buffer-local)
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter' }, {
  group = vim.api.nvim_create_augroup('close-floats-with-esc', { clear = true }),
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg and cfg.relative and cfg.relative ~= '' then
      local buf = vim.api.nvim_win_get_buf(win)
      vim.bo[buf].buflisted = false
      local opts = { buffer = buf, silent = true, nowait = true }
      local function close_if_float()
        local w = vim.api.nvim_get_current_win()
        local c = vim.api.nvim_win_get_config(w)
        if c and c.relative and c.relative ~= '' then
          pcall(vim.api.nvim_win_close, w, true)
        else
          pcall(vim.cmd.nohlsearch)
        end
      end
      vim.keymap.set('n', '<esc>', close_if_float, opts)
      vim.keymap.set('n', 'q', function()
        local w = vim.api.nvim_get_current_win()
        local c = vim.api.nvim_win_get_config(w)
        if c and c.relative and c.relative ~= '' then
          pcall(vim.api.nvim_win_close, w, true)
        else
          -- do nothing in normal windows
        end
      end, opts)
    end
  end,
})
