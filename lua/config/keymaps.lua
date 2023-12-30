-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

local util = require("lazyvim.util")

-- remap normal mode to "kj" when insert mode
vim.keymap.set("i", "kj", "<ESC>", { silent = true })
vim.keymap.set("n", "<TAB>", "<C-W>w")
vim.keymap.set("n", "<S-TAB>", "<C-W>W")

-- unpolluted paste (access paste without "dd" buffer pollute)
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Unpolluted Paste" })

-- center cursor when scrolling up and down via keymaps
vim.keymap.set("n", "<C-U>", "<C-U>zz")
vim.keymap.set("n", "<C-D>", "<C-D>zz")

-- colorizer keymap
vim.keymap.set("n", "<leader>cc", "<CMD>ColorizerToggle<CR>")

-- Save without formatting
vim.keymap.set("n", "<leader>cs", ":noautocmd w<CR>", { desc = "Save without formatting" })

-- Terminal with border
local lazyterm = function()
  util.terminal(nil, { cwd = util.root(), border = "rounded" })
end
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Harpoon marks
-- vim.keymap.set("n", "<leader>fh", "<CMD>Telescope harpoon marks<CR>", { desc = "Find Harpoon Marks in Project" })
vim.keymap.set("n", "<leader>fh", require("harpoon.ui").toggle_quick_menu, { desc = "Find Harpoon Marks in Project" })
vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Harpoon add mark" })
vim.keymap.set("n", "<c-n>", require("harpoon.ui").nav_next, {})
vim.keymap.set("n", "<c-p>", require("harpoon.ui").nav_prev, {})
vim.keymap.set(
  "n",
  "<leader>h1",
  '<CMD>lua require("harpoon.ui").nav_file(1)<CR>',
  { desc = "Navigate to harpoon buffer 1" }
)
vim.keymap.set("n", "<leader>h2", '<CMD>lua require("harpoon.ui").nav_file(2)<CR>', { desc = "...buffer 2" })
vim.keymap.set("n", "<leader>h3", '<CMD>lua require("harpoon.ui").nav_file(3)<CR>', { desc = "...buffer 3" })
vim.keymap.set("n", "<leader>h4", '<CMD>lua require("harpoon.ui").nav_file(4)<CR>', { desc = "...buffer 4" })
vim.keymap.set("n", "<leader>h5", '<CMD>lua require("harpoon.ui").nav_file(5)<CR>', { desc = "...buffer 5" })
vim.keymap.set("n", "<leader>h6", '<CMD>lua require("harpoon.ui").nav_file(6)<CR>', { desc = "...buffer 6" })
vim.keymap.set("n", "<leader>h7", '<CMD>lua require("harpoon.ui").nav_file(7)<CR>', { desc = "...buffer 7" })
vim.keymap.set("n", "<leader>h8", '<CMD>lua require("harpoon.ui").nav_file(8)<CR>', { desc = "...buffer 8" })
vim.keymap.set("n", "<leader>h9", '<CMD>lua require("harpoon.ui").nav_file(9)<CR>', { desc = "...buffer 9" })

-- multiple cursors/ visual-multi (https://github.com/mg979/vim-visual-multi/wiki/Mappings)
vim.keymap.set("n", "<leader>vm", "<Plug>(VM-Find-Under)", { desc = "Start Visual Multi" })
vim.keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)", { desc = "VM mode Cursor Down" })
vim.keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)", { desc = "VM mode Cursor Up" })
vim.keymap.set("n", "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)", { desc = "Multi line cursor" })
vim.keymap.set("n", "<C-RightMouse>", "<Plug>(VM-Mouse-Word)", { desc = "Multi line cursor" })
vim.keymap.set("n", "<M-C-RightMouse>", "<Plug>(VM-Mouse-Column)", { desc = "Multi line cursor" })
-- visual multi specific options
-- vim.g.VM_maps = {}
-- vim.g.VM_maps['Find Under']                  = '<C-n>'
-- vim.g.VM_maps['Find Subword Under']          = '<C-n>'
-- vim.g.VM_maps["Select All"]                  = '\\A'
-- vim.g.VM_maps["Start Regex Search"]          = '\\/'
-- vim.g.VM_maps["Add Cursor Down"]             = '<C-Down>'
-- vim.g.VM_maps["Add Cursor Up"]               = '<C-Up>'
-- vim.g.VM_maps["Add Cursor At Pos"]           = '\\\'

