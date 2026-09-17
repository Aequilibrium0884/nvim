local mason_python = vim.fn.expand("~/.local/share/mason-python/bin")
vim.env.PATH = mason_python .. ":" .. vim.env.PATH

require("config")
require("pack")
require("mini")
vim.cmd([[ colorscheme onedark ]])
do
  ---@param t table<string,string[]> {filetype, patterns[]}
  ---@return table<string,string>
  local function populate_table(t)
    local tmp = {}
    for filetype, files in pairs(t) do
      for _, file in pairs(files) do
        tmp[file] = filetype
      end
    end
    return tmp
  end

  --defines systemd and podman quadlet filetypes
  local ext_patterns = {
    systemd = {
      "service", "socket", "timer", "mount", "automount",
      "swap", "target", "path", "slice", "scope", "device",
    },
    podman = {
      "container", "volume", "network", "kube", "pod", "build", "image"
    }
  }

  vim.filetype.add {
    extension = populate_table(ext_patterns),
    filename = {},
    pattern = {}
  }

  vim.lsp.config["systemd_lsp"] = {
    cmd = { os.getenv "HOME" .. "/.local/cargo/bin/systemd-lsp" }, -- for linux
    --	cmd = {os.getenv "USERPROFILE".."\\.cargo\\bin\\systemd-lsp"}, -- for windows
    filetypes = { "systemd", "podman" }
  }

  vim.lsp.enable("systemd_lsp")
end
