return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<leader>F"] = { "reveal_in_finder", mode = { "n" } },
          },
        },
        list = {
          keys = {
            ["<leader>F"] = { "reveal_in_finder", mode = { "n" } },
          },
        },
      },
      actions = {
        reveal_in_finder = function(picker)
          local item = picker:current()
          if item and item.file then
            local file_path = item.file
            if not file_path:match("^/") then
              file_path = vim.fn.getcwd() .. "/" .. file_path
            end
            if vim.fn.filereadable(file_path) == 1 or vim.fn.isdirectory(file_path) == 1 then
              vim.fn.system({ "open", "-R", file_path })
            end
          end
        end,
      },
    },
    explorer = {
      win = {
        keys = {
          ["<leader>F"] = { "reveal_in_finder", mode = { "n" } },
        },
      },
      actions = {
        reveal_in_finder = function(tree)
          local node = tree:current()
          if node and node.path then
            if vim.fn.filereadable(node.path) == 1 or vim.fn.isdirectory(node.path) == 1 then
              vim.fn.system({ "open", "-R", node.path })
            end
          end
        end,
      },
    },
  },
}
