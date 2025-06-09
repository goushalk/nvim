return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            icon = '  ',
            desc = 'New File',
            group = '@property',
            action = 'enew',
            key = 'n'
          },
          {
            icon = '󰈞  ',
            desc = 'Find Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f'
          },
          {
            icon = '󰊄  ',
            desc = 'Projects',
            group = 'DiagnosticHint',
            action = 'Telescope projects',
            key = 'p'
          },
          {
            icon = '  ',
            desc = 'Recent Files',
            group = 'Number',
            action = 'Telescope oldfiles',
            key = 'r'
          },
          {
            icon = '  ',
            desc = 'Settings',
            group = 'Number',
            action = 'edit ~/.config/nvim/init.lua',
            key = 's'
          },
        },
        footer = { '⚡ JellyBean with NeoVim ⚡' }
      }
    }
  end
}


