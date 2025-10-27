return {
  'nvim-treesitter/nvim-treesitter-textobjects',

  -- Make sure this plugin is lazy-loaded after the main treesitter plugin
  dependencies = { 'nvim-treesitter/nvim-treesitter' },

  -- No config function is needed here.
  -- The configuration is handled by the main nvim-treesitter setup.
}
