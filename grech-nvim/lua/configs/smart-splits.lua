local M = {}

function M.config()
  local present, smart_splits = pcall(require, "smart-splits")
  if not present then
    return
  end

  smart_splits.setup({
    ignored_filetypes = {
      "nofile",
      "quickfix",
      "qf",
      "prompt",
    },
    ignored_buftypes = { "nofile" },
    move_cursor_same_row = false,
  })
end

return M

