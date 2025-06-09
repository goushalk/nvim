return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            preview_width = 0.5,
          },
          sorting_strategy = "ascending",
          prompt_prefix = "🔍 ",
        },
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({
            layout_config = {
              width = 0.4,
            },
            previewer = false,
          }),
        },
      })

      -- Load the UI-Select extension
      telescope.load_extension("ui-select")

      -- 🔥 Keymaps
      vim.keymap.set("n", "<C-p>", function()
        require("telescope.builtin").find_files({ hidden = true })
      end, { desc = "Find Files (incl. hidden)" })

      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    end,
  }
}

