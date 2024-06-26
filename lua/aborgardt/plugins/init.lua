return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  { -- Activity Tracker client for NeoVim
    'vonpb/aw-watcher.nvim',
    config = function()
      require('aw-watcher').setup()
    end,
  },
  { -- LazyGit in my NeoVim
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  { -- Jump around like a kangaroo
    'ggandor/leap.nvim',
    lazy = false,
    opts = {
      case_sensitive = false,
      safe_labels = {},
      max_phase_one_targets = 0,
      max_highlighted_traversal_targets = 10,
      labels = 'jklasdfghqwertyuiopzxcvbnm',
    },

    config = function(_, opts)
      local leap = require 'leap'
      leap.setup(opts)

      -- Bidirectional search
      vim.keymap.set('n', 's', function()
        leap.leap { target_windows = { vim.api.nvim_get_current_win() } }
      end)
      vim.keymap.set('x', 's', function()
        leap.leap { target_windows = { vim.api.nvim_get_current_win() } }
      end)
    end,
  },
  { -- small and pretty status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
    config = function()
      require('lualine').setup { options = { theme = 'catppuccin' } }
    end,
  },
  { -- file tree and open buffer list
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>e', ':Neotree filesystem toggle left<CR>', {})
      vim.keymap.set('n', '<leader>v', ':Neotree buffers toggle right<CR>', {})
    end,
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
}
