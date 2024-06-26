-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Some OS detectors
local is_wsl = vim.fn.has("wsl") == 1

local opt = vim.opt

-- Indent blankline
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣", eol = "↴" }

-- which-key
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.mouse = ""

-- undotree
vim.o.undofile = true

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

-- lsp
local lsp = vim.lsp
local handlers = lsp.handlers

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

-- clipboard with win32yank.exe
-- https://github.com/equalsraf/win32yank/releases
-- chmod +x and copy in win32yank into /usr/bin/win32yank.exe
if is_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
