local M = {}

function M.config()
  local g = vim.g
  local fn = vim.fn

  local plugins_count = fn.len(fn.globpath(fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))

  g.dashboard_default_executive = "telescope"

  g.dashboard_custom_header = {
    " ",
    " ",
    " ",
    " ",
    " ",
    " ██████  ██████  ███████  ██████ ██   ██",
    "██       ██   ██ ██      ██      ██   ██",
    "██   ███ ██████  █████   ██      ███████",
    "██    ██ ██   ██ ██      ██      ██   ██",
    " ██████  ██   ██ ███████  ██████ ██   ██",
    " ",
    "     ███    ██ ██    ██ ██ ███    ███",
    "     ████   ██ ██    ██ ██ ████  ████",
    "     ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "     ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "     ██   ████   ████   ██ ██      ██",
    " ",
    " ",
    " ",
  }

  g.dashboard_custom_section = {
    a = { description = { " 📄 Find File                 SPC f f" }, command = "Telescope find_files" },
    b = { description = { " 🔍 Find Word                 SPC f w" }, command = "Telescope live_grep" },
    c = { description = { " 🕐 Recents                   SPC f o" }, command = "Telescope oldfiles" },
    d = { description = { " 💻 Open terminal             SPC t t" }, command = "TglTrm regular" },
    e = { description = { " 🍺 Open LazyGit              SPC t g" }, command = "TglTrm lazygit" },
    f = { description = { " ➕ New File                  SPC f n" }, command = "DashboardNewFile" },
  }

  g.dashboard_custom_footer = {
    " ",
    "Loaded " .. plugins_count .. " plugins ",
  }
end

return M

