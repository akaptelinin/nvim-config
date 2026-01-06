-- Keyboard layout indicator for lualine (RU when Russian, empty otherwise)
-- Requires: https://github.com/akaptelinin/im-daemon

-- Set to false to disable
local enabled = true

if not enabled then
  return {}
end

local socket_path = vim.fn.expand("~/.local/run/im-daemon.sock")
local current_layout = ""
local pipe = nil
local reconnect_timer = nil

local function update_layout(data)
  if not data then return end
  local layout = data:gsub("%s+", "")
  if layout ~= "" and layout ~= current_layout then
    current_layout = layout
    vim.schedule(function()
      require("lualine").refresh()
    end)
  end
end

local function connect()
  if pipe then
    pcall(function() pipe:close() end)
    pipe = nil
  end

  pipe = vim.loop.new_pipe(false)

  pipe:connect(socket_path, function(err)
    if err then
      pipe:close()
      pipe = nil
      if not reconnect_timer then
        reconnect_timer = vim.loop.new_timer()
      end
      reconnect_timer:start(1000, 0, vim.schedule_wrap(connect))
      return
    end

    pipe:write("subscribe")

    pipe:read_start(function(read_err, data)
      if read_err or not data then
        if pipe then
          pcall(function() pipe:close() end)
          pipe = nil
        end
        if not reconnect_timer then
          reconnect_timer = vim.loop.new_timer()
        end
        reconnect_timer:start(1000, 0, vim.schedule_wrap(connect))
        return
      end
      update_layout(data)
    end)
  end)
end

vim.defer_fn(connect, 100)

local function is_ru()
  return current_layout:find("Russian") ~= nil
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, 1, {
      function()
        return is_ru() and "RUSSIAN_LAYOUT" or ""
      end,
      color = { fg = "red" },
    })
  end,
}
