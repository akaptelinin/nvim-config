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

vim.keymap.set({ "i", "v", "n", "o", "c" }, "<C-х>", "<Esc>", { noremap = true })

vim.keymap.set({ "n", "v" }, "Ж", ":", { noremap = true })

vim.keymap.set("n", "<leader>ц", "<leader>w", { remap = true })

vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "о", "gj", { noremap = true })
vim.keymap.set("n", "л", "gk", { noremap = true })

vim.keymap.set("n", "<leader>[", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>]", "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { noremap = true, desc = "Yank line to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", "d", { noremap = true, desc = "Delete to register" })
vim.keymap.set({ "n", "v" }, "d", [["_d]], { noremap = true })
vim.keymap.set("n", "dd", [["_dd]], { noremap = true })
vim.keymap.set("n", "D", [["_D]], { noremap = true })
vim.keymap.set({ "n", "v" }, "x", [["_x]], { noremap = true })
vim.keymap.set({ "n", "v" }, "c", [["_c]], { noremap = true })
vim.keymap.set("n", "cc", [["_cc]], { noremap = true })
vim.keymap.set("n", "C", [["_C]], { noremap = true })

vim.keymap.set("n", "<leader>h", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, desc = "Search & replace word" })

vim.keymap.set("x", "p", [["_dP]], { noremap = true })
vim.keymap.set("x", "<leader>p", "p", { noremap = true, desc = "Paste (overwrite register)" })

vim.keymap.set("n", "<leader>T", "<cmd>terminal<cr>", { noremap = true, desc = "Terminal" })

vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { noremap = true, desc = "New buffer" })

local function reveal_in_finder()
  local ft = vim.bo.filetype
  local file_path = nil

  if ft:match("^snacks_picker") then
    local ok, Snacks = pcall(require, "snacks")
    if ok and Snacks.picker then
      local pickers = Snacks.picker.get()
      local picker = pickers and pickers[1]
      if picker then
        local item = picker:current()
        if item and item.file then
          file_path = item.file
          if not file_path:match("^/") then
            file_path = vim.fn.getcwd() .. "/" .. file_path
          end
        end
      end
    end
  elseif ft == "snacks_explorer" then
    local ok, Snacks = pcall(require, "snacks")
    if ok and Snacks.explorer then
      local tree = Snacks.explorer.get()
      if tree then
        local node = tree:current()
        if node and node.path then
          file_path = node.path
        end
      end
    end
  end

  if file_path and (vim.fn.filereadable(file_path) == 1 or vim.fn.isdirectory(file_path) == 1) then
    vim.fn.system({ "open", "-R", file_path })
  else
    vim.notify("No file selected", vim.log.levels.WARN)
  end
end

vim.keymap.set("n", "<leader>F", reveal_in_finder, { noremap = true, desc = "Reveal in Finder" })
