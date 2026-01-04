-- Keymaps are automatically loaded before lazy.nvim startup
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- HACK: Escape and Alt+[ get hijacked by some unholy nvim/lazyvim/snacks cache demon
-- that survives config resets, cache wipes, and even full system reboots.
-- The only way to restore default terminal behavior is to explicitly remap them to themselves.
-- I hate this editor with every fiber of my being.
vim.keymap.set('t', '<Esc>', '<Esc>', { noremap = true })
vim.keymap.set('t', '<A-[>', '<A-[>', { noremap = true })

vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<C-х>', '<C-\\><C-n>', { noremap = true })

vim.keymap.set({ "n", "x" }, "s", "s", { noremap = true, desc = "Substitute char" })

vim.keymap.set({ "i", "v", "n", "o", "c" }, "<C-х>", "<Esc>", { noremap = true })

vim.keymap.set({ "n", "v" }, "Ж", ":", { noremap = true })

vim.keymap.set("n", "<leader>ц", "<leader>w", { remap = true })

vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "о", "gj", { noremap = true })
vim.keymap.set("n", "л", "gk", { noremap = true })

vim.keymap.set("n", "<leader>[", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>]", "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { noremap = true, silent = true })
