-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local umap = vim.keymap.del

map("i", "jj", "<Esc>", { desc = "Escape to normal", remap = false })

-- display variable/function information
map("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
-- go to function
map("n", "gf", "<Cmd>Lspsaga goto_definition<CR>")
-- List variable/function
-- open keymap:'o'
map("n", "fd", "<Cmd>Lspsaga finder tyd+ref+imp+def<CR>")

-- EasyMotion
map("n", "<leader><leader>f", "<Plug>(easymotion-f)")
map("n", "<leader><leader>F", "<Plug>(easymotion-F)")
map("n", "<leader><leader>t", "<Plug>(easymotion-t)")
map("n", "<leader><leader>T", "<Plug>(easymotion-T)")
map("n", "<leader><leader>w", "<Plug>(easymotion-w)")
map("n", "<leader><leader>W", "<Plug>(easymotion-W)")
map("n", "<leader><leader>b", "<Plug>(easymotion-b)")
map("n", "<leader><leader>B", "<Plug>(easymotion-B)")
map("n", "<leader><leader>e", "<Plug>(easymotion-e)")
map("n", "<leader><leader>E", "<Plug>(easymotion-E)")
map("n", "<leader><leader>ge", "<Plug>(easymotion-ge)")
map("n", "<leader><leader>gE", "<Plug>(easymotion-gE)")
map("n", "<leader><leader>j", "<Plug>(easymotion-j)")
map("n", "<leader><leader>k", "<Plug>(easymotion-k)")
map("n", "<leader><leader>n", "<Plug>(easymotion-n)")
map("n", "<leader><leader>N", "<Plug>(easymotion-N)")
map("n", "<leader><leader>s", "<Plug>(easymotion-s)")

-- Clipboard
umap({ "n", "v" }, "s")
map({ "n", "v" }, "sy", '"dy', { remap = true, silent = true })
map({ "n", "v" }, "Y", '"+y', { remap = true, silent = true })
map("n", "sp", '"dp', { remap = true, silent = true })
map("n", "sP", '"dP', { remap = true, silent = true })
map("v", "sp", '"dpgvy', { remap = true, silent = true })
map("v", "sP", '"dPgvy', { remap = true, silent = true })
map({ "n", "v" }, "<leader><leader>p", '"+p', { remap = true, silent = true })
map({ "n", "v" }, "<leader><leader>P", '"+P', { remap = true, silent = true })
