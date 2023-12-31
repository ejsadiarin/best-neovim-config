local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        -- enabled = vim.fn.executable("make") == 1,
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("fzf")
          end)
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
        -- build = "make",
        -- enabled = vim.fn.executable("make") == 1,
        -- config = function()
        --   Util.on_load("telescope.nvim", function()
        --     require("telescope").load_extension("live-grep-args")
        --   end)
        -- end,
      },
    },
    -- pickers = {
    --   buffers = {
    --     initial_mode = "normal",
    --   },
    -- },
    -- extensions = {
    -- live_grep_args = {
    --   auto_quoting = true, -- enable/disable auto-quoting
    --   -- define mappings, e.g.
    --   mappings = { -- extend mappings
    --     i = {
    --       ["<C-k>"] = require("telescope.builtin").live_grep
    --       ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
    --     },
    --   },
    -- ... also accepts theme settings, for example:
    -- theme = "dropdown", -- use dropdown theme
    -- theme = { }, -- use own theme spec
    -- layout_config = { mirror=true }, -- mirror preview pane
    -- },
    -- },
    keys = {
      { "<leader><space>", ":silent grep ", { silent = false }, desc = "Manual Grep (rg)" },
      {
        "<leader>sg",
        "<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Live Grep with Args (cwd)",
      },
      { "<leader>sG", Util.telescope("live_grep"), desc = "Grep (root/dynamic)" },
      -- { "<leader>sG", require("telescope").extensions.live_grep_args.live_grep_args({ cwd = false }), desc = "Grep (root/dynamic)" },
      -- replaced keymaps:
      -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    },
    config = function()
      Util.on_load("telescope.nvim", function()
        local telescope = require("telescope")
        telescope.load_extension("live_grep_args")
      end)
    end,
  },
}
