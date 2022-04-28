local M = {}

function datetime()
  return os.date('%B %d / %I:%M %p')
end

function git_name()
  local handle = io.popen('git config user.name')
  local output = handle:read('*a')
  local result = output:gsub('[^a-zA-Z _-0-9]', '')
  handle:close()
  return result
end

function M.config()
  require'lualine'.setup({
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(str) return str:sub(1,1) end
        }
      },
      lualine_b = { 'branch' },
      lualine_c = {
        {
          'filename',
          path = 1,
        },
        {
          'diagnostics',
          sources = { 'coc' },
          sections = { 'error', 'warn', 'info', 'hint' },
          diagnostics_color = {
            error = 'DiagnosticError',
            warn  = 'DiagnosticWarn',
            info  = 'DiagnosticInfo',
            hint  = 'DiagnosticHint',
          },
          colored = true,
          update_in_insert = true,
          always_visible = false,
        }
      },
      lualine_x = { { git_name } },
      lualine_y = { 'location' },
      lualine_z = { { datetime } },
    },
    inactive_sections = {}
  })
end

return M

