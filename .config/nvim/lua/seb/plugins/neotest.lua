-- Neotest: test running UI + adapters
-- Adapters: Python (pytest/unittest) and Go
return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/nvim-nio',
      -- Optional, improves CursorHold behavior for virtual text updates
      'antoinemadec/FixCursorHold.nvim',
      -- Adapters
      'nvim-neotest/neotest-python',
      'fredrikaverpil/neotest-golang',
    },
    keys = {
      {
        '<leader>nr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Neotest: Run [n]earest',
      },
      {
        '<leader>nf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Neotest: Run current [f]ile',
      },
      {
        '<leader>nR',
        function()
          require('neotest').run.run_last()
        end,
        desc = 'Neotest: [R]un last',
      },
      {
        '<leader>nd',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = 'Neotest: [d]ebug nearest (DAP)',
      },
      {
        '<leader>nS',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Neotest: [S]top',
      },
      {
        '<leader>ns',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Neotest: Toggle [s]ummary',
      },
      {
        '<leader>no',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = 'Neotest: Open [o]utput',
      },
      {
        '<leader>nO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Neotest: Toggle [O]utput panel',
      },
      {
        '<leader>na',
        function()
          require('neotest').run.attach()
        end,
        desc = 'Neotest: [a]ttach',
      },
    },
    config = function()
      -- Recommended: make neotest diagnostics readable in virtual text
      local neotest_ns = vim.api.nvim_create_namespace('neotest')
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message
              :gsub('\n', ' ')
              :gsub('\t', ' ')
              :gsub('%s+', ' ')
              :gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)

      local neotest = require 'neotest'

      neotest.setup({
        adapters = {
          require('neotest-python') {
            -- Tries pytest, falls back to unittest
            -- Set to a string path if you need a venv python
            python = vim.g.python3_host_prog or 'python3',
            -- runner = 'pytest', -- uncomment to force pytest
          },
          require('neotest-golang')({
            -- keep defaults; see :h neotest-golang-options
            -- examples:
            -- runner = 'go',
            -- go_test_args = { '-v', '-race', '-count=1' },
          }),
        },
        -- Basic UI tweaks
        quickfix = {
          enabled = true,
          open = false,
        },
        output = { open_on_run = false },
        discovery = {
          enabled = true,
        },
      })
    end,
  },
}
