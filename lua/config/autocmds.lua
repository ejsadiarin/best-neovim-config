-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1d2021]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=#fbf1c7 guibg=#1d2021]])

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

-- :h hi
-- https://stackoverflow.com/questions/7103173/vim-how-to-change-the-highlight-color-for-search-hits-and-quickfix-selection
-- for GUI:
--hi Search guibg=peru guifg=wheat
-- for terminals:
--hi Search cterm=NONE ctermfg=grey ctermbg=blue
vim.api.nvim_set_hl(0, "FidgetTitle", { link = "NormalFloat" })
vim.api.nvim_set_hl(0, "FidgetTask", { link = "NormalFloat" })

-- prints diagnostics on message area, has problems if diagnostic has too many messages
-- function PrintDiagnostics(opts, bufnr, line_nr, client_id)
--   bufnr = bufnr or 0
--   line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
--   opts = opts or { ["lnum"] = line_nr }
--
--   local line_diagnostics = vim.diagnostic.get(bufnr, opts)
--   if vim.tbl_isempty(line_diagnostics) then
--     return
--   end
--
--   local diagnostic_message = ""
--   for i, diagnostic in ipairs(line_diagnostics) do
--     diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
--     print(diagnostic_message)
--     if i ~= #line_diagnostics then
--       diagnostic_message = diagnostic_message .. "\n"
--     end
--   end
--   vim.api.nvim_echo({ { diagnostic_message, "Normal" } }, false, {})
-- end
--
-- vim.cmd([[ autocmd! CursorHold * lua PrintDiagnostics() ]])

-- -- LSP settings (for overriding per client)
-- local handlers = {
--   ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
--   ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
-- }

-- Do not forget to use the on_attach function
-- require("lspconfig").myserver.setup({ handlers = handlers })

-- -- To instead override globally
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or border
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

-- require("lspconfig").myservertwo.setup({})

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  silent = true,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

-- ref: https://gist.github.com/timmyha/b611a8e34a4f8d13cb52ae755dbfef2c
-- reddit ref: https://gist.github.com/timmyha/b611a8e34a4f8d13cb52ae755dbfef2c
vim.diagnostic.config({
  virtual_text = true,
  float = {
    header = false,
    border = "rounded",
    focusable = true,
  },
})

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
-- function OpenDiagnosticIfNoFloat()
--   for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
--     if vim.api.nvim_win_get_config(winid).zindex then
--       return
--     end
--   end
--   -- THIS IS FOR BUILTIN LSP
--   vim.diagnostic.open_float(nil, {
--     scope = "cursor",
--     focusable = false,
--     close_events = {
--       "CursorMoved",
--       "CursorMovedI",
--       "BufHidden",
--       "InsertCharPre",
--       "WinLeave",
--     },
--   })
-- end
-- -- Show diagnostics under the cursor when holding position
-- vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
--   pattern = "*",
--   command = "lua OpenDiagnosticIfNoFloat()",
--   group = "lsp_diagnostics_hold",
-- })

local M = {}

M.icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end

return M
