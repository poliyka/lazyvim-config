-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<Esc>", { desc = "Escape to normal", remap = false })

-- display variable/function information
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
-- go to function
vim.keymap.set("n", "gf", "<Cmd>Lspsaga goto_definition<CR>")
-- List variable/function
-- open keymap:'o'
vim.keymap.set("n", "fd", "<Cmd>Lspsaga finder tyd+ref+imp+def<CR>")
