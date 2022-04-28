local M = {}

function M.config()
  local present, notify = pcall(require, "notify")
  if present then
    notify.setup({
      stages = "fade",
      max_height = nil,
    })

    vim.notify = notify
  end
end

return M

