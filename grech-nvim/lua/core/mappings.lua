local M = {}

local utils = require "core.utils"

local map = vim.keymap.set
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Normal --
-- Better window navigation
map("n", "<C-h>", function()
  require("smart-splits").move_cursor_left()
end)
map("n", "<C-j>", function()
  require("smart-splits").move_cursor_down()
end)
map("n", "<C-k>", function()
  require("smart-splits").move_cursor_up()
end)
map("n", "<C-l>", function()
  require("smart-splits").move_cursor_right()
end)

-- Resize with arrows
map("n", "<C-Up>", function()
  require("smart-splits").resize_up()
end)
map("n", "<C-Down>", function()
  require("smart-splits").resize_down()
end)
map("n", "<C-Left>", function()
  require("smart-splits").resize_left()
end)
map("n", "<C-Right>", function()
  require("smart-splits").resize_right()
end)

-- Navigate buffers
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
map("n", "}", "<cmd>BufferLineMoveNext<cr>")
map("n", "{", "<cmd>BufferLineMovePrev<cr>")
map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<cr>')
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<cr>')
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<cr>')
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<cr>')
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<cr>')
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<cr>')
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<cr>')
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<cr>')
map('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<cr>')
map('n', '<leader>0', '<Cmd>BufferLineGoToBuffer 10<cr>')

-- Move text up and down
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==gi")
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==gi")

-- LSP
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition, { desc = "Show the definition of current function" })
map("n", "gI", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "go", vim.diagnostic.open_float)
map("n", "gl", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "gk", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "gj", vim.diagnostic.goto_next)
map("n", "K", vim.lsp.buf.hover)
-- <leader>rn: legacy binding here for backwards compatibility but not in which-key (see <leader>lr)
map("n", "<leader>rn", vim.lsp.buf.rename)

-- ForceWrite
map("n", "<C-s>", "<cmd>w!<CR>")

-- ForceQuit
map("n", "<C-q>", "<cmd>q!<CR>")

-- Standard Operations
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>q", "<cmd>q<CR>")
map("n", "<leader>h", "<cmd>nohlsearch<CR>")

map("n", "<leader>w", "<cmd>Bdelete!<CR>")

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>")
map("n", "<leader>pi", "<cmd>PackerInstall<cr>")
map("n", "<leader>ps", "<cmd>PackerSync<cr>")
map("n", "<leader>pS", "<cmd>PackerStatus<cr>")
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>")

-- CoC
map('n', 'gd', '<Plug>(coc-definition)')
map('n', 'gy', '<Plug>(coc-type-definition)')
map('n', 'gi', '<Plug>(coc-implementation)')
map('n', 'gr', '<Plug>(coc-references)')
map('n', '<leader>la', '<Plug>(coc-codeaction)')

local esc = function(cmd)
  return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return not col or vim.fn.getline('.')[col] ~= '\\s'
end

vim.cmd([[
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction
]])

-- NeoTree 
map("n", "<leader>e", "<cmd>Neotree toggle<CR>")
map("n", "<leader>o", "<cmd>Neotree focus<CR>")

-- Dashboard
map("n", "<leader>d", "<cmd>Dashboard<CR>")
map("n", "<leader>fn", "<cmd>DashboardNewFile<CR>")
map("n", "<leader>Sl", "<cmd>SessionLoad<CR>")
map("n", "<leader>Ss", "<cmd>SessionSave<CR>")

-- GitSigns
map("n", "<leader>gj", function()
  require("gitsigns").next_hunk()
end)
map("n", "<leader>gk", function()
  require("gitsigns").prev_hunk()
end)
map("n", "<leader>gl", function()
  require("gitsigns").blame_line()
end)
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end)
map("n", "<leader>gh", function()
  require("gitsigns").reset_hunk()
end)
map("n", "<leader>gr", function()
  require("gitsigns").reset_buffer()
end)
map("n", "<leader>gs", function()
  require("gitsigns").stage_hunk()
end)
map("n", "<leader>gu", function()
  require("gitsigns").undo_stage_hunk()
end)
map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end)

-- Telescope
map("n", "<leader>fw", function()
  require("telescope.builtin").live_grep()
end)
map("n", "<leader>gt", function()
  require("telescope.builtin").git_status()
end)
map("n", "<leader>gb", function()
  require("telescope.builtin").git_branches()
end)
map("n", "<leader>gc", function()
  require("telescope.builtin").git_commits()
end)
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)
map("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end)
map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end)
map("n", "<leader>fm", function()
  require("telescope.builtin").marks()
end)
map("n", "<leader>fo", function()
  require("telescope.builtin").oldfiles()
end)
map("n", "<leader>sb", function()
  require("telescope.builtin").git_branches()
end)
map("n", "<leader>sh", function()
  require("telescope.builtin").help_tags()
end)
map("n", "<leader>sm", function()
  require("telescope.builtin").man_pages()
end)
map("n", "<leader>sn", function()
  require("telescope").extensions.notify.notify()
end)
map("n", "<leader>sr", function()
  require("telescope.builtin").registers()
end)
map("n", "<leader>sk", function()
  require("telescope.builtin").keymaps()
end)
map("n", "<leader>sc", function()
  require("telescope.builtin").commands()
end)
map("n", "<leader>ls", function()
  require("telescope.builtin").lsp_document_symbols()
end)
map("n", "<leader>lR", function()
  require("telescope.builtin").lsp_references()
end)
map("n", "<leader>lD", function()
  require("telescope.builtin").diagnostics()
end)

-- SymbolsOutline
map("n", "<leader>lS", "<cmd>SymbolsOutline<CR>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", "<cmd>m .+1<CR>==")
map("v", "<A-k>", "<cmd>m .-2<CR>==")

-- Visual Block --
-- Move text up and down
map("x", "J", "<cmd>move '>+1<CR>gv-gv")
map("x", "K", "<cmd>move '<-2<CR>gv-gv")
map("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv")
map("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv")

-- disable Ex mode:
map("n", "Q", "<Nop>")

-- Terminal
map('t', '<esc>', '<cmd>close<cr>')
map('n', '<leader>tt', function()
  require'configs.toggleterm'.toggle_term('regular')
end)
map('n', '<leader>tg', function()
  require'configs.toggleterm'.toggle_term('lazygit')
end)

return M
