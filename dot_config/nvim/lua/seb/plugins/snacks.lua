-- lazy.nvim
return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  ---@type snacks.Config
  opts = {
    dashboard = {
      -- your dashboard configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      preset = {
        header = [[
      ___           ___           ___                                    ___     
     /__/\         /  /\         /  /\          ___        ___          /__/\    
     \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   
      \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  
  _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ 
 /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\
 \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
  \  \:\  ~~~   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      
   \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     
    \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    
  \__\/         \__\/         \__\/           ~~~~                   \__\/]],
      },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    toggle = { enabled = true },
    scroll = { enabled = true },
    picker = { enabled = true },
    bufdelete = { enabled = true },
  },
  keys = {
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
  },
}
