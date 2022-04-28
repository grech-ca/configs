local M = {}

local Terminal = require('toggleterm.terminal').Terminal

local terminals = {
  lazygit = Terminal:new {
    cmd = 'lazygit',
    direction = 'float',
    hidden = false,
    float_opts = {
      width = vim.o.columns,
      height = vim.o.lines,
    },
  },
  regular = Terminal:new {
    direction = 'float',
  },
}

function M.toggle_term(name)
  local term = terminals[name]
  if term then
    term:toggle()
  end
end

function M.config()
  require'toggleterm'.setup {}

  vim.api.nvim_create_user_command(
    'TglTrm',
    function(opts)
      local term_name = opts.args
      if term_name then
        M.toggle_term(term_name)
      else
        M.toggle_term('regular')
      end
    end,
    {
      nargs = 1,
    }
  )
end

return M

