-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a nerd font
        mappings = vim.g.have_nerd_font,
        -- if you are using a nerd font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined nerd font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          up = '<up> ',
          down = '<down> ',
          left = '<left> ',
          right = '<right> ',
          c = '<c-…> ',
          m = '<m-…> ',
          d = '<d-…> ',
          s = '<s-…> ',
          cr = '<cr> ',
          esc = '<esc> ',
          scrollwheeldown = '<scrollwheeldown> ',
          scrollwheelup = '<scrollwheelup> ',
          nl = '<nl> ',
          bs = '<bs> ',
          space = '<space> ',
          tab = '<tab> ',
          f1 = '<f1>',
          f2 = '<f2>',
          f3 = '<f3>',
          f4 = '<f4>',
          f5 = '<f5>',
          f6 = '<f6>',
          f7 = '<f7>',
          f8 = '<f8>',
          f9 = '<f9>',
          f10 = '<f10>',
          f11 = '<f11>',
          f12 = '<f12>',
        },
      },

      -- document existing key chains
      spec = {
        { '<leader>s', group = '[s]earch' },
        { '<leader>t', group = '[t]oggle' },
        { '<leader>n', group = '[n]eotest' },
        { '<leader>h', group = 'git [h]unk', mode = { 'n', 'v' } },
        {
          mode = { 'o', 'v' },

          -- Group for "[a]round" text objects
          { 'a', group = '[A]round' },
          { 'aa', desc = 'Argument' },
          { 'ac', desc = 'Class' },
          { 'af', desc = 'Function' },
          { 'al', desc = 'Loop' },
          { 'at', desc = 'Tag / Comment' },

          -- Group for "[i]nside" text objects
          { 'i', group = '[I]nside' },
          { 'ia', desc = 'Argument' },
          { 'ic', desc = 'Class' },
          { 'if', desc = 'Function' },
          { 'il', desc = 'Loop' },
          { 'it', desc = 'Tag / Comment' },
        },

        -- Defines a block of mappings for Normal mode
        {
          mode = 'n',

          -- Group for "Previous" movements
          { '[', group = 'Previous' },
          { '[c', desc = 'Previous class start' },
          { '[C', desc = 'Previous class end' },
          { '[f', desc = 'Previous function start' },
          { '[F', desc = 'Previous function end' },

          -- Group for "Next" movements
          { ']', group = 'Next' },
          { ']c', desc = 'Next class start' },
          { ']C', desc = 'Next class end' },
          { ']f', desc = 'Next function start' },
          { ']F', desc = 'Next function end' },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
-- note: plugins can also be configured to run lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