-- vim.g.VM_maps["Visual Regex"]                = '\\/'
-- vim.g.VM_maps["Visual All"]                  = '\\A'
-- vim.g.VM_maps["Visual Add"]                  = '\\a'
-- vim.g.VM_maps["Visual Find"]                 = '\\f'
-- vim.g.VM_maps["Visual Cursors"]              = '\\c'

-- vim.g.VM_maps["Switch Mode"]                 = '<Tab>'
-- vim.g.VM_maps["Find Next"]                   = ']'
-- vim.g.VM_maps["Find Prev"]                   = '['
-- vim.g.VM_maps["Goto Next"]                   = '}'
-- vim.g.VM_maps["Goto Prev"]                   = '{'
-- vim.g.VM_maps["Seek Next"]                   = '<C-f>'
-- vim.g.VM_maps["Seek Prev"]                   = '<C-b>'
-- vim.g.VM_maps["Skip Region"]                 = 'q'
-- vim.g.VM_maps["Remove Region"]               = 'Q'
-- vim.g.VM_maps["Invert Direction"]            = 'o'
-- vim.g.VM_maps["Find Operator"]               = "m"
-- vim.g.VM_maps["Surround"]                    = 'S'
-- vim.g.VM_maps["Replace Pattern"]             = 'R'

-- vim.g.VM_maps["Tools Menu"]                  = '\\`'
-- vim.g.VM_maps["Show Registers"]              = '\\"'
-- vim.g.VM_maps["Case Setting"]                = '\\c'
-- vim.g.VM_maps["Toggle Whole Word"]           = '\\w'
-- vim.g.VM_maps["Transpose"]                   = '\\t'
-- vim.g.VM_maps["Align"]                       = '\\a'
-- vim.g.VM_maps["Duplicate"]                   = '\\d'
-- vim.g.VM_maps["Rewrite Last Search"]         = '\\r'
-- vim.g.VM_maps["Merge Regions"]               = '\\m'
-- vim.g.VM_maps["Split Regions"]               = '\\s'
-- vim.g.VM_maps["Remove Last Region"]          = '\\q'
-- vim.g.VM_maps["Visual Subtract"]             = '\\s'
-- vim.g.VM_maps["Case Conversion Menu"]        = '\\C'
-- vim.g.VM_maps["Search Menu"]                 = '\\S'

-- vim.g.VM_maps["Run Normal"]                  = '\\z'
-- vim.g.VM_maps["Run Last Normal"]             = '\\Z'
-- vim.g.VM_maps["Run Visual"]                  = '\\v'
-- vim.g.VM_maps["Run Last Visual"]             = '\\V'
-- vim.g.VM_maps["Run Ex"]                      = '\\x'
-- vim.g.VM_maps["Run Last Ex"]                 = '\\X'
-- vim.g.VM_maps["Run Macro"]                   = '\\@'
-- vim.g.VM_maps["Align Char"]                  = '\\<'
-- vim.g.VM_maps["Align Regex"]                 = '\\>'
-- vim.g.VM_maps["Numbers"]                     = '\\n'
-- vim.g.VM_maps["Numbers Append"]              = '\\N'
-- vim.g.VM_maps["Zero Numbers"]                = '\\0n'
-- vim.g.VM_maps["Zero Numbers Append"]         = '\\0N'
-- vim.g.VM_maps["Shrink"]                      = "\\-"
-- vim.g.VM_maps["Enlarge"]                     = "\\+"

-- vim.g.VM_maps["Toggle Block"]                = '\\<BS>'
-- let g:VM_maps["Toggle Single Region"]        = '\\<CR>'
-- let g:VM_maps["Toggle Multiline"]            = '\\M'
