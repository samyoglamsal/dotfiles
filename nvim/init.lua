vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.opts")
require("config.keys")
require("config.diagnostics")

vim.cmd.colorscheme("darkvoid")
