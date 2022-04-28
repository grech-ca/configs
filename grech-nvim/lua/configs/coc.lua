local M = {}

local g = vim.g

function M.config()
  g.coc_global_extensions = {
    'coc-css',
    'coc-diagnostic',
    'coc-emmet',
    'coc-eslint',
    'coc-git',
    'coc-html',
    'coc-json',
    'coc-pairs',
    'coc-sh',
    'coc-snippets',
    'coc-svg',
    'coc-tsserver',
  }

  g.coc_snippet_next = '<tab>'
end

return M

