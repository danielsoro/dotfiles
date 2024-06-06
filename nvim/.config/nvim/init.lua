-- bootstrap lazy.nvim, LazyVim and your plugins
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

require("config.lazy")
require("java").setup()
require("lspconfig").jdtls.setup({})
